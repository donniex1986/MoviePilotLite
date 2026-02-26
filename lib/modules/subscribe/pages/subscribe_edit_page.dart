import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_edit_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/pages/priority_rule_order_picker_page.dart';
import 'package:moviepilot_mobile/modules/subscribe/pages/site_multi_select_picker_page.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 订阅编辑页
/// UI 参照 iOS 联系人编辑页：圆角分组、无图标、标题上输入下的布局
class SubscribeEditPage extends GetView<SubscribeEditController> {
  const SubscribeEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = CupertinoColors.systemGroupedBackground.resolveFrom(
      context,
    );
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(CupertinoIcons.chevron_left, size: 28),
        ),
        middle: Row(
          children: [
            CachedImage(
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(32),
              imageUrl: ImageUtil.convertCacheImageUrl(
                controller.item.poster ?? '',
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${controller.item.name}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: CupertinoColors.label.resolveFrom(context),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              onPressed: () {
                ToastUtil.warning(
                  '确定取消订阅吗？',
                  onConfirm: () async {
                    final ok = await controller.deleteSubscribe();
                    if (ok && context.mounted) Get.back(result: true);
                  },
                );
              },
              child: Text(
                '取消订阅',
                style: TextStyle(
                  color: CupertinoColors.destructiveRed.resolveFrom(context),
                  fontSize: 16,
                ),
              ),
            ),
            Obx(
              () => CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onPressed: controller.isSaving.value
                    ? null
                    : () async {
                        final ok = await controller.save();
                        if (ok && context.mounted) Get.back(result: true);
                      },
                child: controller.isSaving.value
                    ? CupertinoActivityIndicator(
                        color: CupertinoColors.activeBlue.resolveFrom(context),
                      )
                    : Text(
                        '保存',
                        style: TextStyle(
                          color: CupertinoColors.activeBlue.resolveFrom(
                            context,
                          ),
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    ..._buildAllSectionsAsBox(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 返回非 Sliver 的 section 列表，用于 Padding + Column
  List<Widget> _buildAllSectionsAsBox(BuildContext context) {
    final list = <Widget>[];
    for (final w in _buildAllSections(context)) {
      if (w is SliverToBoxAdapter) list.add(w.child!);
    }
    return list;
  }

  /// 整页最底层背景图（无渐变），上层叠 blur + 遮罩
  Widget _buildBackdropImageOnly(BuildContext context) {
    var url = controller.item.backdrop;
    if (url == null || url.isEmpty) url = controller.item.poster;
    if (url != null && url.isNotEmpty) {
      return CachedImage(
        imageUrl: ImageUtil.convertCacheImageUrl(url),
        fit: BoxFit.cover,
      );
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5C6BC0), Color(0xFF3949AB)],
        ),
      ),
    );
  }

  List<Widget> _buildAllSections(BuildContext context) {
    return [
      _buildSection(
        context,
        header: '搜索',
        children: [
          _buildTextRow(
            context,
            title: '搜索关键词',
            description: '指定搜索站点时使用的关键词',
            value: controller.keyword.value,
            onChanged: controller.setKeyword,
            hint: '搜索关键词',
          ),
        ],
      ),
      if (controller.item.type?.contains('电视') == true)
        _buildSection(
          context,
          header: '剧集信息',
          children: [
            _buildNumberRow(
              context,
              title: '总集数',
              description: '剧集总集数',
              value: controller.totalEpisode.value,
              onChanged: controller.setTotalEpisode,
            ),
            _buildNumberRow(
              context,
              title: '开始集数',
              description: '开始订阅集数',
              value: controller.startEpisode.value,
              onChanged: controller.setStartEpisode,
            ),
          ],
        ),
      _buildSection(
        context,
        header: '订阅资源属性',
        children: [
          _buildSelectRow(
            context,
            title: '质量',
            description: '订阅资源质量',
            value: controller.quality.value,
            options: SubscribeEditController.qualityOptions,
            onChanged: controller.setQuality,
          ),
          _buildSelectRow(
            context,
            title: '分辨率',
            description: '订阅资源分辨率',
            value: controller.resolution.value,
            options: SubscribeEditController.resolutionOptions,
            onChanged: controller.setResolution,
          ),
          _buildSelectRow(
            context,
            title: '特效',
            description: '订阅资源特效',
            value: controller.effect.value,
            options: SubscribeEditController.effectOptions,
            onChanged: controller.setEffect,
          ),
        ],
      ),
      _buildSection(
        context,
        header: '订阅站点',
        children: [_buildSitePicker(context)],
      ),
      _buildSection(
        context,
        header: '下载设置',
        children: [
          _buildDownloaderPicker(context),
          _buildSavePathPicker(context),
        ],
      ),
      _buildSection(
        context,
        header: '开关设置',
        children: [
          SettingsFieldRow(
            title: '洗版',
            description: '根据洗版优先级进行洗版订阅',
            compact: true,
            controlType: SettingsControlType.toggle,
            editable: true,
            switchValue: controller.bestVersion.value,
            onSwitchChanged: controller.setBestVersion,
          ),
          SettingsFieldRow(
            title: '使用 ImdbID 搜索',
            description: '开启使用 ImdbID 精确搜索资源',
            compact: true,
            controlType: SettingsControlType.toggle,
            editable: true,
            switchValue: controller.searchImdbid.value,
            onSwitchChanged: controller.setSearchImdbid,
          ),
        ],
      ),
      _buildSection(
        context,
        header: '包含/排除规则',
        children: [
          _buildTextRow(
            context,
            title: '包含',
            description: '包含规则，支持正则表达式',
            value: controller.include.value,
            onChanged: controller.setInclude,
            hint: '关键字、正则式',
          ),
          _buildTextRow(
            context,
            title: '排除',
            description: '排除规则，支持正则表达式',
            value: controller.exclude.value,
            onChanged: controller.setExclude,
            hint: '关键字、正则式',
          ),
        ],
      ),
      _buildSection(
        context,
        header: '优先级规则',
        children: [_buildPriorityRulePicker(context)],
      ),
      if (controller.item.type?.contains('电视') == true)
        _buildSection(
          context,
          header: '剧集/季指定',
          children: [
            _buildTextRow(
              context,
              title: '指定剧集组',
              description: '按特定剧集组识别和刮削',
              value: controller.episodeGroup.value,
              onChanged: controller.setEpisodeGroup,
              hint: '指定剧集组',
            ),
            _buildSeasonPicker(context),
          ],
        ),
      _buildSection(
        context,
        header: '自定义',
        children: [
          _buildTextRow(
            context,
            title: '自定义类别',
            description: '指定类别名称，留空自动识别',
            value: controller.mediaCategory.value,
            onChanged: controller.setMediaCategory,
            hint: '自定义类别',
          ),
          _buildTextRow(
            context,
            title: '自定义识别词',
            description: '只对该订阅使用的识别词',
            value: controller.customWords.value,
            onChanged: controller.setCustomWords,
            hint: '自定义识别词',
            maxLines: 2,
          ),
        ],
      ),
    ];
  }

  SliverToBoxAdapter _buildSection(
    BuildContext context, {
    required String header,
    required List<Widget> children,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CupertinoListSection.insetGrouped(
          backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
            context,
          ),
          header: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 6, top: 4),
            child: Text(
              header,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
          ),

          margin: const EdgeInsets.symmetric(horizontal: 16),
          children: children,
        ),
      ),
    );
  }

  Widget _buildTextRow(
    BuildContext context, {
    required String title,
    required String? description,
    required String value,
    required ValueChanged<String> onChanged,
    required String hint,
    int maxLines = 1,
  }) {
    return _EditTextField(
      title: title,
      description: description,
      hint: hint,
      value: value,
      onChanged: onChanged,
      maxLines: maxLines,
    );
  }

  Widget _buildNumberRow(
    BuildContext context, {
    required String title,
    required String? description,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    return _NumberEditRow(
      title: title,
      description: description,
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSelectRow(
    BuildContext context, {
    required String title,
    required String? description,
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    final opts = options
        .map((o) => SettingsEnumOption(value: o, label: o))
        .toList();
    return SettingsFieldRow(
      title: title,
      description: description,
      controlType: SettingsControlType.select,
      controlValue: value,
      editable: true,
      selectOptions: opts,
      onSelectChanged: onChanged,
    );
  }

  Widget _buildSitePicker(BuildContext context) {
    return Obx(() {
      final sites = controller.availableSites;
      final selectedIds = controller.selectedSiteIds.toList();
      final names = selectedIds
          .map(
            (id) =>
                sites.where((s) => s.id == id).firstOrNull?.name ??
                id.toString(),
          )
          .where((s) => s.isNotEmpty)
          .toList();
      final display = names.isEmpty ? '不选使用系统设置' : names.join('、');
      return SettingsFieldRow(
        title: '订阅站点',
        description: '订阅的站点范围，不选使用系统设置',
        compact: true,
        control: _buildNavControl(
          context,
          display: display.length > 14
              ? '${display.substring(0, 14)}…'
              : display,
          onTap: () async {
            final result = await Get.to<List<int>>(
              () => SiteMultiSelectPickerPage(
                availableSites: sites,
                selectedIds: selectedIds,
              ),
            );
            if (result != null) controller.setSelectedSites(result);
          },
        ),
      );
    });
  }

  Widget _buildDownloaderPicker(BuildContext context) {
    return Obx(() {
      final list = controller.downloaders;
      final val = controller.selectedDownloader.value;
      final opts = [
        const SettingsEnumOption(value: '', label: '默认'),
        ...list.map((s) => SettingsEnumOption(value: s, label: s)),
      ];
      return SettingsFieldRow(
        title: '下载器',
        description: '指定该订阅使用的下载器',
        compact: true,
        controlType: SettingsControlType.select,
        controlValue: val,
        enumLabel: val.isEmpty ? '默认' : val,
        editable: list.isNotEmpty,
        selectOptions: opts,
        onSelectChanged: list.isEmpty ? null : controller.setDownloader,
      );
    });
  }

  Widget _buildSavePathPicker(BuildContext context) {
    return Obx(() {
      final list = controller.savePaths;
      final val = controller.selectedSavePath.value;
      final opts = [
        const SettingsEnumOption(value: '', label: '自动'),
        ...list.map((s) => SettingsEnumOption(value: s, label: s)),
      ];
      return SettingsFieldRow(
        title: '保存路径',
        description: '指定该订阅的下载保存路径，留空自动使用系统设定',
        compact: true,
        controlType: SettingsControlType.select,
        controlValue: val,
        enumLabel: val.isEmpty
            ? '自动'
            : (val.length > 12 ? '${val.substring(0, 12)}…' : val),
        editable: list.isNotEmpty,
        selectOptions: opts,
        onSelectChanged: list.isEmpty ? null : controller.setSavePath,
      );
    });
  }

  Widget _buildPriorityRulePicker(BuildContext context) {
    return Obx(() {
      final selected = controller.selectedPriorityRuleNames.toList();
      final display = selected.isEmpty ? '未选择' : '${selected.length} 项';
      return SettingsFieldRow(
        title: '优先级规则组',
        description: '按选定的过滤规则组对订阅进行过滤',
        compact: true,
        control: _buildNavControl(
          context,
          display: display,
          onTap: () async {
            final result = await Get.to<List<String>>(
              () => PriorityRuleOrderPickerPage(
                rules: controller.priorityRules,
                selectedNames: selected,
              ),
            );
            if (result != null) controller.setPriorityRuleNames(result);
          },
        ),
      );
    });
  }

  Widget _buildSeasonPicker(BuildContext context) {
    return Obx(() {
      final val = controller.season.value;
      final display = val == 0 ? '默认' : '第$val季';
      final opts = SubscribeEditController.seasonOptions
          .map(
            (v) => SettingsEnumOption(
              value: v.toString(),
              label: v == 0 ? '默认' : '第$v季',
            ),
          )
          .toList();
      return SettingsFieldRow(
        title: '指定季',
        description: '指定任意季订阅',
        compact: true,
        controlType: SettingsControlType.select,
        controlValue: val.toString(),
        enumLabel: display,
        editable: true,
        selectOptions: opts,
        onSelectChanged: (v) => controller.setSeason(int.tryParse(v) ?? 0),
      );
    });
  }

  /// iOS 设置风格：右箭头 + 可点击进入详情
  Widget _buildNavControl(
    BuildContext context, {
    required String display,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 160),
            child: Text(
              display,
              style: TextStyle(
                fontSize: 15,
                color: CupertinoColors.activeBlue.resolveFrom(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            CupertinoIcons.chevron_forward,
            size: 12,
            color: CupertinoColors.tertiaryLabel.resolveFrom(context),
          ),
        ],
      ),
    );
  }
}

/// iOS 联系人「备注」风格：标题在上、全宽输入框在下
class _EditTextField extends StatefulWidget {
  const _EditTextField({
    required this.title,
    this.description,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.maxLines = 1,
  });

  final String title;
  final String? description;
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;
  final int maxLines;

  @override
  State<_EditTextField> createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<_EditTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(_EditTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showDesc =
        widget.description != null && widget.description!.isNotEmpty;
    return CupertinoListTile.notched(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.label.resolveFrom(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showDesc) ...[
            const SizedBox(height: 2),
            Text(
              widget.description!,
              style: TextStyle(
                fontSize: 12,
                color: CupertinoColors.tertiaryLabel.resolveFrom(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 10),
          CupertinoTextField(
            controller: _controller,
            placeholder: widget.hint,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            style: TextStyle(
              fontSize: 15,
              color: CupertinoColors.label.resolveFrom(context),
            ),
            placeholderStyle: TextStyle(
              fontSize: 15,
              color: CupertinoColors.tertiaryLabel.resolveFrom(context),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: CupertinoColors.separator
                      .resolveFrom(context)
                      .withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
      additionalInfo: const SizedBox.shrink(),
      leadingToTitle: 0,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 12,
        bottom: 12,
      ),
    );
  }
}

/// iOS 联系人风格：标题左、数值输入右，无图标
class _NumberEditRow extends StatefulWidget {
  const _NumberEditRow({
    required this.title,
    this.description,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String? description;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  State<_NumberEditRow> createState() => _NumberEditRowState();
}

class _NumberEditRowState extends State<_NumberEditRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
  }

  @override
  void didUpdateWidget(_NumberEditRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value &&
        _controller.text != widget.value.toString()) {
      _controller.text = widget.value.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showDesc =
        widget.description != null && widget.description!.isNotEmpty;
    return CupertinoListTile.notched(
      title: showDesc
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 1),
                Text(
                  widget.description!,
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.tertiaryLabel.resolveFrom(context),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          : Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CupertinoColors.label.resolveFrom(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      additionalInfo: SizedBox(
        width: 72,
        child: CupertinoTextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          onChanged: (v) {
            final n = int.tryParse(v);
            if (n != null && n >= 0) widget.onChanged(n);
          },
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          style: TextStyle(
            fontSize: 15,
            color: CupertinoColors.label.resolveFrom(context),
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: CupertinoColors.separator
                    .resolveFrom(context)
                    .withValues(alpha: 0.5),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      leadingToTitle: 0,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 10,
        bottom: 10,
      ),
    );
  }
}
