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
    if (cardTextNode == null) return null;
    final panelsNode = _findComponent(cardTextNode, 'VExpansionPanels');
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
    String? cardSubtitle;
    if (cardTitleNode != null) {
      for (final node in cardTitleNode.content) {
        if (node.component == 'VChip') {
          cardSubtitle = _textOf(node);
          break;
        }
      }
    }
    return ExpansionCardBlock(
      cardTitle: cardTitle.isNotEmpty ? cardTitle : '详情',
      cardSubtitle: cardSubtitle,
      items: items,
    );
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
    if (textNode != null) {
      for (final node in textNode.content) {
        if (node.component == 'VList') {
          for (final item in node.content) {
            if (item.component == 'VListItem') {
              final line = _collectText(item).trim();
              if (line.isNotEmpty) bodyLines.add(line);
            }
          }
        } else {
          final line = _collectText(node).trim();
          if (line.isNotEmpty) bodyLines.add(line);
        }
      }
    }
    return ExpansionItem(title: title, subtitle: subtitle, bodyLines: bodyLines);
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

  static TableBlock? _extractTable(FormNode table) {
    List<String> headers = [];
    List<List<dynamic>> rows = [];
    for (final node in table.content) {
      if (node.component == 'thead') {
        for (final th in node.content) {
          if (th.component == 'th') {
            headers.add(_textOf(th) ?? '');
          }
        }
      } else if (node.component == 'tbody') {
        for (final tr in node.content) {
          if (tr.component == 'tr') {
            final row = <dynamic>[];
            for (final td in tr.content) {
              if (td.component == 'td') {
                row.add(td.text);
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
