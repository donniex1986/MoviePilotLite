import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviepilot_mobile/modules/search/controllers/app_setting_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/widgets/bottom_sheet.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

class BackgroundImageSettingPage extends StatefulWidget {
  const BackgroundImageSettingPage({super.key});

  @override
  State<BackgroundImageSettingPage> createState() =>
      _BackgroundImageSettingPageState();
}

class _BackgroundImageSettingPageState
    extends State<BackgroundImageSettingPage> {
  static const double _collapsedBarHeight = 50;
  static const double _panelHeightFactor = 0.9;
  static const double _panelSideGap = 12;
  static const double _panelBottomGap = 12;
  static const double _panelTopGap = 10;

  late final AppSettingController controller;

  late bool _enabled;
  late double _opacity;
  late Color _gradientTop;
  late Color _gradientBottom;
  Uint8List? _imageBytes;

  bool _saving = false;
  bool _panelExpanded = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AppSettingController>();
    _enabled = controller.backgroundImageEnabled.value;
    _opacity = controller.backgroundImageOpacity.value;
    _gradientTop = controller.backgroundImageGradientTop.value;
    _gradientBottom = controller.backgroundImageGradientBottom.value;
    _imageBytes = controller.backgroundImageBytes.value;
  }

  bool get _hasChanges {
    return _enabled != controller.backgroundImageEnabled.value ||
        (_opacity - controller.backgroundImageOpacity.value).abs() > 0.001 ||
        _gradientTop.toARGB32() !=
            controller.backgroundImageGradientTop.value.toARGB32() ||
        _gradientBottom.toARGB32() !=
            controller.backgroundImageGradientBottom.value.toARGB32() ||
        !_bytesEquals(_imageBytes, controller.backgroundImageBytes.value);
  }

  bool _bytesEquals(Uint8List? a, Uint8List? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    return listEquals(a, b);
  }

  Future<void> _save() async {
    if (_saving || !_hasChanges) return;
    setState(() => _saving = true);
    final shouldEnable = _enabled && _imageBytes != null;
    try {
      await controller.updateBackgroundImage(_imageBytes);
      controller.updateBackgroundImageOpacity(_opacity);
      controller.updateBackgroundImageGradientTop(_gradientTop);
      controller.updateBackgroundImageGradientBottom(_gradientBottom);
      controller.updateBackgroundImageEnabled(shouldEnable);
      if (!mounted) return;
      Get.snackbar('保存成功', '背景图设置已更新');
    } catch (_) {
      if (!mounted) return;
      Get.snackbar('保存失败', '请稍后重试');
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      if (image == null) return;
      final bytes = await image.readAsBytes();
      if (!mounted) return;
      setState(() {
        _imageBytes = Uint8List.fromList(bytes);
        _enabled = true;
      });
    } catch (_) {
      Get.snackbar('错误', '无法读取图片，请检查相册权限设置');
    }
  }

  void _clearImage() {
    setState(() {
      _imageBytes = null;
      _enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canSave = !_saving && _hasChanges;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('背景图片'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: canSave ? _save : null,
            child: _saving
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : const Text('保存'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final expandedHeight = _expandedPanelHeight(context, maxHeight);
          final panelHeight = _panelExpanded
              ? expandedHeight
              : _collapsedBarHeight;
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildLiveBackground(context),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withValues(alpha: 0.35),
                  ),
                ),
              ),
              Positioned(
                left: _panelSideGap,
                right: _panelSideGap,
                bottom: _panelBottomGap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOutCubic,
                  height: panelHeight,
                  child: _buildFloatingPanel(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLiveBackground(BuildContext context) {
    final bytes = _imageBytes;
    if (!_enabled || bytes == null) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: const Center(child: Text('选择图片后可实时预览效果')),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: _opacity,
          child: Image.memory(bytes, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_gradientTop, _gradientBottom],
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _expandedPanelHeight(BuildContext context, double maxHeight) {
    final topBlocked =
        MediaQuery.paddingOf(context).top + kToolbarHeight + _panelTopGap;
    final available = maxHeight - topBlocked - _panelBottomGap;
    final target = maxHeight * _panelHeightFactor;
    return target.clamp(_collapsedBarHeight, available);
  }

  void _setPanelExpanded(bool expanded) {
    if (_panelExpanded == expanded) return;
    setState(() => _panelExpanded = expanded);
  }

  void _togglePanel() {
    _setPanelExpanded(!_panelExpanded);
  }

  Widget _buildFloatingPanel(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              InkWell(
                onTap: _togglePanel,
                child: SizedBox(
                  height: _collapsedBarHeight,
                  child: SectionHeader(
                    title: _panelExpanded ? '点击收起设置' : '点击展开设置',
                    trailing: Icon(
                      _panelExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              if (_panelExpanded) const Divider(height: 1),
              if (_panelExpanded)
                Expanded(
                  child: ListView(
                    primary: false,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      12,
                      0,
                      12,
                      MediaQuery.paddingOf(context).bottom + 12,
                    ),
                    children: [_buildSettingsSection(context)],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Section(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      separatorBuilder: (context) => Divider(
        height: 0.1,
        color: Theme.of(context).dividerColor,
        endIndent: 16,
        indent: 16,
      ),
      children: [
        SwitchListTile(
          title: Text('启用背景图片', style: Theme.of(context).textTheme.bodyLarge),
          subtitle: const Text('显示在 Dashboard 底部'),
          value: _enabled,
          onChanged: (value) {
            setState(() => _enabled = value);
          },
        ),
        ListTile(
          title: Text('选择图片', style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(_imageBytes != null ? '已选择图片' : '请从相册选择'),
          trailing: _imageBytes != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.memory(
                    _imageBytes!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(CupertinoIcons.photo),
          onTap: _pickImage,
        ),
        if (_enabled) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('图片透明度'),
                    Text('${(_opacity * 100).round()}%'),
                  ],
                ),
                Slider(
                  value: _opacity,
                  min: 0.1,
                  max: 1.0,
                  divisions: 18,
                  onChanged: (value) {
                    setState(() => _opacity = value);
                  },
                ),
              ],
            ),
          ),
          _buildColorTile(
            context,
            title: '上方渐变色',
            color: _gradientTop,
            onColorChanged: (color) {
              setState(() => _gradientTop = color);
            },
          ),
          _buildColorTile(
            context,
            title: '下方渐变色',
            color: _gradientBottom,
            onColorChanged: (color) {
              setState(() => _gradientBottom = color);
            },
          ),
          if (_imageBytes != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: CupertinoColors.systemGrey5.resolveFrom(context),
                  onPressed: _clearImage,
                  child: Text(
                    '清除图片',
                    style: TextStyle(
                      color: CupertinoColors.destructiveRed.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildColorTile(
    BuildContext context, {
    required String title,
    required Color color,
    required ValueChanged<Color> onColorChanged,
  }) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      trailing: GestureDetector(
        onTap: () => _showColorPicker(context, color, onColorChanged),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
      onTap: () => _showColorPicker(context, color, onColorChanged),
    );
  }

  Future<void> _showColorPicker(
    BuildContext context,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) async {
    final originalColor = currentColor;
    final draftColor = ValueNotifier<Color>(currentColor);
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    try {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) => Material(
          color: Colors.transparent,
          child: BottomSheetWidget(
            header: _buildPickerHeader(
              sheetContext,
              onCancel: () {
                onColorChanged(originalColor);
                Navigator.of(sheetContext).pop();
              },
              onDone: () => Navigator.of(sheetContext).pop(),
            ),
            builder: (context, scrollController) => ListView(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomPadding),
              children: [
                ValueListenableBuilder<Color>(
                  valueListenable: draftColor,
                  builder: (context, color, _) {
                    return Row(
                      children: [
                        Text(
                          '当前颜色',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: CupertinoColors.secondaryLabel
                                    .resolveFrom(context),
                              ),
                        ),
                        const Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '#${color.toARGB32().toRadixString(16).toUpperCase()}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                _PaletteColorPicker(
                  initialColor: currentColor,
                  onColorChanged: (color) {
                    draftColor.value = color;
                    onColorChanged(color);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    } finally {
      draftColor.dispose();
    }
  }

  Widget _buildPickerHeader(
    BuildContext context, {
    required VoidCallback onCancel,
    required VoidCallback onDone,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            onPressed: onCancel,
            child: const Text('取消'),
          ),
          const Spacer(),
          const Text(
            '调色盘',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            onPressed: onDone,
            child: const Text(
              '完成',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaletteColorPicker extends StatefulWidget {
  const _PaletteColorPicker({
    required this.initialColor,
    required this.onColorChanged,
  });

  final Color initialColor;
  final ValueChanged<Color> onColorChanged;

  @override
  State<_PaletteColorPicker> createState() => _PaletteColorPickerState();
}

class _PaletteColorPickerState extends State<_PaletteColorPicker> {
  late HSVColor _hsvColor;
  late double _alpha;

  @override
  void initState() {
    super.initState();
    _hsvColor = HSVColor.fromColor(widget.initialColor);
    _alpha = widget.initialColor.a;
  }

  Color get _currentColor => _hsvColor.toColor().withValues(alpha: _alpha);

  void _notifyColorChanged() {
    widget.onColorChanged(_currentColor);
  }

  void _updatePalette(Offset localPosition, Size size) {
    final saturation = (localPosition.dx / size.width).clamp(0.0, 1.0);
    final value = (1 - (localPosition.dy / size.height)).clamp(0.0, 1.0);
    setState(() {
      _hsvColor = _hsvColor.withSaturation(saturation).withValue(value);
    });
    _notifyColorChanged();
  }

  void _updateHue(Offset localPosition, Size size) {
    final hue = ((localPosition.dx / size.width) * 360).clamp(0.0, 360.0);
    setState(() {
      _hsvColor = _hsvColor.withHue(hue);
    });
    _notifyColorChanged();
  }

  void _updateAlpha(Offset localPosition, Size size) {
    final alpha = (localPosition.dx / size.width).clamp(0.0, 1.0);
    setState(() {
      _alpha = alpha;
    });
    _notifyColorChanged();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.2,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = constraints.biggest;
              final thumbOffset = Offset(
                _hsvColor.saturation * size.width,
                (1 - _hsvColor.value) * size.height,
              );
              return GestureDetector(
                onPanDown: (details) =>
                    _updatePalette(details.localPosition, size),
                onPanUpdate: (details) =>
                    _updatePalette(details.localPosition, size),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: HSVColor.fromAHSV(
                              1,
                              _hsvColor.hue,
                              1,
                              1,
                            ).toColor(),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: thumbOffset.dx - 10,
                      top: thumbOffset.dy - 10,
                      child: IgnorePointer(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        _buildSliderLabel(theme, '色相', _hsvColor.hue.round().toString()),
        const SizedBox(height: 6),
        _buildHueSlider(),
        const SizedBox(height: 12),
        _buildSliderLabel(theme, '透明度', '${(_alpha * 100).round()}%'),
        const SizedBox(height: 6),
        _buildAlphaSlider(),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Text(
                '#${_currentColor.toARGB32().toRadixString(16).toUpperCase()}',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSliderLabel(ThemeData theme, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.bodySmall),
        Text(value, style: theme.textTheme.bodySmall),
      ],
    );
  }

  Widget _buildHueSlider() {
    const hueColors = [
      Color(0xFFFF0000),
      Color(0xFFFFFF00),
      Color(0xFF00FF00),
      Color(0xFF00FFFF),
      Color(0xFF0000FF),
      Color(0xFFFF00FF),
      Color(0xFFFF0000),
    ];
    return _buildGestureSlider(
      progress: (_hsvColor.hue / 360).clamp(0.0, 1.0),
      onDrag: _updateHue,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: const LinearGradient(colors: hueColors),
        ),
      ),
    );
  }

  Widget _buildAlphaSlider() {
    final opaqueColor = _hsvColor.toColor().withValues(alpha: 1);
    return _buildGestureSlider(
      progress: _alpha,
      onDrag: _updateAlpha,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: LinearGradient(
            colors: [opaqueColor.withValues(alpha: 0), opaqueColor],
          ),
        ),
      ),
    );
  }

  Widget _buildGestureSlider({
    required double progress,
    required void Function(Offset localPosition, Size size) onDrag,
    required Widget child,
  }) {
    return SizedBox(
      height: 18,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final thumbX = (progress * size.width).clamp(0.0, size.width);
          return GestureDetector(
            onPanDown: (details) => onDrag(details.localPosition, size),
            onPanUpdate: (details) => onDrag(details.localPosition, size),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(child: child),
                Positioned(
                  left: thumbX - 8,
                  top: 1,
                  child: IgnorePointer(
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
