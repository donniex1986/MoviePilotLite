import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_detail/controllers/media_detail_service.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/season_episode_detail.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_service.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class MediaSeasonDetailPage extends StatefulWidget {
  const MediaSeasonDetailPage({
    super.key,
    required this.reqPath,
    required this.subscribeMediaKey,
    required this.tmdbId,
    required this.seasonNumber,
    required this.title,
    required this.year,
    required this.doubanId,
    required this.mediaId,
  });
  final String reqPath;
  final String subscribeMediaKey;
  final String tmdbId;
  final int seasonNumber;
  final String title;
  final String year;
  final String doubanId;
  final String mediaId;
  @override
  State<MediaSeasonDetailPage> createState() => _MediaSeasonDetailPageState();
}

class _MediaSeasonDetailPageState extends State<MediaSeasonDetailPage> {
  final _mediaDetailService = Get.find<MediaDetailService>();
  final _subscribeService = Get.find<SubscribeService>();
  List<SeasonEpisodeDetail> _episodes = [];
  bool _loading = true;
  String? _error;
  String? get _tmdbId => widget.tmdbId;
  int? get _seasonNumber => widget.seasonNumber;
  String? get _title => widget.title;
  String? get _year => widget.year;
  String? get _doubanId => widget.doubanId;
  String? get _mediaId => widget.mediaId;
  bool _submitting = false;
  String? get _reqPath => widget.reqPath;

  final _subscribeItem = Rx<SubscribeItem?>(null);

  bool get _isSubscribed =>
      _subscribeItem.value != null && _subscribeItem.value!.id != null;
  @override
  void initState() {
    super.initState();
    _loadEpisodes();
    _loadSubscribeStatus();
  }

  Future<void> _loadSubscribeStatus() async {
    final subscribeItem = await _mediaDetailService.getSubscribeMediaStatus(
      widget.subscribeMediaKey,
      season: _seasonNumber ?? 0,
      title: _title ?? '',
    );
    if (!mounted) return;
    _subscribeItem.value = subscribeItem;
  }

  Future<void> _loadEpisodes() async {
    final tmdbId = _tmdbId ?? '';
    final seasonNumber = _seasonNumber ?? 0;
    if (tmdbId.isEmpty || seasonNumber < 0) {
      setState(() {
        _loading = false;
        _error = '参数缺失';
      });
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final list = await _mediaDetailService.getSeasonDetail(
        reqPath: _reqPath ?? '',
      );
      if (!mounted) return;
      setState(() {
        _episodes = list;
        _loading = false;
        _error = list.isEmpty ? '暂无集数信息' : null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _episodes = [];
        _loading = false;
        _error = '加载失败，请重试';
      });
    }
  }

  Future<void> _onSubscribeTap() async {
    if (_isSubscribed) {
      ToastUtil.warning(
        '是否取消订阅${_title ?? ''}第 $_seasonNumber 季？',
        onConfirm: () async {
          final success = await _subscribeService.cancelSubscribe(
            _subscribeItem.value!.id!.toString(),
          );
          if (success) {
            _subscribeItem.value = null;
            if (mounted) {
              Navigator.of(context).pop();
            }
          }
        },
      );
    } else {
      ToastUtil.warning(
        'TODO://是否订阅${_title ?? ''}第 $_seasonNumber 季？',
        onConfirm: () async {},
      );
    }

    final subscribeController = Get.find<SubscribeController>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('确认订阅'),
        content: Text('确定要订阅《${_title ?? ''}》第 $_seasonNumber 季吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('确定'),
          ),
        ],
      ),
    );
    if (ok != true || _seasonNumber == null) return;
    setState(() => _submitting = true);
    final success = await subscribeController.submitTvSubscribe(
      doubanid: _doubanId ?? '',
      episode_group: '',
      mediaid: _mediaId ?? '',
      name: _title ?? '',
      season: _seasonNumber!,
      tmdbid: _tmdbId,
      year: _year,
    );
    if (!mounted) return;
    setState(() => _submitting = false);
    if (success) {
      Get.snackbar('订阅成功', '已提交第 $_seasonNumber 季订阅');
      Navigator.of(context).pop();
    } else {
      Get.snackbar('订阅失败', '请稍后重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final seasonTitle = '第 $_seasonNumber 季';
    return Scaffold(
      appBar: AppBar(
        title: Text(_title != null ? '$_title · $seasonTitle' : seasonTitle),
        actions: [
          if (_isSubscribed)
            IconButton(
              icon: _isSubscribed
                  ? const Icon(CupertinoIcons.heart_fill)
                  : const Icon(CupertinoIcons.heart),
              tooltip: '订阅该季',
              onPressed: _submitting ? null : _onSubscribeTap,
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _episodes.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _loadEpisodes,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _episodes.length,
              itemBuilder: (context, index) =>
                  _buildEpisodeCard(context, _episodes[index]),
            ),
    );
  }

  Widget _buildEpisodeCard(BuildContext context, SeasonEpisodeDetail ep) {
    final theme = Theme.of(context);
    final stillUrl = ep.still_path != null && ep.still_path!.isNotEmpty
        ? ImageUtil.convertMediaSeasonImageUrl(ep.still_path!)
        : '';
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (stillUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedImage(
                      imageUrl: stillUrl,
                      width: 120,
                      height: 68,
                      fit: BoxFit.cover,
                      errorWidget: _episodePlaceholder(theme, 120, 68),
                    ),
                  )
                else
                  _episodePlaceholder(theme, 120, 68),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '第 ${ep.episode_number ?? 0} 集 · ${ep.name ?? '未知'}',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (ep.air_date != null && ep.air_date!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          ep.air_date!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (ep.vote_average != null && ep.vote_average! > 0) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              ep.vote_average!.toStringAsFixed(1),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (ep.runtime != null && ep.runtime! > 0)
                        Text(
                          '${ep.runtime} 分钟',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (ep.overview != null && ep.overview!.trim().isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                ep.overview!.trim(),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ],
            if (ep.crew != null && ep.crew!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: ep.crew!
                    .take(5)
                    .map(
                      (c) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${c.job ?? ''} ${c.name ?? ''}'.trim(),
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (ep.guest_stars != null && ep.guest_stars!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                '客串：${ep.guest_stars!.take(3).map((g) => g.name ?? g.character ?? '').where((s) => s.isNotEmpty).join('、')}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _episodePlaceholder(ThemeData theme, double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.tv_outlined,
        color: theme.colorScheme.onSurfaceVariant,
        size: 28,
      ),
    );
  }
}
