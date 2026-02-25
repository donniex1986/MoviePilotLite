import 'package:moviepilot_mobile/modules/dynamic_form/models/dynamic_form_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';

/// 将 FormNode 树转换为移动端 FormBlock 列表，去除 Web/Vuetify 无用参数
class FormBlockConverter {
  static List<FormBlock> convert(DynamicFormResponse response) {
    final blocks = <FormBlock>[];
    final model = response.model;

    // 配置表单：conf + model（表单项 value 从 model[key] 取，key 为 props.model）
    if (response.conf.isNotEmpty) {
      final confRoots = response.conf;
      for (final root in confRoots) {
        final children = root.component == 'VForm' ? root.content : [root];
        for (final node in children) {
          _collectConfNodes(node, blocks, model);
        }
      }
      return blocks;
    }

    // 展示页：page（统计卡片、图表、表格、标题行、折叠卡片等）
    for (final pageNode in response.page) {
      if (pageNode.component == 'style') continue; // 忽略 style 节点
      // 兼容顶层 VCard（如飞牛论坛签到历史：VCard > VCardTitle + VCardText > VTable）
      if (pageNode.component == 'VCard') {
        final expansion = _extractExpansionCard(pageNode);
        if (expansion != null) {
          blocks.add(expansion);
          continue;
        }
        final tableCard = _extractTableFromCard(pageNode);
        if (tableCard != null) {
          if (tableCard.$1.isNotEmpty) {
            blocks.add(PageHeaderBlock(title: tableCard.$1, subtitle: null));
          }
          blocks.add(tableCard.$2);
          continue;
        }
        // VCard > VRow > VCol[] 每列 VIcon + div(数值) + div(标签) 的统计卡片网格
        final statCards = _extractStatCardsFromRow(pageNode);
        if (statCards.isNotEmpty) {
          for (final b in statCards) blocks.add(b);
          continue;
        }
        final statCard = _extractStatCard(pageNode);
        if (statCard != null) blocks.add(statCard);
        continue;
      }
      if (pageNode.component == 'VRow') {
        final header = _extractPageHeader(pageNode);
        if (header != null) {
          blocks.add(header);
          continue;
        }
        for (final col in pageNode.content) {
          if (col.component != 'VCol') continue;
          final child = col.content.isNotEmpty ? col.content.first : null;
          if (child == null) continue;
          if (child.component == 'VCard') {
            final expansion = _extractExpansionCard(child);
            if (expansion != null) {
              blocks.add(expansion);
            } else {
              final card = _extractStatCard(child);
              if (card != null) blocks.add(card);
            }
          } else if (child.component == 'VApexChart') {
            final chart = _extractChart(child);
            if (chart != null) blocks.add(chart);
          } else if (child.component == 'VTable') {
            final table = _extractTable(child);
            if (table != null) blocks.add(table);
          }
        }
      }
    }
    for (final pageNode in response.page) {
      if (pageNode.component == 'style') continue;
      _collectFormFields(pageNode, blocks, null);
    }
    return blocks;
  }

  static String _extractCardTitleFromRow(FormNode row) {
    for (final col in row.content) {
      if (col.component != 'VCol') continue;
      for (final node in col.content) {
        if (node.component == 'span') {
          final cls = node.props?['class']?.toString() ?? '';
          if (cls.contains('font-weight-bold')) {
            final t = _textOf(node) ?? _collectText(node).trim();
            if (t.isNotEmpty) return t;
          }
        }
      }
    }
    return '';
  }

  static PageHeaderBlock? _extractPageHeader(FormNode row) {
    if (row.content.length != 1) return null;
    final col = row.content.first;
    if (col.component != 'VCol') return null;
    final div = col.content.isNotEmpty ? col.content.first : null;
    if (div == null || div.component != 'div') return null;
    String? title;
    String? subtitle;
    for (final node in div.content) {
      if (node.component == 'h2' || node.component == 'h1') {
        title = _textOf(node);
        break;
      }
    }
    for (final node in div.content) {
      if (node.component == 'VChip') {
        subtitle = _textOf(node);
        break;
      }
    }
    if (title != null && title.isNotEmpty) {
      return PageHeaderBlock(title: title, subtitle: subtitle);
    }
    return null;
  }

  /// 从 VIcon 节点提取图标名：支持 text、props.icon、content 内文本
  static String? _extractIconNameFromVIcon(FormNode? iconNode) {
    if (iconNode == null) return null;
    var name = iconNode.text?.toString().trim();
    if (name != null && name.isNotEmpty) return name;
    name = iconNode.props?['icon']?.toString().trim();
    if (name != null && name.isNotEmpty) return name;
    if (iconNode.content.isNotEmpty) {
      name = iconNode.content.first.text?.toString().trim();
      if (name != null && name.isNotEmpty) return name;
      name = _collectText(iconNode.content.first).trim();
      if (name.isNotEmpty) return name;
    }
    return null;
  }

  static FormNode? _findComponent(FormNode node, String component) {
    if (node.component == component) return node;
    for (final c in node.content) {
      final found = _findComponent(c, component);
      if (found != null) return found;
    }
    return null;
  }

  static void _collectComponents(FormNode node, String component, List<FormNode> out) {
    if (node.component == component) {
      out.add(node);
    }
    for (final c in node.content) {
      _collectComponents(c, component, out);
    }
  }

  static ExpansionCardBlock? _extractExpansionCard(FormNode card) {
    FormNode? cardTitleNode;
    FormNode? cardTextNode;
    for (final node in card.content) {
      if (node.component == 'VCardTitle') cardTitleNode = node;
      if (node.component == 'VCardText') cardTextNode = node;
    }
    // 优先从 VCardText 查找；也支持 VCard > VRow > VCol > VExpansionPanels 结构
    var panelsNode = cardTextNode != null
        ? _findComponent(cardTextNode, 'VExpansionPanels')
        : null;
    panelsNode ??= _findComponent(card, 'VExpansionPanels');
    if (panelsNode == null) return null;
    final items = <ExpansionItem>[];
    final panelList = <FormNode>[];
    _collectComponents(panelsNode, 'VExpansionPanel', panelList);
    for (final node in panelList) {
      final item = _extractExpansionPanelItem(node);
      if (item != null) items.add(item);
    }
    if (items.isEmpty) return null;
    String cardTitle = '';
    if (cardTitleNode != null) {
      cardTitle = _collectText(cardTitleNode).trim();
    }
    // 无 VCardTitle 时从首行 VRow > VCol > span.font-weight-bold 提取（如勋章站点名）
    if (cardTitle.isEmpty) {
      for (final node in card.content) {
        if (node.component == 'VRow') {
          cardTitle = _extractCardTitleFromRow(node);
          if (cardTitle.isNotEmpty) break;
        }
      }
    }
    String? cardSubtitle;
    if (cardTitleNode != null) {
      for (final node in cardTitleNode.content) {
        if (node.component == 'VChip') {
          cardSubtitle = _textOf(node);
          break;
        }
      }
    }
    String? iconName;
    final chipItems = <ChipItemData>[];
    for (final node in card.content) {
      if (node.component == 'VRow') {
        _collectChipItems(node, chipItems);
        if (iconName == null) {
          final iconNode = _findComponent(node, 'VIcon');
          iconName = _extractIconNameFromVIcon(iconNode);
        }
      }
    }
    return ExpansionCardBlock(
      cardTitle: cardTitle.isNotEmpty ? cardTitle : '详情',
      cardSubtitle: cardSubtitle,
      items: items,
      iconName: iconName,
      chipItems: chipItems,
    );
  }

  static void _collectChipItems(FormNode node, List<ChipItemData> out) {
    if (node.component == 'VChip') {
      final item = _extractChipItem(node);
      if (item != null) out.add(item);
      return;
    }
    for (final c in node.content) {
      _collectChipItems(c, out);
    }
  }

  static ChipItemData? _extractChipItem(FormNode chip) {
    String? iconName;
    String? iconColor;
    final textParts = <String>[];
    final iconNode = _findComponent(chip, 'VIcon');
    if (iconNode != null) {
      iconName = _extractIconNameFromVIcon(iconNode);
      iconColor = iconNode.props?['color']?.toString();
    }
    for (final c in chip.content) {
      if (c.component == 'span' || c.component == 'div') {
        final t = _collectText(c).trim();
        if (t.isNotEmpty) textParts.add(t);
      }
    }
    final text = textParts.join(' ').trim();
    if (text.isEmpty && iconName == null) return null;
    final backgroundColor = chip.props?['color']?.toString();
    return ChipItemData(
      iconName: iconName,
      iconColor: iconColor,
      text: text.isNotEmpty ? text : (iconName ?? ''),
      backgroundColor: backgroundColor,
    );
  }

  static void _collectCaptionLines(FormNode node, List<String> out) {
    if (node.component == 'div') {
      final cls = node.props?['class']?.toString() ?? '';
      if (cls.contains('text-caption')) {
        final t = _collectText(node).trim();
        if (t.isNotEmpty) out.add(t);
      }
      return;
    }
    for (final c in node.content) {
      _collectCaptionLines(c, out);
    }
  }

  static ExpansionItem? _extractExpansionPanelItem(FormNode panel) {
    FormNode? titleNode;
    FormNode? textNode;
    for (final node in panel.content) {
      if (node.component == 'VExpansionPanelTitle') titleNode = node;
      if (node.component == 'VExpansionPanelText') textNode = node;
    }
    if (titleNode == null) return null;
    String title = '';
    String? subtitle;
    for (final inner in titleNode.content) {
      final div = inner.component == 'div' ? inner : null;
      if (div != null) {
        for (final c in div.content) {
          if (c.component == 'span' && (c.props?['class']?.toString() ?? '').contains('font-weight')) {
            title = _textOf(c) ?? title;
          }
          if (c.component == 'span' && (c.props?['class']?.toString() ?? '').contains('text-caption')) {
            subtitle = _textOf(c);
          }
        }
        if (title.isEmpty) title = _collectText(div).trim();
        break;
      }
    }
    if (title.isEmpty && titleNode.content.isNotEmpty) {
      title = _collectText(titleNode.content.first).trim();
    }
    final bodyLines = <String>[];
    final medalCards = <MedalCardData>[];
    if (textNode != null) {
      for (final node in textNode.content) {
        if (node.component == 'VList') {
          for (final item in node.content) {
            if (item.component == 'VListItem') {
              final line = _collectText(item).trim();
              if (line.isNotEmpty) bodyLines.add(line);
            }
          }
        } else if (node.component == 'VCardTitle') {
          final line = _collectText(node).trim();
          if (line.isNotEmpty) bodyLines.add(line);
        } else if (node.component == 'VRow') {
          for (final col in node.content) {
            if (col.component != 'VCol') continue;
            for (final child in col.content) {
              if (child.component == 'VCard') {
                final medal = _extractMedalCard(child);
                if (medal != null) {
                  medalCards.add(medal);
                } else {
                  final line = _collectMedalCardSummary(child);
                  if (line.isNotEmpty) bodyLines.add(line);
                }
              }
            }
          }
        } else {
          final line = _collectText(node).trim();
          if (line.isNotEmpty) bodyLines.add(line);
        }
      }
    }
    return ExpansionItem(
      title: title,
      subtitle: subtitle,
      bodyLines: bodyLines,
      medalCards: medalCards,
    );
  }

  static MedalCardData? _extractMedalCard(FormNode card) {
    String? title;
    String description = '';
    String? imageUrl;
    final detailLines = <String>[];
    String? price;
    String? actionLabel;
    String? actionColor;
    for (final node in card.content) {
      if (node.component == 'VCardTitle') {
        title = _collectText(node).trim();
      } else if (node.component == 'VImg') {
        imageUrl = node.props?['src']?.toString();
      } else if (node.component == 'div') {
        final text = _collectText(node).trim();
        if (text.isEmpty) continue;
        final cls = node.props?['class']?.toString() ?? '';
        final style = node.props?['style']?.toString() ?? '';
        final isCaption = cls.contains('text-caption');
        final isDesc = style.contains('color:#888') || style.contains('color: #888');
        if (isCaption) {
          detailLines.add(text);
        } else if (isDesc && description.isEmpty) {
          description = text;
        }
      } else if (node.component == 'VRow') {
        _collectCaptionLines(node, detailLines);
        final priceInRow = _findPriceInNode(node);
        if (priceInRow != null) price = priceInRow;
        final chip = _findComponent(node, 'VChip');
        if (chip != null) {
          actionLabel = _collectText(chip).trim();
          actionColor = chip.props?['color']?.toString();
        }
      }
    }
    if (title == null || title.isEmpty) return null;
    return MedalCardData(
      title: title,
      description: description,
      imageUrl: imageUrl?.isNotEmpty == true ? imageUrl : null,
      detailLines: detailLines,
      price: price,
      actionLabel: actionLabel,
      actionColor: actionColor,
    );
  }

  static String _collectMedalCardSummary(FormNode card) {
    String? name;
    String? price;
    for (final node in card.content) {
      if (node.component == 'VCardTitle') {
        name = _collectText(node).trim();
      } else {
        final t = _findPriceInNode(node);
        if (t != null) price = t;
      }
    }
    if (name != null && name.isNotEmpty) {
      return price != null && price.isNotEmpty ? '$name · $price' : name;
    }
    return _collectText(card).trim();
  }

  static String? _findPriceInNode(FormNode node) {
    final text = _collectText(node).trim();
    if (!text.contains('价格：')) return null;
    for (final c in node.content) {
      final t = _findPriceInNode(c);
      if (t != null) return t;
    }
    return text;
  }

  static String _collectText(FormNode node) {
    if (node.text != null) return node.text.toString();
    final buf = StringBuffer();
    for (final c in node.content) {
      final t = _collectText(c);
      if (buf.isNotEmpty && t.isNotEmpty) buf.write(' ');
      buf.write(t);
    }
    return buf.toString();
  }

  static void _collectConfNodes(
    FormNode node,
    List<FormBlock> blocks,
    Map<String, dynamic>? model,
  ) {
    if (node.component == 'VSwitch') {
      final sw = _extractSwitch(node, model);
      if (sw != null) blocks.add(sw);
    } else if (node.component == 'VTextField') {
      final tf = _extractTextField(node, model);
      if (tf != null) blocks.add(tf);
    } else if (node.component == 'VTextarea') {
      final ta = _extractTextArea(node, model);
      if (ta != null) blocks.add(ta);
    } else if (node.component == 'cron' ||
        node.component.toLowerCase().contains('cron')) {
      final cron = _extractCron(node, model);
      if (cron != null) blocks.add(cron);
    } else if (node.component == 'VAlert') {
      final alert = _extractAlert(node);
      if (alert != null) blocks.add(alert);
    } else if (node.component == 'VSelect') {
      final select = _extractSelect(node, model);
      if (select != null) blocks.add(select);
    }
    for (final c in node.content) {
      _collectConfNodes(c, blocks, model);
    }
  }

  static void _collectFormFields(
    FormNode node,
    List<FormBlock> blocks,
    Map<String, dynamic>? model,
  ) {
    if (node.component == 'VSwitch') {
      final sw = _extractSwitch(node, model);
      if (sw != null) blocks.add(sw);
    } else if (node.component == 'VTextField') {
      final tf = _extractTextField(node, model);
      if (tf != null) blocks.add(tf);
    } else if (node.component == 'VTextarea') {
      final ta = _extractTextArea(node, model);
      if (ta != null) blocks.add(ta);
    } else if (node.component == 'cron' ||
        node.component.toLowerCase().contains('cron')) {
      final cron = _extractCron(node, model);
      if (cron != null) blocks.add(cron);
    }
    for (final c in node.content) {
      _collectFormFields(c, blocks, model);
    }
  }

  static AlertBlock? _extractAlert(FormNode node) {
    final props = node.props;
    if (props == null) return null;
    final type = props['type']?.toString().trim() ?? 'info';
    final text = props['text']?.toString().trim() ?? '';
    if (text.isEmpty) return null;
    return AlertBlock(type: type, text: text);
  }

  static bool _boolFromDynamic(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    if (v is String) return v.toLowerCase() == 'true' || v == '1';
    if (v is num) return v != 0;
    return false;
  }

  static dynamic _valueFromModel(
    Map<String, dynamic>? model,
    String? key,
    dynamic fallback,
  ) {
    if (key == null || key.isEmpty || model == null) return fallback;
    return model[key] ?? fallback;
  }

  static SwitchFieldBlock? _extractSwitch(
    FormNode node,
    Map<String, dynamic>? model,
  ) {
    final props = node.props;
    if (props == null) return null;
    final label = props['label']?.toString().trim() ?? '';
    final name = props['model']?.toString() ?? props['name']?.toString();
    final raw = _valueFromModel(
      model,
      name,
      props['modelValue'] ?? props['value'],
    );
    final value = _boolFromDynamic(raw);
    return SwitchFieldBlock(label: label, value: value, name: name);
  }

  static CronFieldBlock? _extractCron(
    FormNode node,
    Map<String, dynamic>? model,
  ) {
    final props = node.props;
    if (props == null) return null;
    final label = props['label']?.toString().trim() ?? '';
    final name = props['model']?.toString() ?? props['name']?.toString();
    final value = (_valueFromModel(
      model,
      name,
      props['modelValue'] ?? props['value'] ?? '',
    )).toString();
    final hint = props['hint']?.toString();
    return CronFieldBlock(
      label: label,
      value: value,
      name: name,
      hint: hint ?? '0 0 * * *',
    );
  }

  static TextFieldBlock? _extractTextField(
    FormNode node,
    Map<String, dynamic>? model,
  ) {
    final props = node.props;
    if (props == null) return null;
    final label = props['label']?.toString().trim() ?? '';
    final name = props['model']?.toString() ?? props['name']?.toString();
    final value = (_valueFromModel(
      model,
      name,
      props['modelValue'] ?? props['value'] ?? '',
    )).toString();
    final hint = props['placeholder']?.toString() ?? props['hint']?.toString();
    return TextFieldBlock(
      label: label,
      value: value,
      name: name,
      hint: hint,
    );
  }

  static TextAreaBlock? _extractTextArea(
    FormNode node,
    Map<String, dynamic>? model,
  ) {
    final props = node.props;
    if (props == null) return null;
    final label = props['label']?.toString().trim() ?? '';
    final name = props['model']?.toString() ?? props['name']?.toString();
    final value = (_valueFromModel(
      model,
      name,
      props['modelValue'] ?? props['value'] ?? '',
    )).toString();
    final hint = props['placeholder']?.toString() ?? props['hint']?.toString();
    final rowsRaw = props['rows'];
    final rows = rowsRaw is int
        ? rowsRaw
        : (int.tryParse(rowsRaw?.toString() ?? '') ?? 3);
    return TextAreaBlock(
      label: label,
      value: value,
      name: name,
      hint: hint,
      rows: rows.clamp(2, 10),
    );
  }

  static StatCardBlock? _extractStatCard(FormNode card) {
    String? caption;
    String? value;
    String? iconSrc;
    for (final node in card.content) {
      if (node.component == 'VCardText' || node.component == 'div') {
        _visitForStatCard(node, (c, v, src) {
          caption ??= c;
          value ??= v;
          iconSrc ??= src;
        });
      }
    }
    if (caption != null && value != null) {
      // 去除 /plugin_icon/ 前缀，便于 ImageUtil.convertPluginIconUrl 使用
      String? normalized = iconSrc;
      final src = iconSrc;
      if (src != null &&
          src.isNotEmpty &&
          src.startsWith('/plugin_icon/')) {
        normalized = src.substring('/plugin_icon/'.length);
      }
      return StatCardBlock(caption: caption!, value: value!, iconSrc: normalized);
    }
    return null;
  }

  /// VCard > VRow > VCol[] 每列: VIcon + div(数值) + div(标签)
  static List<StatCardBlock> _extractStatCardsFromRow(FormNode card) {
    final result = <StatCardBlock>[];
    FormNode? rowNode;
    for (final node in card.content) {
      if (node.component == 'VRow') {
        rowNode = node;
        break;
      }
    }
    if (rowNode == null) return result;
    for (final col in rowNode.content) {
      if (col.component != 'VCol') continue;
      String? value;
      String? caption;
      String? iconName;
      String? iconColor;
      for (final node in col.content) {
        if (node.component == 'VIcon') {
          iconName = _extractIconNameFromVIcon(node);
          iconColor = node.props?['color']?.toString();
        } else if (node.component == 'div') {
          final text = _collectText(node).trim();
          if (text.isEmpty) continue;
          final cls = node.props?['class']?.toString() ?? '';
          final style = node.props?['style']?.toString() ?? '';
          final isValue = cls.contains('font-weight-bold') ||
              style.contains('font-size: 2rem') ||
              style.contains('font-size:2rem');
          final isCaption =
              cls.contains('text-body-2') || cls.contains('text-caption');
          if (isValue) {
            value ??= text;
          } else if (isCaption) {
            caption ??= text;
          } else if (value == null) {
            value = text;
          } else if (caption == null) {
            caption = text;
          }
        }
      }
      if (value != null && caption != null) {
        result.add(StatCardBlock(
          caption: caption,
          value: value,
          iconSrc: null,
          iconName: iconName,
          iconColor: iconColor,
        ));
      }
    }
    return result;
  }

  static void _visitForStatCard(
    FormNode node,
    void Function(String? caption, String? value, String? iconSrc) out,
  ) {
    if (node.component == 'VImg') {
      final src = node.props?['src']?.toString();
      if (src != null && src.isNotEmpty) out(null, null, src);
      return;
    }
    if (node.component == 'span') {
      final text = _textOf(node);
      if (text != null && text.isNotEmpty) {
        final props = node.props;
        final cls = props?['class']?.toString() ?? '';
        if (cls.contains('text-caption')) {
          out(text, null, null);
        } else if (cls.contains('text-h6')) {
          out(null, text, null);
        }
      }
      return;
    }
    for (final c in node.content) {
      _visitForStatCard(c, out);
    }
  }

  static String? _textOf(FormNode node) {
    if (node.text != null) return node.text.toString().trim();
    if (node.content.length == 1 && node.content.first.component == 'span') {
      return _textOf(node.content.first);
    }
    return null;
  }

  static ChartBlock? _extractChart(FormNode chart) {
    final props = chart.props;
    if (props == null) return null;
    final options = props['options'];
    if (options is! Map<String, dynamic>) return null;
    final chartOpt = options['chart'];
    final chartType = (chartOpt is Map && chartOpt['type'] != null)
        ? chartOpt['type'].toString()
        : 'pie';
    final title = options['title'] is Map
        ? (options['title'] as Map)['text']?.toString()
        : null;
    final labelsRaw = options['labels'];
    final labels = labelsRaw is List
        ? labelsRaw.map((e) => e?.toString() ?? '').toList()
        : <String>[];
    final seriesRaw = props['series'];
    final series = seriesRaw is List
        ? seriesRaw.map((e) => (e is num) ? e : (num.tryParse(e?.toString() ?? '') ?? 0)).toList()
        : <num>[];
    return ChartBlock(
      title: title,
      labels: labels,
      series: series,
      chartType: chartType,
    );
  }

  /// 从 VCard（VCardTitle + VCardText > VTable）中提取标题与表格
  static (String title, TableBlock table)? _extractTableFromCard(FormNode card) {
    FormNode? cardTitleNode;
    FormNode? cardTextNode;
    for (final node in card.content) {
      if (node.component == 'VCardTitle') cardTitleNode = node;
      if (node.component == 'VCardText') cardTextNode = node;
    }
    if (cardTextNode == null) return null;
    final tableNode = _findComponent(cardTextNode, 'VTable');
    if (tableNode == null) return null;
    final table = _extractTable(tableNode);
    if (table == null) return null;
    String title = '';
    if (cardTitleNode != null) title = _collectText(cardTitleNode).trim();
    return (title, table);
  }

  /// 解析 td：若含 VIcon 则返回 {icon, color, label?}，否则返回纯文本
  static dynamic _extractTableCell(FormNode td) {
    final iconNode = _findComponent(td, 'VIcon');
    if (iconNode != null) {
      final iconName = _extractIconNameFromVIcon(iconNode);
      final color = iconNode.props?['color']?.toString().trim();
      final label = _collectText(td).replaceAll(iconName ?? '', '').trim();
      return <String, dynamic>{
        'icon': iconName ?? '',
        'color': color ?? '',
        if (label.isNotEmpty) 'label': label,
      };
    }
    final cell = td.text?.toString().trim();
    return cell != null && cell.isNotEmpty ? cell : _collectText(td).trim();
  }

  static TableBlock? _extractTable(FormNode table) {
    final headers = <String>[];
    final rows = <List<dynamic>>[];
    for (final node in table.content) {
      if (node.component == 'thead') {
        // thead 可能为 thead > tr > th
        for (final tr in node.content) {
          if (tr.component == 'tr') {
            for (final th in tr.content) {
              if (th.component == 'th') {
                headers.add(_collectText(th).trim());
              }
            }
            break;
          }
        }
        if (headers.isEmpty) {
          for (final th in node.content) {
            if (th.component == 'th') headers.add(_collectText(th).trim());
          }
        }
      } else if (node.component == 'tbody') {
        for (final tr in node.content) {
          if (tr.component == 'tr') {
            final row = <dynamic>[];
            for (final td in tr.content) {
              if (td.component == 'td') {
                row.add(_extractTableCell(td));
              }
            }
            rows.add(row);
          }
        }
      }
    }
    if (headers.isNotEmpty || rows.isNotEmpty) {
      return TableBlock(headers: headers, rows: rows);
    }
    return null;
  }

  static SelectFieldBlock? _extractSelect(
    FormNode node,
    Map<String, dynamic>? model,
  ) {
    final props = node.props;
    if (props == null) return null;
    final label = props['label']?.toString().trim() ?? '';
    final name = props['model']?.toString() ?? props['name']?.toString();
    final multiple = _boolFromDynamic(props['multiple'] ?? false);
    final itemsRaw = props['items'];
    if (itemsRaw is! List) return null;
    final items = <SelectOption>[];
    for (final item in itemsRaw) {
      if (item is Map<String, dynamic>) {
        final title = item['title']?.toString() ?? '';
        final value = item['value'];
        if (title.isNotEmpty) {
          items.add(SelectOption(title: title, value: value));
        }
      }
    }
    if (items.isEmpty) return null;
    final raw = _valueFromModel(
      model,
      name,
      props['modelValue'] ?? props['value'],
    );
    return SelectFieldBlock(
      label: label,
      items: items,
      value: raw,
      name: name,
      multiple: multiple,
    );
  }
}
