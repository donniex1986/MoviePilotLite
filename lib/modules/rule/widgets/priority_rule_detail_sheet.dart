import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 优先级规则详情 Sheet（只读展示）
/// UI 参照 SettingsBasicPage + 参考图，规则以标签形式展示
class PriorityRuleDetailSheet extends StatelessWidget {
  const PriorityRuleDetailSheet({
    super.key,
    required this.rule,
  });

  final UserFilterRuleGroup rule;

  static Future<void> show(BuildContext context, UserFilterRuleGroup rule) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => PriorityRuleDetailSheet(rule: rule),
    );
  }

  /// 解析 ruleString，按逗号、| 等分隔为多条规则用于标签展示
  List<String> _parseRuleTags(String ruleString) {
    if (ruleString.trim().isEmpty) return [];
    return ruleString
        .split(RegExp(r'[,|;]+'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final title =
        rule.name.isNotEmpty ? '${rule.name} - 配置' : '优先级规则 - 配置';
    final maxHeight = MediaQuery.of(context).size.height * 0.85;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final ruleTags = _parseRuleTags(rule.ruleString);

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context, title),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 8, bottom: 16 + bottomPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      context,
                      header: '基础信息',
                      accentColor: CupertinoColors.systemBlue,
                      children: [
                        _buildFieldRow(
                          context,
                          title: '规则组名称',
                          description: '规则组名称',
                          icon: CupertinoIcons.folder,
                          iconColor: CupertinoColors.systemBlue,
                          value: rule.name,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.name));
                            ToastUtil.success('已复制');
                          },
                        ),
                        _buildFieldRow(
                          context,
                          title: '媒体类型',
                          description: '媒体类型',
                          icon: CupertinoIcons.film,
                          iconColor: CupertinoColors.systemBlue,
                          value: rule.mediaType,
                          showCopy: false,
                          emptyPlaceholder: '全部',
                        ),
                        _buildFieldRow(
                          context,
                          title: '媒体类别',
                          description: '媒体类别',
                          icon: CupertinoIcons.square_stack_3d_up,
                          iconColor: CupertinoColors.systemBlue,
                          value: rule.category,
                          showCopy: false,
                          emptyPlaceholder: '全部',
                        ),
                      ],
                    ),
                    _buildRuleSection(context, ruleTags),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String header,
    required Color accentColor,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 16, 8),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 14,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
          CupertinoListSection.insetGrouped(
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            children: children,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRow(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required String value,
    VoidCallback? onCopy,
    bool showCopy = true,
    String emptyPlaceholder = '-',
  }) {
    final hasValue = value.isNotEmpty;
    final displayValue = hasValue ? value : emptyPlaceholder;
    return SettingsFieldRow(
      title: title,
      description: description,
      icon: icon,
      iconColor: iconColor,
      iconBackgroundColor: iconColor.withValues(alpha: 0.15),
      controlType: showCopy && hasValue
          ? SettingsControlType.textCopy
          : SettingsControlType.text,
      controlValue: displayValue,
      editable: false,
      enableCopy: showCopy && hasValue,
      onCopyTap: showCopy && hasValue ? onCopy : null,
    );
  }

  Widget _buildRuleSection(BuildContext context, List<String> ruleTags) {
    final accentColor = CupertinoColors.systemGreen;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 16, 8),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 14,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '优先级规则',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                ),
                if (rule.ruleString.isNotEmpty) ...[
                  const Spacer(),
                  CupertinoButton(
                    padding: const EdgeInsets.only(right: 8),
                    minSize: 0,
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: rule.ruleString));
                      ToastUtil.success('已复制');
                    },
                    child: Icon(
                      CupertinoIcons.doc_on_doc,
                      size: 16,
                      color: accentColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          _buildRuleBlock(context, ruleTags, CupertinoColors.systemGreen),
        ],
      ),
    );
  }

  Widget _buildRuleBlock(
      BuildContext context, List<String> ruleTags, Color accentColor) {
    final bgColor =
        CupertinoColors.secondarySystemFill.resolveFrom(context);
    final borderColor = accentColor.withValues(alpha: 0.3);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      child: ruleTags.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                rule.ruleString.isEmpty ? '无规则' : rule.ruleString,
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.tertiaryLabel.resolveFrom(context),
                ),
              ),
            )
          : Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ruleTags
                  .map(
                    (tag) => _RuleTag(
                      label: tag,
                      accentColor: accentColor,
                      onCopy: () {
                        Clipboard.setData(ClipboardData(text: tag));
                        ToastUtil.success('已复制');
                      },
                    ),
                  )
                  .toList(),
            ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(8),
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(CupertinoIcons.xmark, size: 20),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.list_bullet,
                  size: 18,
                  color:
                      CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 44),
        ],
      ),
    );
  }
}

class _RuleTag extends StatelessWidget {
  const _RuleTag({
    required this.label,
    required this.onCopy,
    this.accentColor,
  });

  final String label;
  final VoidCallback onCopy;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? CupertinoColors.systemGreen;
    return GestureDetector(
      onLongPress: onCopy,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withValues(alpha: 0.35),
            width: 0.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
      ),
    );
  }
}
