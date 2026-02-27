import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/controllers/dynamic_form_controller.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/dynamic_form_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_css.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

/// 通用 Vuetify 组件树渲染器：将 FormNode 递归转换为 iOS 原生风格的 Flutter Widget。
class VuetifyPageRenderer extends StatelessWidget {
  const VuetifyPageRenderer({
    super.key,
    required this.nodes,
    required this.controller,
  });

  final List<FormNode> nodes;
  final DynamicFormController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        final node = nodes[index];
        if (node.component == 'style') return const SizedBox.shrink();
        return Padding(
          padding: EdgeInsets.only(bottom: index < nodes.length - 1 ? 12 : 0),
          child: _VuetifyNode(node: node, controller: controller),
        );
      },
    );
  }
}

// =============================================================================
// Context flags passed down through the tree
// =============================================================================

class _RenderCtx {
  const _RenderCtx({
    this.centerContent = false,
    this.parentColor,
    this.insideTonalCard = false,
  });

  final bool centerContent;
  final Color? parentColor;
  final bool insideTonalCard;

  _RenderCtx copyWith({
    bool? centerContent,
    Color? parentColor,
    bool? insideTonalCard,
  }) => _RenderCtx(
    centerContent: centerContent ?? this.centerContent,
    parentColor: parentColor ?? this.parentColor,
    insideTonalCard: insideTonalCard ?? this.insideTonalCard,
  );
}

// =============================================================================
// Recursive node renderer
// =============================================================================

class _VuetifyNode extends StatelessWidget {
  const _VuetifyNode({
    required this.node,
    this.controller,
    this.parentWidth,
    this.siblingCount,
    this.ctx = const _RenderCtx(),
  });

  final FormNode node;
  final DynamicFormController? controller;
  final double? parentWidth;
  /// Number of sibling VCol elements in the parent VRow (for auto-sizing).
  final int? siblingCount;
  final _RenderCtx ctx;

  String get _cls => node.props?['class']?.toString() ?? '';

  @override
  Widget build(BuildContext context) {
    return switch (node.component) {
      'style' => const SizedBox.shrink(),
      'VCard' => _buildVCard(context),
      'VCardText' => _buildVCardText(context),
      'VCardTitle' => _buildVCardTitle(context),
      'VCardItem' => _buildChildren(context),
      'VCardSubtitle' => _buildTextNode(context, defaultStyle: TextStyle(
        fontSize: 13,
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondaryLabel, context,
        ),
      )),
      'VRow' => _buildVRow(context),
      'VCol' => _buildVCol(context),
      'VIcon' => _buildVIcon(context),
      'VBtn' => _buildVBtn(context),
      'VAlert' => _buildVAlert(context),
      'VChip' => _buildVChip(context),
      'VImg' => _buildVImg(context),
      'VTable' => _buildVTable(context),
      'VExpansionPanels' => _buildVExpansionPanels(context),
      'VExpansionPanel' => _buildVExpansionPanel(context),
      'div' => _buildDiv(context),
      'span' => _buildSpan(context),
      'h1' || 'h2' || 'h3' => _buildHeading(context),
      'VSpacer' => const SizedBox.shrink(),
      'VForm' => _buildChildren(context),
      'VSwitch' => _buildVSwitch(context),
      'VTextField' => _buildVTextField(context),
      'VTextarea' => _buildVTextarea(context),
      'VSelect' => _buildVSelect(context),
      'VDivider' => const Divider(height: 1),
      'VExpansionPanelTitle' => _buildChildren(context),
      'VExpansionPanelText' => _buildChildren(context),
      'thead' || 'tbody' || 'tr' || 'th' || 'td' => _buildChildren(context),
      _ => _buildDefault(context),
    };
  }

  // ---------------------------------------------------------------------------
  // VCard
  // ---------------------------------------------------------------------------

  Widget _buildVCard(BuildContext context) {
    final variant = node.props?['variant']?.toString() ?? '';
    final colorName = node.props?['color']?.toString();
    final color = VuetifyCss.resolveColor(colorName);
    final margin = VuetifyCss.parseMargin(_cls);
    final rawPadding = VuetifyCss.parsePadding(_cls);

    // Tonal stat-card pattern detection:
    // VCard[tonal,color] > VCardText > [VIcon, div(value), div(label)]
    if (variant == 'tonal' && color != null) {
      final statCard = _tryExtractTonalStatCard(color);
      if (statCard != null) {
        return Padding(padding: margin, child: statCard);
      }
    }

    // Smart default padding: if no CSS padding class is set AND none of the
    // children are VCardText / VCardTitle (which manage their own padding),
    // apply a sensible default so content doesn't stick to the card edges.
    final hasCardSubComponent = node.content.any((c) =>
        c.component == 'VCardText' || c.component == 'VCardTitle');
    final padding = rawPadding != EdgeInsets.zero
        ? rawPadding
        : hasCardSubComponent
            ? EdgeInsets.zero
            : const EdgeInsets.all(14);

    BoxDecoration decoration;
    _RenderCtx childCtx = ctx;

    if (variant == 'outlined') {
      decoration = BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground, context,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.separator, context,
          ),
        ),
      );
    } else if (variant == 'tonal' && color != null) {
      decoration = BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14),
      );
      childCtx = childCtx.copyWith(
        insideTonalCard: true,
        parentColor: color,
      );
    } else {
      decoration = BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground, context,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      );
    }

    return Padding(
      padding: margin,
      child: Container(
        width: double.infinity,
        decoration: decoration,
        padding: padding,
        child: _buildChildColumn(context, childCtx),
      ),
    );
  }

  /// Detect VCard[tonal] > VCardText[text-center] > [VIcon, div, div]
  /// and render as a polished iOS stat card with icon badge + value + label.
  Widget? _tryExtractTonalStatCard(Color color) {
    if (node.content.isEmpty) return null;
    final cardText = node.content.firstWhere(
      (c) => c.component == 'VCardText',
      orElse: () => const FormNode(),
    );
    if (cardText.component.isEmpty) return null;

    FormNode? iconNode;
    FormNode? valueNode;
    FormNode? labelNode;

    for (final child in cardText.content) {
      if (child.component == 'VIcon' && iconNode == null) {
        iconNode = child;
      } else if (child.component == 'div') {
        final cls = child.props?['class']?.toString() ?? '';
        if (cls.contains('text-caption') && labelNode == null) {
          labelNode = child;
        } else if (valueNode == null) {
          valueNode = child;
        }
      }
    }

    if (valueNode == null) return null;

    final iconName = iconNode?.text?.toString().trim() ??
        iconNode?.props?['icon']?.toString().trim();
    final iconData = VuetifyMappings.iconFromMdi(iconName);
    final value = _collectNodeText(valueNode);
    final label = labelNode != null ? _collectNodeText(labelNode) : '';

    return _TonalStatCard(
      color: color,
      iconData: iconData,
      value: value,
      label: label,
    );
  }

  // ---------------------------------------------------------------------------
  // VCardText / VCardTitle
  // ---------------------------------------------------------------------------

  Widget _buildVCardText(BuildContext context) {
    final padding = VuetifyCss.parsePadding(_cls);
    final effectivePadding = padding == EdgeInsets.zero
        ? const EdgeInsets.all(12)
        : padding;
    final center = VuetifyCss.isTextCenter(_cls) || ctx.centerContent;
    final childCtx = center ? ctx.copyWith(centerContent: true) : ctx;

    return Padding(
      padding: effectivePadding,
      child: _buildChildColumn(context, childCtx,
        crossAlignment: center ? CrossAxisAlignment.center : null,
      ),
    );
  }

  Widget _buildVCardTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: _buildTextNode(context, defaultStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
      )),
    );
  }

  // ---------------------------------------------------------------------------
  // VRow — Wrap layout
  // ---------------------------------------------------------------------------

  Widget _buildVRow(BuildContext context) {
    final margin = VuetifyCss.parseMargin(_cls);
    final colCount = node.content
        .where((c) => c.component == 'VCol')
        .length;

    return Padding(
      padding: margin,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: node.content.map((child) {
              return _VuetifyNode(
                node: child,
                controller: controller,
                parentWidth: availableWidth,
                siblingCount: colCount > 1 ? colCount : null,
                ctx: ctx,
              );
            }).toList(),
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // VCol — sized by cols prop
  // ---------------------------------------------------------------------------

  static const double _colMinWidth = 75;

  Widget _buildVCol(BuildContext context) {
    final cols = node.props?['cols'];
    final center = VuetifyCss.isTextCenter(_cls) || ctx.centerContent;
    final childCtx = center ? ctx.copyWith(centerContent: true) : ctx;

    double? width;
    if (parentWidth != null) {
      final fraction = VuetifyCss.colsFraction(cols);
      if (fraction != null) {
        final raw = parentWidth! * fraction - 8 * (1 - fraction);
        width = raw.clamp(_colMinWidth, parentWidth!);
      } else if (siblingCount != null && siblingCount! > 1) {
        final totalSpacing = 8.0 * (siblingCount! - 1);
        final raw = (parentWidth! - totalSpacing) / siblingCount!;
        width = raw.clamp(_colMinWidth, parentWidth!);
      }
    }

    Widget child;
    if (node.content.length == 1) {
      child = _VuetifyNode(
        node: node.content.first,
        controller: controller,
        ctx: childCtx,
      );
    } else {
      child = _buildChildColumn(context, childCtx,
        crossAlignment: center ? CrossAxisAlignment.center : null,
      );
    }

    if (center) child = Center(child: child);

    if (width != null) {
      return SizedBox(width: width, child: child);
    }
    return Expanded(child: child);
  }

  // ---------------------------------------------------------------------------
  // VIcon — with optional color badge background
  // ---------------------------------------------------------------------------

  Widget _buildVIcon(BuildContext context) {
    final iconName = node.text?.toString().trim() ??
        node.props?['icon']?.toString().trim() ?? '';
    final iconData = VuetifyMappings.iconFromMdi(iconName);
    if (iconData == null) return const SizedBox.shrink();

    final colorName = node.props?['color']?.toString();
    final color = VuetifyCss.resolveColor(colorName) ??
        ctx.parentColor ??
        CupertinoDynamicColor.resolve(CupertinoColors.label, context);

    final sizeStr = node.props?['size']?.toString() ?? '';
    final size = _parseIconSize(sizeStr);
    final isLarge = size >= 32;
    final margin = VuetifyCss.parseMargin(_cls);

    // Large icons or icons inside tonal cards get a badge background
    if (isLarge || ctx.insideTonalCard) {
      final bgSize = size + 16;
      return Padding(
        padding: margin,
        child: Container(
          width: bgSize,
          height: bgSize,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(bgSize * 0.28),
          ),
          child: Icon(iconData, size: size * 0.7, color: color),
        ),
      );
    }

    return Padding(
      padding: margin,
      child: Icon(iconData, size: size, color: color),
    );
  }

  double _parseIconSize(String size) {
    final numeric = double.tryParse(size);
    if (numeric != null) return numeric;
    return switch (size) {
      'x-small' => 16,
      'small' => 20,
      'large' => 32,
      'x-large' => 40,
      _ => 24,
    };
  }

  // ---------------------------------------------------------------------------
  // VBtn — iOS-native button
  // ---------------------------------------------------------------------------

  Widget _buildVBtn(BuildContext context) {
    final text = _collectNodeText(node);
    final variant = node.props?['variant']?.toString() ?? '';
    final colorName = node.props?['color']?.toString();
    final color = VuetifyCss.resolveColor(colorName) ??
        CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context);
    final prependIcon = node.props?['prepend-icon']?.toString();
    final prependIconData = VuetifyMappings.iconFromMdi(prependIcon);
    final clickEvent = _extractClickEvent();

    if (variant == 'outlined') {
      return _OutlinedButton(
        text: text,
        color: color,
        iconData: prependIconData,
        onPressed: clickEvent != null ? () => _handleClickEvent(clickEvent) : null,
      );
    }

    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(10),
      onPressed: clickEvent != null ? () => _handleClickEvent(clickEvent) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prependIconData != null) ...[
            Icon(prependIconData, size: 18, color: color),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }

  _ClickEvent? _extractClickEvent() {
    final events = node.events;
    if (events == null) return null;
    final click = events['click'];
    if (click is! Map) return null;
    final api = click['api']?.toString();
    final method = click['method']?.toString().toLowerCase() ?? 'get';
    if (api == null || api.isEmpty) return null;
    return _ClickEvent(api: api, method: method);
  }

  static Future<void> _handleClickEvent(_ClickEvent event) async {
    try {
      final apiClient = Get.find<ApiClient>();
      final appService = Get.find<AppService>();
      final token = appService.loginResponse?.accessToken ??
          appService.latestLoginProfileAccessToken ??
          apiClient.token;
      if (token == null || token.isEmpty) return;

      if (event.method == 'post') {
        await apiClient.post<dynamic>(event.api, token: token);
      } else {
        await apiClient.get<dynamic>(event.api, token: token);
      }
    } catch (e, st) {
      Get.find<AppLog>().handle(e, stackTrace: st, message: 'API 调用失败');
    }
  }

  // ---------------------------------------------------------------------------
  // VAlert
  // ---------------------------------------------------------------------------

  Widget _buildVAlert(BuildContext context) {
    final type = node.props?['type']?.toString().toLowerCase() ?? 'info';
    final propText = node.props?['text']?.toString() ?? '';
    final bodyText = propText.isNotEmpty ? propText : _collectNodeText(node);
    if (bodyText.isEmpty) return const SizedBox.shrink();

    final (bgColor, fgColor, icon) = _alertColors(type);

    return Container(
      margin: VuetifyCss.parseMargin(_cls),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: fgColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              bodyText,
              style: TextStyle(
                fontSize: 14, height: 1.4, fontWeight: FontWeight.w500,
                color: fgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static (Color bg, Color fg, IconData icon) _alertColors(String type) {
    return switch (type) {
      'success' => (
        const Color(0xFF34C759).withValues(alpha: 0.12),
        const Color(0xFF34C759),
        CupertinoIcons.checkmark_circle_fill,
      ),
      'warning' => (
        const Color(0xFFFF9500).withValues(alpha: 0.12),
        const Color(0xFFFF9500),
        CupertinoIcons.exclamationmark_triangle_fill,
      ),
      'error' => (
        const Color(0xFFFF3B30).withValues(alpha: 0.12),
        const Color(0xFFFF3B30),
        CupertinoIcons.exclamationmark_circle_fill,
      ),
      _ => (
        const Color(0xFF007AFF).withValues(alpha: 0.12),
        const Color(0xFF007AFF),
        CupertinoIcons.info_circle_fill,
      ),
    };
  }

  // ---------------------------------------------------------------------------
  // VChip
  // ---------------------------------------------------------------------------

  Widget _buildVChip(BuildContext context) {
    final colorName = node.props?['color']?.toString();
    final color = VuetifyCss.resolveColor(colorName) ?? const Color(0xFF007AFF);

    // Extract icon and text from children instead of concatenating all text
    IconData? iconData;
    final textParts = <String>[];
    for (final child in node.content) {
      if (child.component == 'VIcon') {
        final name = child.text?.toString().trim() ??
            child.props?['icon']?.toString().trim();
        iconData ??= VuetifyMappings.iconFromMdi(name);
      } else {
        final t = _collectNodeText(child).trim();
        if (t.isNotEmpty) textParts.add(t);
      }
    }
    // Fallback: if no children, use node's own text
    if (textParts.isEmpty && node.text != null) {
      textParts.add(node.text.toString().trim());
    }
    final text = textParts.join(' ');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null) ...[
            Icon(iconData, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // VImg
  // ---------------------------------------------------------------------------

  Widget _buildVImg(BuildContext context) {
    final src = node.props?['src']?.toString() ?? '';
    if (src.isEmpty) return const SizedBox.shrink();
    final heightVal = double.tryParse(
      node.props?['height']?.toString() ?? '',
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        src,
        height: heightVal,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // VTable
  // ---------------------------------------------------------------------------

  Widget _buildVTable(BuildContext context) {
    final headers = <String>[];
    final rows = <List<String>>[];

    for (final section in node.content) {
      if (section.component == 'thead') {
        for (final tr in section.content) {
          if (tr.component == 'tr') {
            for (final th in tr.content) {
              if (th.component == 'th') headers.add(_collectNodeText(th));
            }
          }
        }
      } else if (section.component == 'tbody') {
        for (final tr in section.content) {
          if (tr.component == 'tr') {
            final row = <String>[];
            for (final td in tr.content) {
              if (td.component == 'td') row.add(_collectNodeText(td));
            }
            rows.add(row);
          }
        }
      }
    }

    if (headers.isEmpty && rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < rows.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemGroupedBackground, context,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var j = 0; j < rows[i].length; j++)
                  Padding(
                    padding: EdgeInsets.only(bottom: j < rows[i].length - 1 ? 4 : 0),
                    child: Row(
                      children: [
                        if (j < headers.length)
                          Text(
                            '${headers[j]}:  ',
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoDynamicColor.resolve(
                                CupertinoColors.secondaryLabel, context,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            rows[i][j],
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoDynamicColor.resolve(
                                CupertinoColors.label, context,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // VExpansionPanels / VExpansionPanel
  // ---------------------------------------------------------------------------

  Widget _buildVExpansionPanels(BuildContext context) {
    return Column(
      children: node.content.map((child) {
        return _VuetifyNode(node: child, controller: controller, ctx: ctx);
      }).toList(),
    );
  }

  Widget _buildVExpansionPanel(BuildContext context) {
    FormNode? titleNode;
    FormNode? textNode;
    for (final c in node.content) {
      if (c.component == 'VExpansionPanelTitle') titleNode = c;
      if (c.component == 'VExpansionPanelText') textNode = c;
    }

    return _ExpansionTile(
      titleNode: titleNode,
      textNode: textNode,
      controller: controller,
    );
  }

  // ---------------------------------------------------------------------------
  // div / span — with proper text-center propagation & d-flex layout
  // ---------------------------------------------------------------------------

  Widget _buildDiv(BuildContext context) {
    final cls = _cls;
    final margin = VuetifyCss.parseMargin(cls);
    final padding = VuetifyCss.parsePadding(cls);
    final textStyle = VuetifyCss.parseTextStyle(cls, context);
    final isCenter = VuetifyCss.isTextCenter(cls) || ctx.centerContent;
    final isDFlex = VuetifyCss.isDFlex(cls);

    // Leaf div with text only
    if (node.text != null && node.content.isEmpty) {
      final text = node.text.toString().trim();
      if (text.isEmpty) return const SizedBox.shrink();
      return Padding(
        padding: margin + padding,
        child: Text(
          text,
          style: textStyle,
          textAlign: isCenter ? TextAlign.center : null,
        ),
      );
    }

    // d-flex → Row layout with Flexible children to prevent overflow
    if (isDFlex) {
      final mainAxis = VuetifyCss.parseMainAxisAlignment(cls);
      final crossAxis = VuetifyCss.parseCrossAxisAlignment(cls);
      return Padding(
        padding: margin + padding,
        child: Row(
          mainAxisAlignment: mainAxis,
          crossAxisAlignment: crossAxis,
          children: node.content.map((c) {
            if (c.component == 'VSpacer') {
              return const Expanded(child: SizedBox.shrink());
            }
            return Flexible(
              child: _VuetifyNode(node: c, controller: controller, ctx: ctx),
            );
          }).toList(),
        ),
      );
    }

    final childCtx = isCenter ? ctx.copyWith(centerContent: true) : ctx;

    // Default → Column
    Widget child;
    if (node.content.isNotEmpty) {
      child = Column(
        crossAxisAlignment: isCenter
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: node.content.map((c) {
          return _VuetifyNode(node: c, controller: controller, ctx: childCtx);
        }).toList(),
      );
    } else {
      final text = node.text?.toString().trim() ?? '';
      child = text.isNotEmpty
          ? Text(text, style: textStyle, textAlign: isCenter ? TextAlign.center : null)
          : const SizedBox.shrink();
    }

    if (margin == EdgeInsets.zero && padding == EdgeInsets.zero) return child;
    return Padding(padding: margin + padding, child: child);
  }

  Widget _buildSpan(BuildContext context) {
    final cls = _cls;
    final textStyle = VuetifyCss.parseTextStyle(cls, context);
    final margin = VuetifyCss.parseMargin(cls);
    final text = node.text?.toString().trim() ?? _collectNodeText(node);
    if (text.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: margin,
      child: Text(
        text,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    final text = _collectNodeText(node);
    if (text.isEmpty) return const SizedBox.shrink();
    final level = int.tryParse(node.component.substring(1)) ?? 2;
    final fontSize = switch (level) {
      1 => 28.0,
      2 => 22.0,
      _ => 18.0,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Form fields (VSwitch / VTextField / VTextarea / VSelect)
  // ---------------------------------------------------------------------------

  Widget _buildVSwitch(BuildContext context) {
    final label = node.props?['label']?.toString() ?? '';
    final name = node.props?['model']?.toString() ?? node.props?['name']?.toString();
    final ctrl = controller;

    if (ctrl == null || name == null) {
      return _buildFormRow(context, label, CupertinoSwitch(value: false, onChanged: null));
    }

    return Obx(() {
      final value = ctrl.getBoolValue(name);
      return _buildFormRow(
        context,
        label,
        CupertinoSwitch(
          value: value,
          onChanged: (v) => ctrl.updateField(name, v),
        ),
      );
    });
  }

  Widget _buildVTextField(BuildContext context) {
    final label = node.props?['label']?.toString() ?? '';
    final name = node.props?['model']?.toString() ?? node.props?['name']?.toString();
    final hint = node.props?['placeholder']?.toString() ?? node.props?['hint']?.toString();

    return _VTextInputField(
      label: label,
      hint: hint,
      name: name,
      controller: controller,
      maxLines: 1,
    );
  }

  Widget _buildVTextarea(BuildContext context) {
    final label = node.props?['label']?.toString() ?? '';
    final name = node.props?['model']?.toString() ?? node.props?['name']?.toString();
    final hint = node.props?['placeholder']?.toString() ?? node.props?['hint']?.toString();
    final rowsRaw = node.props?['rows'];
    final rows = rowsRaw is int ? rowsRaw : (int.tryParse(rowsRaw?.toString() ?? '') ?? 3);

    return _VTextInputField(
      label: label,
      hint: hint,
      name: name,
      controller: controller,
      maxLines: rows.clamp(2, 10),
    );
  }

  Widget _buildVSelect(BuildContext context) {
    final label = node.props?['label']?.toString() ?? '';
    final name = node.props?['model']?.toString() ?? node.props?['name']?.toString();
    final itemsRaw = node.props?['items'];
    if (itemsRaw is! List) return const SizedBox.shrink();

    final items = <(String title, dynamic value)>[];
    for (final item in itemsRaw) {
      if (item is Map<String, dynamic>) {
        final title = item['title']?.toString() ?? '';
        if (title.isNotEmpty) items.add((title, item['value']));
      }
    }
    if (items.isEmpty) return const SizedBox.shrink();

    final ctrl = controller;
    if (ctrl == null || name == null) return const SizedBox.shrink();

    return Obx(() {
      final current = ctrl.getValue(name);
      final currentTitle = items
          .where((i) => i.$2 == current)
          .map((i) => i.$1)
          .firstOrNull ?? '';

      return CupertinoListTile(
        title: Text(label, style: const TextStyle(fontSize: 15)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentTitle,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel, context,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(CupertinoIcons.chevron_down, size: 14),
          ],
        ),
        onTap: () => _showSelectPicker(context, name, items, ctrl),
      );
    });
  }

  void _showSelectPicker(
    BuildContext context,
    String name,
    List<(String, dynamic)> items,
    DynamicFormController ctrl,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: items.map((item) {
          return CupertinoActionSheetAction(
            onPressed: () {
              ctrl.updateField(name, item.$2);
              Navigator.of(context).pop();
            },
            child: Text(item.$1),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
      ),
    );
  }

  Widget _buildFormRow(BuildContext context, String label, Widget trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.label, context,
                ),
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Default fallback
  // ---------------------------------------------------------------------------

  Widget _buildDefault(BuildContext context) {
    if (node.content.isEmpty) {
      final text = node.text?.toString().trim() ?? '';
      if (text.isEmpty) return const SizedBox.shrink();
      return Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
        ),
      );
    }
    return _buildChildColumn(context, ctx);
  }

  Widget _buildChildren(BuildContext context) => _buildChildColumn(context, ctx);

  Widget _buildChildColumn(
    BuildContext context,
    _RenderCtx childCtx, {
    CrossAxisAlignment? crossAlignment,
  }) {
    final center = crossAlignment == CrossAxisAlignment.center ||
        childCtx.centerContent;
    Widget col = Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : (crossAlignment ?? CrossAxisAlignment.start),
      mainAxisSize: MainAxisSize.min,
      children: node.content.map((child) {
        return _VuetifyNode(node: child, controller: controller, ctx: childCtx);
      }).toList(),
    );
    // Ensure Column expands to full parent width so centering is effective
    if (center) col = SizedBox(width: double.infinity, child: col);
    return col;
  }

  Widget _buildTextNode(BuildContext context, {TextStyle? defaultStyle}) {
    final text = _collectNodeText(node);
    if (text.isNotEmpty) {
      return Text(
        text,
        style: defaultStyle ?? TextStyle(
          fontSize: 14,
          color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
        ),
      );
    }
    return _buildChildColumn(context, ctx);
  }

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  /// Collect visible text from a node tree, skipping VIcon nodes
  /// (whose text is an MDI icon name, not user-visible text).
  static String _collectNodeText(FormNode node) {
    if (node.component == 'VIcon') return '';
    if (node.text != null) return node.text.toString().trim();
    final buf = StringBuffer();
    for (final c in node.content) {
      final t = _collectNodeText(c);
      if (buf.isNotEmpty && t.isNotEmpty) buf.write(' ');
      buf.write(t);
    }
    return buf.toString();
  }
}

// =============================================================================
// Polished component widgets
// =============================================================================

class _ClickEvent {
  const _ClickEvent({required this.api, required this.method});
  final String api;
  final String method;
}

/// Tonal stat card — iOS-native polished style:
/// Colored rounded background + icon badge + large value + small label
class _TonalStatCard extends StatelessWidget {
  const _TonalStatCard({
    required this.color,
    this.iconData,
    required this.value,
    required this.label,
  });

  final Color color;
  final IconData? iconData;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconData != null)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(iconData, size: 22, color: color),
            ),
          if (iconData != null) const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// iOS-native outlined button with icon + text
class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    required this.text,
    required this.color,
    this.iconData,
    this.onPressed,
  });

  final String text;
  final Color color;
  final IconData? iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.4), width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) ...[
              Icon(iconData, size: 16, color: color),
              const SizedBox(width: 6),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Collapsible expansion panel
class _ExpansionTile extends StatefulWidget {
  const _ExpansionTile({
    this.titleNode,
    this.textNode,
    this.controller,
  });

  final FormNode? titleNode;
  final FormNode? textNode;
  final DynamicFormController? controller;

  @override
  State<_ExpansionTile> createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<_ExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget;
    if (widget.titleNode != null && widget.titleNode!.content.isNotEmpty) {
      titleWidget = _VuetifyNode(
        node: widget.titleNode!,
        controller: widget.controller,
      );
    } else {
      final titleText = widget.titleNode != null
          ? _VuetifyNode._collectNodeText(widget.titleNode!)
          : '';
      titleWidget = Text(
        titleText,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.label, context,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: Row(
              children: [
                Expanded(child: titleWidget),
                Icon(
                  _expanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 16,
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.tertiaryLabel, context,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_expanded && widget.textNode != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: _VuetifyNode(
              node: widget.textNode!,
              controller: widget.controller,
            ),
          ),
        const Divider(height: 1),
      ],
    );
  }
}

/// Text input field (VTextField / VTextarea)
class _VTextInputField extends StatefulWidget {
  const _VTextInputField({
    required this.label,
    this.hint,
    this.name,
    this.controller,
    this.maxLines = 1,
  });

  final String label;
  final String? hint;
  final String? name;
  final DynamicFormController? controller;
  final int maxLines;

  @override
  State<_VTextInputField> createState() => _VTextInputFieldState();
}

class _VTextInputFieldState extends State<_VTextInputField> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    final initial = widget.controller?.getValue(widget.name)?.toString() ?? '';
    _textController = TextEditingController(text: initial);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context,
                  ),
                ),
              ),
            ),
          CupertinoTextField(
            controller: _textController,
            placeholder: widget.hint ?? widget.label,
            maxLines: widget.maxLines,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill, context,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onChanged: (v) {
              if (widget.name != null) {
                widget.controller?.updateField(widget.name, v);
              }
            },
          ),
        ],
      ),
    );
  }
}
