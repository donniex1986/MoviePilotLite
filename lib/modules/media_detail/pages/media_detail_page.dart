import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/media_detail/controllers/media_detail_controller.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_detail_model.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_notexists.dart';
import 'package:moviepilot_mobile/modules/media_detail/pages/media_season_detail_page.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/modules/search/pages/search_page.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediaDetailPage extends GetWidget<MediaDetailController> {
  const MediaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Obx(() {
          final detail = controller.mediaDetail.value;
          final isLoading = controller.isLoading.value;
          final errorText = controller.errorText.value;
          final hasError = errorText != null && errorText.trim().isNotEmpty;
          if (detail == null && !isLoading) {
            if (hasError) {
              return _buildErrorState(context, errorText);
            }
            return _buildEmptyState(context);
          }

          final viewDetail = detail ?? _skeletonDetail();
          return Skeletonizer(
            enabled: isLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                _buildSliverAppBar(context, viewDetail),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: _buildContent(
                      context,
                      viewDetail,
                      errorText: hasError && !isLoading ? errorText : null,
                      isLoading: isLoading,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_circle,
              size: 48,
              color: CupertinoColors.systemRed,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.fetchDetail,
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.photo,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            const SizedBox(height: 12),
            Text('暂无详情数据', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context, MediaDetail? detail) {
    final posterUrl = _resolveImageUrl(detail?.poster_path);
    final backdropUrl = _resolveImageUrl(detail?.backdrop_path);

    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 360,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.5),
            borderRadius: BorderRadius.circular(44),
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.chevron_left, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (backdropUrl != null)
              CachedImage(imageUrl: backdropUrl, fit: BoxFit.cover)
            else
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2D2F3A), Color(0xFF0F1115)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.75),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildPoster(posterUrl),
                    const SizedBox(width: 14),
                    Expanded(child: _buildHeaderInfo(context, detail)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(String? posterUrl) {
    if (posterUrl == null) {
      return Container(
        width: 110,
        height: 165,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          CupertinoIcons.photo,
          color: Colors.white70,
          size: 32,
        ),
      );
    }
    return Container(
      width: 110,
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: CachedImage(
        imageUrl: posterUrl,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildHeaderInfo(BuildContext context, MediaDetail? detail) {
    final subtitle = _subtitle(detail);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _displayTitle(detail),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: [
            if (detail?.year != null && detail?.year!.isNotEmpty == true)
              _buildMetaChip(detail?.year),
            if (detail?.type != null && detail?.type!.isNotEmpty == true)
              _buildMetaChip(detail?.type),
            if (detail?.category != null &&
                detail?.category!.isNotEmpty == true)
              _buildMetaChip(detail?.category),
            if (detail?.vote_average != null && detail!.vote_average! > 0)
              _buildScoreChip(detail.vote_average!),
          ],
        ),
      ],
    );
  }

  Widget _buildMetaChip(String? text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildScoreChip(double? score) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF7C4DFF).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(CupertinoIcons.star_fill, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            score?.toStringAsFixed(1) ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    MediaDetail detail, {
    String? errorText,
    bool isLoading = false,
  }) {
    final overview = detail.overview?.trim().isNotEmpty == true
        ? detail.overview!.trim()
        : '暂无简介';
    final similarItems = controller.similarItems.toList();
    final recommendItems = controller.recommendItems.toList();
    final similarLoading = controller.isLoadingSimilar.value;
    final recommendLoading = controller.isLoadingRecommend.value;
    final similarError = controller.errorSimilar.value;
    final recommendError = controller.errorRecommend.value;
    final similarSupported = controller.similarSupported.value;
    final recommendSupported = controller.recommendSupported.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildActionSection(context, detail, isLoading),
        const SizedBox(height: 16),
        if (errorText != null && errorText.trim().isNotEmpty) ...[
          _buildSectionTitle('请求错误'),
          Section(child: _buildErrorBanner(errorText)),
          const SizedBox(height: 12),
        ],
        if (detail.tagline != null && detail.tagline!.trim().isNotEmpty) ...[
          _buildSectionTitle('Tagline'),
          Section(
            child: Text(
              detail.tagline!.trim(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 12),
        ],
        _buildSectionTitle('简介'),
        Section(
          child: Text(overview, style: Theme.of(context).textTheme.bodyMedium),
        ),
        if (_hasExternalLinks(detail)) ...[
          const SizedBox(height: 12),
          _buildSectionTitle('相关链接'),
          Section(child: _buildExternalLinks(detail, isLoading)),
        ],
        const SizedBox(height: 16),
        _buildSectionTitle('核心信息'),
        Section(child: _buildInfoList(context, detail)),
        const SizedBox(height: 16),
        if (detail.genres != null && detail.genres!.isNotEmpty) ...[
          _buildSectionTitle('类型'),
          Section(child: _buildGenreChips(detail)),
          const SizedBox(height: 16),
        ],
        if (detail.season_info != null && detail.season_info!.isNotEmpty) ...[
          _buildSectionTitle('季度信息'),
          Obx(
            () => _buildSeasonList(
              context,
              detail.season_info!,
              detail,
              controller.mediaNotExists.toList(),
              Map<int, SubscribeItem>.from(controller.seasonSubscribeMap),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (detail.actors != null && detail.actors!.isNotEmpty) ...[
          _buildSectionTitle('主演'),
          _buildActorList(detail.actors!),
          const SizedBox(height: 16),
        ],
        if (detail.created_by != null && detail.created_by!.isNotEmpty) ...[
          _buildSectionTitle('主创'),
          _buildCreatorList(detail.created_by!),
          const SizedBox(height: 16),
        ],
        if (similarSupported &&
            _shouldShowRelatedSection(
              similarItems,
              similarLoading,
              similarError,
            )) ...[
          const SizedBox(height: 16),
          _buildSectionTitle(_relatedSectionTitle(detail, isSimilar: true)),
          _buildRelatedRail(
            context,
            items: similarItems,
            isLoading: similarLoading,
            errorText: similarError,
          ),
        ],
        if (recommendSupported &&
            _shouldShowRelatedSection(
              recommendItems,
              recommendLoading,
              recommendError,
            )) ...[
          const SizedBox(height: 16),
          _buildSectionTitle(_relatedSectionTitle(detail, isSimilar: false)),
          _buildRelatedRail(
            context,
            items: recommendItems,
            isLoading: recommendLoading,
            errorText: recommendError,
          ),
        ],
      ],
    );
  }

  Widget _buildErrorBanner(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          CupertinoIcons.exclamationmark_triangle,
          color: CupertinoColors.systemRed,
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: CupertinoColors.systemRed),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildInfoList(BuildContext context, MediaDetail? detail) {
    if (detail == null) {
      return Text('暂无核心信息', style: Theme.of(context).textTheme.bodyMedium);
    }
    final infoItems = <MapEntry<String, String>>[];
    final firstAir = detail.first_air_date ?? detail.release_date;
    if (firstAir != null && firstAir.isNotEmpty) {
      infoItems.add(MapEntry('首播', firstAir));
    }
    if (detail.last_air_date != null && detail.last_air_date!.isNotEmpty) {
      infoItems.add(MapEntry('最后播出', detail.last_air_date!));
    }
    if (detail.number_of_seasons != null && detail.number_of_seasons! > 0) {
      infoItems.add(MapEntry('季数', detail.number_of_seasons!.toString()));
    }
    if (detail.number_of_episodes != null && detail.number_of_episodes! > 0) {
      infoItems.add(MapEntry('集数', detail.number_of_episodes!.toString()));
    }
    final runtime = _formatRuntime(detail);
    if (runtime != null) {
      infoItems.add(MapEntry('时长', runtime));
    }
    if (detail.status != null && detail.status!.isNotEmpty) {
      infoItems.add(MapEntry('状态', detail.status!));
    }
    if (detail.original_language != null &&
        detail.original_language!.isNotEmpty) {
      infoItems.add(MapEntry('语言', detail.original_language!));
    }
    if (detail.origin_country != null && detail.origin_country!.isNotEmpty) {
      infoItems.add(MapEntry('地区', detail.origin_country!.join(' / ')));
    }
    if (detail.networks != null && detail.networks!.isNotEmpty) {
      infoItems.add(
        MapEntry(
          '播出平台',
          detail.networks!.map((e) => e.name).whereType<String>().join(' / '),
        ),
      );
    }
    if (detail.homepage != null && detail.homepage!.isNotEmpty) {
      infoItems.add(MapEntry('官网', detail.homepage!));
    }

    if (infoItems.isEmpty) {
      return Text('暂无核心信息', style: Theme.of(context).textTheme.bodyMedium);
    }

    return Column(
      children: infoItems
          .map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildGenreChips(MediaDetail detail) {
    final genres = detail.genres ?? const [];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres
          .map(
            (genre) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                genre.name ?? '未知',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildNextEpisode(NextEpisodeToAir nextEpisode) {
    final info = <String, String>{};
    if (nextEpisode.season_number != null) {
      info['季'] = '第 ${nextEpisode.season_number} 季';
    }
    if (nextEpisode.episode_number != null) {
      info['集'] = '第 ${nextEpisode.episode_number} 集';
    }
    if (nextEpisode.air_date != null && nextEpisode.air_date!.isNotEmpty) {
      info['播出'] = nextEpisode.air_date!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nextEpisode.name?.isNotEmpty == true ? nextEpisode.name! : '即将播出',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: info.entries
              .map(
                (entry) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${entry.key}: ${entry.value}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSeasonList(
    BuildContext context,
    List<SeasonInfo> seasons,
    MediaDetail detail,
    List<MediaNotExists> notExistsList,
    Map<int, SubscribeItem> seasonSubscribeMap,
  ) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: seasons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final season = seasons[index];
          final sn = season.season_number;
          MediaNotExists? notExists;
          if (sn != null) {
            for (final e in notExistsList) {
              if (e.season == sn) {
                notExists = e;
                break;
              }
            }
          }
          final isMissing =
              notExists != null &&
              ((notExists.episodes?.isNotEmpty ?? false) ||
                  (notExists.total_episodes ?? 0) > 0);
          final isSubscribed = sn != null && seasonSubscribeMap[sn] != null;
          final posterUrl = ImageUtil.convertMediaSeasonImageUrl(
            season.poster_path ?? '',
          );
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => MediaSeasonDetailPage(
                  reqPath: controller.seasonMediaKey(detail, sn ?? 0),
                  tmdbId: detail.tmdb_id?.toString() ?? '',
                  seasonNumber: sn ?? 0,
                  title: detail.title ?? '',
                  year: detail.year ?? '',
                  doubanId: detail.douban_id?.toString() ?? '',
                  mediaId: detail.media_id ?? '',
                ),
              ),
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14),
                          ),
                          child: CachedImage(
                            imageUrl: posterUrl,
                            height: 105,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: Container(
                              height: 105,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: Icon(
                                Icons.tv_outlined,
                                color: theme.colorScheme.onSurfaceVariant,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                        if (isMissing)
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
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
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        if (isSubscribed)
                          Positioned(
                            top: 6,
                            left: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '已订阅',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        if (season.vote_average != null &&
                            season.vote_average! > 0)
                          Positioned(
                            bottom: 6,
                            left: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 12,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    season.vote_average!.toStringAsFixed(1),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _seasonTitle(season),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            season.air_date ?? '未定档',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 11,
                            ),
                          ),
                          if (season.episode_count != null)
                            Text(
                              '${season.episode_count} 集',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActorList(List<Actor> actors) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final actor = actors[index];
          final avatarUrl = _resolveImageUrl(actor.avatar?.large);
          return SizedBox(
            width: 90,
            child: Column(
              children: [
                if (avatarUrl != null)
                  CachedAvatar(imageUrl: avatarUrl, radius: 32)
                else
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: CupertinoColors.systemGrey5,
                    child: Icon(
                      CupertinoIcons.person,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  actor.name ?? '未知演员',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
                if (actor.character != null && actor.character!.isNotEmpty)
                  Text(
                    actor.character!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCreatorList(List<CreatedBy> creators) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: creators.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final creator = creators[index];
          final avatarUrl = _resolveImageUrl(creator.profile_path);
          return SizedBox(
            width: 90,
            child: Column(
              children: [
                if (avatarUrl != null)
                  CachedAvatar(imageUrl: avatarUrl, radius: 28)
                else
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: CupertinoColors.systemGrey5,
                    child: Icon(
                      CupertinoIcons.person,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  creator.name ?? '未知',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    MediaDetail detail,
    bool isLoading,
  ) {
    final isTv = _isTv(detail);
    return Obx(() {
      final movieSubscribed = controller.movieSubscribeItem.value != null;
      final seasons = detail.season_info;
      return LayoutBuilder(
        builder: (context, constraints) {
          final search = _buildPrimaryAction(
            label: '搜索资源',
            icon: CupertinoIcons.search,
            onPressed: isLoading ? null : () => _openSearch(context),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          );
          if (isTv && seasons?.isNotEmpty == true) {
            return Row(children: [Expanded(child: search)]);
          }
          final subscribe = _buildPrimaryAction(
            label: movieSubscribed ? '已订阅' : '订阅',
            icon: CupertinoIcons.heart_fill,
            onPressed: isLoading
                ? null
                : movieSubscribed
                ? _cancelSubscribe
                : _handleSubscribe,
            backgroundColor: movieSubscribed
                ? Colors.red
                : Theme.of(context).colorScheme.primary,
            foregroundColor: movieSubscribed ? Colors.white : null,
          );
          final isNarrow = constraints.maxWidth < 340;
          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [subscribe, const SizedBox(height: 10), search],
            );
          }
          return Row(
            children: [
              Expanded(child: subscribe),
              const SizedBox(width: 12),
              Expanded(child: search),
            ],
          );
        },
      );
    });
  }

  Widget _buildActionSection(
    BuildContext context,
    MediaDetail detail,
    bool isLoading,
  ) {
    return _buildActionButtons(context, detail, isLoading);
  }

  Widget _buildExternalLinks(MediaDetail detail, bool isLoading) {
    final actions = <Widget>[];
    final tmdbUrl = _tmdbUrl(detail);
    if (tmdbUrl != null) {
      actions.add(
        _buildLinkAction(
          label: 'TMDB',
          onPressed: isLoading ? null : () => WebUtil.open(url: tmdbUrl),
        ),
      );
    }
    final imdbUrl = _imdbUrl(detail);
    if (imdbUrl != null) {
      actions.add(
        _buildLinkAction(
          label: 'IMDB',
          onPressed: isLoading ? null : () => WebUtil.open(url: imdbUrl),
        ),
      );
    }
    final doubanUrl = _doubanUrl(detail);
    if (doubanUrl != null) {
      actions.add(
        _buildLinkAction(
          label: '豆瓣',
          onPressed: isLoading ? null : () => WebUtil.open(url: doubanUrl),
        ),
      );
    }
    return Wrap(spacing: 10, runSpacing: 10, children: actions);
  }

  bool _hasExternalLinks(MediaDetail detail) {
    return _tmdbUrl(detail) != null ||
        _imdbUrl(detail) != null ||
        _doubanUrl(detail) != null;
  }

  bool _shouldShowRelatedSection(
    List<RecommendApiItem> items,
    bool isLoading,
    String? errorText,
  ) {
    return items.isNotEmpty || isLoading || (errorText?.isNotEmpty ?? false);
  }

  String _relatedSectionTitle(MediaDetail detail, {required bool isSimilar}) {
    final isTv = _isTv(detail);
    if (isSimilar) {
      return isTv ? '类似剧集' : '类似影片';
    }
    return isTv ? '推荐剧集' : '推荐影片';
  }

  Widget _buildRelatedRail(
    BuildContext context, {
    required List<RecommendApiItem> items,
    required bool isLoading,
    String? errorText,
  }) {
    if (items.isEmpty) {
      if (isLoading) return _buildRelatedPlaceholder();
      if (errorText != null && errorText.isNotEmpty) {
        return _buildRelatedError(context, errorText);
      }
      return _buildRelatedEmpty(context);
    }

    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          return RecommendItemCard(
            item: item,
            onTap: () => _openRelatedDetail(item),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: items.length,
      ),
    );
  }

  Widget _buildRelatedPlaceholder() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (context, index) =>
            RecommendItemCard(width: 150, item: null),
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: 6,
      ),
    );
  }

  Widget _buildRelatedError(BuildContext context, String message) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Text(
          message,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildRelatedEmpty(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Text(
          '暂无数据',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ),
    );
  }

  void _openRelatedDetail(RecommendApiItem item) {
    final path = _buildMediaPath(item);
    if (path == null) {
      ToastUtil.info('暂无可用详情信息');
      return;
    }
    final title = _bestTitle(item);
    final params = <String, String>{
      'path': path,
      if (title != null && title.isNotEmpty) 'title': title,
      if (item.year != null && item.year!.isNotEmpty) 'year': item.year!,
      if (item.type != null && item.type!.isNotEmpty) 'type_name': item.type!,
    };
    Get.toNamed('/media-detail', parameters: params, preventDuplicates: true);
  }

  String? _bestTitle(RecommendApiItem item) {
    final title = item.title;
    if (title != null && title.trim().isNotEmpty) return title.trim();
    final enTitle = item.en_title;
    if (enTitle != null && enTitle.trim().isNotEmpty) return enTitle.trim();
    final original = item.original_title ?? item.original_name;
    if (original != null && original.trim().isNotEmpty) {
      return original.trim();
    }
    return null;
  }

  String? _buildMediaPath(RecommendApiItem item) {
    final prefix = item.mediaid_prefix;
    final mediaId = item.media_id;
    if (prefix != null &&
        prefix.isNotEmpty &&
        mediaId != null &&
        mediaId.isNotEmpty) {
      return '$prefix:$mediaId';
    }
    final tmdbId = item.tmdb_id;
    if (tmdbId != null && tmdbId.isNotEmpty) {
      return 'tmdb:$tmdbId';
    }
    final doubanId = item.douban_id;
    if (doubanId != null && doubanId.isNotEmpty) {
      return 'douban:$doubanId';
    }
    final bangumiId = item.bangumi_id;
    if (bangumiId != null && bangumiId.isNotEmpty) {
      return 'bangumi:$bangumiId';
    }
    return null;
  }

  Widget _buildPrimaryAction({
    required String label,
    required IconData icon,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildLinkAction({required String label, VoidCallback? onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }

  void _handleSubscribe() {
    ToastUtil.info('订阅功能开发中');
  }

  void _cancelSubscribe() {
    ToastUtil.warning('确定取消订阅吗？', onConfirm: () => ToastUtil.info('取消订阅功能开发中'));
  }

  void _openSearch(BuildContext context) {
    Get.to(
      () => const SearchPage(),
      // binding: BindingsBuilder(() {
      //   if (!Get.isRegistered<SearchPageController>()) {
      //     Get.put(SearchController());
      //   }
      // }),
    );
  }

  String? _tmdbUrl(MediaDetail detail) {
    final link = detail.detail_link;
    if (link != null && link.trim().isNotEmpty) return link.trim();
    final tmdbId = detail.tmdb_id;
    if (tmdbId == null) return null;
    final typeSegment = _isTv(detail) ? 'tv' : 'movie';
    return 'https://www.themoviedb.org/$typeSegment/$tmdbId';
  }

  String? _imdbUrl(MediaDetail detail) {
    final imdbId = detail.imdb_id;
    if (imdbId == null || imdbId.trim().isEmpty) return null;
    return 'https://www.imdb.com/title/${imdbId.trim()}';
  }

  String? _doubanUrl(MediaDetail detail) {
    final doubanId = detail.douban_id;
    if (doubanId == null || doubanId <= 0) return null;
    return 'https://movie.douban.com/subject/$doubanId/';
  }

  bool _isTv(MediaDetail detail) {
    final type = detail.type?.toLowerCase();
    if (type != null) {
      if (type.contains('剧') ||
          type.contains('tv') ||
          type.contains('series')) {
        return true;
      }
      if (type.contains('电影') || type.contains('movie')) {
        return false;
      }
    }
    if (detail.number_of_seasons != null && detail.number_of_seasons! > 0) {
      return true;
    }
    return false;
  }

  String _displayTitle(MediaDetail? detail) {
    final title = detail?.title;
    if (title != null && title.trim().isNotEmpty) return title;
    final original = detail?.original_title ?? detail?.original_name;
    if (original != null && original.trim().isNotEmpty) return original;
    return '未知标题';
  }

  String? _subtitle(MediaDetail? detail) {
    final subtitle = detail?.en_title;
    if (subtitle != null && subtitle.trim().isNotEmpty) return subtitle;
    final origin = detail?.original_title ?? detail?.original_name;
    if (origin != null && origin.trim().isNotEmpty) {
      if (origin != detail?.title) return origin;
    }
    return null;
  }

  String? _formatRuntime(MediaDetail? detail) {
    if (detail == null) return null;
    if (detail.runtime != null && detail.runtime! > 0) {
      return '${detail.runtime} 分钟';
    }
    final runtimeList = detail.episode_run_time;
    if (runtimeList != null && runtimeList.isNotEmpty) {
      final value = runtimeList.firstWhere((item) => item > 0, orElse: () => 0);
      if (value > 0) return '$value 分钟/集';
    }
    return null;
  }

  String _seasonTitle(SeasonInfo season) {
    final name = season.name;
    if (name != null && name.trim().isNotEmpty) return name;
    if (season.season_number != null) {
      return '第 ${season.season_number} 季';
    }
    return '未知季度';
  }

  String? _resolveImageUrl(String? path) {
    if (path == null || path.trim().isEmpty) return null;
    final trimmed = path.trim();
    return ImageUtil.convertCacheImageUrl(trimmed);
  }

  MediaDetail _skeletonDetail() {
    return MediaDetail(
      title: '加载中',
      en_title: 'Loading',
      year: '2024',
      type: '电视剧',
      category: '分类',
      vote_average: 8.6,
      overview: '加载中...',
      first_air_date: '2024-01-01',
      last_air_date: '2024-01-01',
      number_of_seasons: 2,
      number_of_episodes: 12,
      status: 'Returning Series',
      original_language: 'en',
      origin_country: const ['US'],
      genres: const [
        Genre(name: '剧情'),
        Genre(name: '爱情'),
      ],
      season_info: const [
        SeasonInfo(
          name: '第 1 季',
          air_date: '2024-01-01',
          episode_count: 8,
          season_number: 1,
        ),
        SeasonInfo(
          name: '第 2 季',
          air_date: '2025-01-01',
          episode_count: 8,
          season_number: 2,
        ),
      ],
      actors: const [
        Actor(name: '演员 A', character: '角色 A'),
        Actor(name: '演员 B', character: '角色 B'),
        Actor(name: '演员 C', character: '角色 C'),
      ],
      created_by: const [
        CreatedBy(name: '主创 A'),
        CreatedBy(name: '主创 B'),
      ],
      names: const ['别名 A', '别名 B'],
    );
  }
}
