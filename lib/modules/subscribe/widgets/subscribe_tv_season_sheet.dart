import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_detail/controllers/media_detail_service.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_detail_model.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_notexists.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class SubscribeTvSeasonSheet extends StatefulWidget {
  const SubscribeTvSeasonSheet({
    super.key,
    required this.tmdbId,
    required this.title,
    required this.year,
    required this.season,
    this.itemInfo,
  });
  final String? tmdbId;
  final String? title;
  final String? year;
  final String? season;
  final Map<String, dynamic>? itemInfo;

  @override
  State<SubscribeTvSeasonSheet> createState() => _SubscribeTvSeasonSheetState();
}

class SeasonStateInfo {
  final SeasonInfo seasonInfo;
  final MediaNotExists? mediaNotExists;
  SeasonStateInfo({required this.seasonInfo, this.mediaNotExists});

  bool get isMissing =>
      mediaNotExists != null &&
      ((mediaNotExists!.episodes?.isNotEmpty ?? false) ||
          (mediaNotExists!.total_episode ?? 0) > 0);
}

class _SubscribeTvSeasonSheetState extends State<SubscribeTvSeasonSheet> {
  final _subscribeController = Get.find<SubscribeController>();
  final _mediaDetailService = Get.find<MediaDetailService>();

  List<SeasonStateInfo> _seasonInfoList = [];
  final Set<int> _selectedSeasonNumbers = {};
  bool _loading = true;
  String? _loadError;
  String _selectedEpisodeGroupId = '';
  List<EpisodeGroupOption> _episodeGroupOptions = [];
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _initEpisodeGroups();
    _loadData();
  }

  void _initEpisodeGroups() {
    _episodeGroupOptions = [const EpisodeGroupOption(id: '', name: '默认')];
    final groups = widget.itemInfo?['episode_groups'];
    if (groups is List) {
      for (final g in groups) {
        if (g is Map<String, dynamic>) {
          final id = g['id']?.toString() ?? '';
          final name = g['name']?.toString() ?? id;
          if (id.isNotEmpty || _episodeGroupOptions.length == 1) {
            _episodeGroupOptions.add(EpisodeGroupOption(id: id, name: name));
          }
        }
      }
    }
    if (_episodeGroupOptions.isNotEmpty) {
      _selectedEpisodeGroupId = _episodeGroupOptions.first.id;
    }
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final seasonInfo = await _mediaDetailService.getSeasonInfo(
        mediaId: widget.tmdbId ?? '',
        season: widget.season ?? '',
        title: widget.title ?? '',
        year: widget.year ?? '',
      );
      final mediaNotExists = await _mediaDetailService.getMediaNotExists(
        widget.itemInfo ?? {},
      );
      final merged = <SeasonStateInfo>[];
      for (final el in seasonInfo) {
        final sn = el.season_number;
        MediaNotExists? notExists;
        if (sn != null) {
          try {
            notExists = mediaNotExists.where((e) => e.season == sn).first;
          } catch (_) {}
        }
        merged.add(SeasonStateInfo(seasonInfo: el, mediaNotExists: notExists));
      }
      if (!mounted) return;
      setState(() {
        _seasonInfoList = merged;
        _loading = false;
        _loadError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _seasonInfoList = [];
        _loading = false;
        _loadError = '加载季信息失败，请稍后重试';
      });
    }
  }

  void _toggleSeason(int seasonNumber) {
    setState(() {
      if (_selectedSeasonNumbers.contains(seasonNumber)) {
        _selectedSeasonNumbers.remove(seasonNumber);
      } else {
        _selectedSeasonNumbers.add(seasonNumber);
      }
    });
  }

  Future<void> _onSubmit() async {
    if (_selectedSeasonNumbers.isEmpty || _submitting) return;
    final item = widget.itemInfo ?? {};
    final doubanId = item['douban_id']?.toString() ?? '';
    final name = widget.title ?? item['name']?.toString() ?? '';
    final tmdbId = widget.tmdbId ?? item['tmdb_id']?.toString() ?? '';
    final year = widget.year ?? item['year']?.toString() ?? '';
    final mediaId = item['media_id']?.toString() ?? '';

    setState(() => _submitting = true);
    var successCount = 0;
    for (final seasonNum in _selectedSeasonNumbers) {
      final ok = await _subscribeController.submitTvSubscribe(
        doubanid: doubanId,
        episode_group: _selectedEpisodeGroupId.isEmpty
            ? ''
            : _selectedEpisodeGroupId,
        mediaid: mediaId.isEmpty ? '' : mediaId,
        name: name,
        season: seasonNum,
        tmdbid: tmdbId.isEmpty ? null : tmdbId,
        year: year.isEmpty ? null : year,
      );
      if (ok.success == true) {
        successCount++;
      } else {
        Get.snackbar('订阅失败', ok.message ?? '请稍后重试');
      }
    }
    if (!mounted) return;
    setState(() => _submitting = false);
    if (successCount > 0) {
      Navigator.of(context).pop(true);
      Get.snackbar('订阅成功', '已提交 $successCount 季的订阅');
    } else {
      Get.snackbar('订阅失败', '请稍后重试');
    }
  }

  static String _formatAirDate(String? airDate) {
    if (airDate == null || airDate.isEmpty) return '';
    final parts = airDate.split('-');
    if (parts.length >= 3) {
      return '首播于 ${parts[0]}年${parts[1]}月${parts[2]}日';
    }
    return airDate;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('订阅 - ${widget.title ?? ''}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildEpisodeGroupSection(theme),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _loadError != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _loadError!,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: _loadData,
                            child: const Text('重试'),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: _seasonInfoList.length,
                    itemBuilder: (context, index) =>
                        _buildSeasonItem(context, _seasonInfoList[index]),
                  ),
          ),
          _buildBottomButton(theme),
        ],
      ),
    );
  }

  Widget _buildEpisodeGroupSection(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '选择剧集组',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedEpisodeGroupId,
                isExpanded: true,
                items: _episodeGroupOptions
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.id,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  setState(() => _selectedEpisodeGroupId = v ?? '');
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildSeasonItem(BuildContext context, SeasonStateInfo state) {
    final theme = Theme.of(context);
    final s = state.seasonInfo;
    final seasonNum = s.season_number ?? -1;
    final canSelect = !state.isMissing;
    final selected = _selectedSeasonNumbers.contains(seasonNum);
    final imageUrl = ImageUtil.convertMediaSeasonImageUrl(s.poster_path ?? '');
    final year = s.air_date != null && s.air_date!.length >= 4
        ? s.air_date!.substring(0, 4)
        : '';
    final episodeCount = s.episode_count ?? 0;
    final rating = s.vote_average;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: canSelect ? () => _toggleSeason(seasonNum) : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedImage(
                  imageUrl: imageUrl,
                  width: 80,
                  height: 110,
                  fit: BoxFit.cover,
                  errorWidget: Container(
                    width: 80,
                    height: 110,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.tv_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.name ?? '第${seasonNum}季',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (rating != null && rating > 0) ...[
                          Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating.toStringAsFixed(1),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          '$year·${episodeCount}集',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatAirDate(s.air_date),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (state.isMissing) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '缺失',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Switch(
                value: selected,
                onChanged: canSelect
                    ? (v) {
                        if (v) {
                          _selectedSeasonNumbers.add(seasonNum);
                        } else {
                          _selectedSeasonNumbers.remove(seasonNum);
                        }
                        setState(() {});
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(ThemeData theme) {
    final count = _selectedSeasonNumbers.length;
    final enabled = count > 0 && !_submitting;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: FilledButton(
          onPressed: enabled ? _onSubmit : null,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _submitting
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(count > 0 ? '订阅 $count 季' : '请选择订阅季'),
        ),
      ),
    );
  }
}

class EpisodeGroupOption {
  const EpisodeGroupOption({required this.id, required this.name});
  final String id;
  final String name;
}
