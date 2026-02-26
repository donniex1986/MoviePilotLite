import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 自定义规则详情 Sheet（只读展示）
/// UI 参照 SettingsBasicPage，使用 CupertinoListSection + SettingsFieldRow 扁平化设计
class CustomRuleDetailSheet extends StatelessWidget {
  const CustomRuleDetailSheet({
    super.key,
    required this.rule,
  });

  final CustomFilterRule rule;

  static Future<void> show(BuildContext context, CustomFilterRule rule) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => CustomRuleDetailSheet(rule: rule),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title =
        rule.name.isNotEmpty ? '${rule.name} - 配置' : '${rule.id} - 配置';
    final maxHeight = MediaQuery.of(context).size.height * 0.85;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

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
                          title: '规则ID',
                          description: '字符与数字组合，不能含空格',
                          icon: CupertinoIcons.tag,
                          iconColor: CupertinoColors.systemBlue,
                          value: rule.id,
                          onCopy: () {
                            Clipboard.setData(ClipboardData(text: rule.id));
                            ToastUtil.success('已复制');
                          },
                        ),
                        _buildFieldRow(
                          context,
                          title: '规则名称',
                          description: '使用别名便于区分规则',
                          icon: CupertinoIcons.doc_text,
                          iconColor: CupertinoColors.systemBlue,
                          value: rule.name,
                          onCopy: () {
                            Clipboard.setData(ClipboardData(text: rule.name));
                            ToastUtil.success('已复制');
                          },
                        ),
                      ],
                    ),
                    _buildSection(
                      context,
                      header: '关键词筛选',
                      accentColor: CupertinoColors.systemGreen,
                      children: [
                        _buildFieldRow(
                          context,
                          title: '包含',
                          description:
                              '必须包含的关键字或正则表达式，多个值使用 | 分隔',
                          icon: CupertinoIcons.plus_circle,
                          iconColor: CupertinoColors.systemGreen,
                          value: rule.include,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.include));
                            ToastUtil.success('已复制');
                          },
                        ),
                        _buildFieldRow(
                          context,
                          title: '排除',
                          description:
                              '不能包含的关键字或正则表达式，多个值使用 | 分隔',
                          icon: CupertinoIcons.minus_circle,
                          iconColor: CupertinoColors.systemGreen,
                          value: rule.exclude,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.exclude));
                            ToastUtil.success('已复制');
                          },
                        ),
                      ],
                    ),
                    _buildSection(
                      context,
                      header: '资源限制',
                      accentColor: CupertinoColors.systemOrange,
                      children: [
                        _buildFieldRow(
                          context,
                          title: '资源体积(MB)',
                          description:
                              '最小资源文件体积或体积范围(剧集计算单集平均大小)',
                          icon: CupertinoIcons.archivebox,
                          iconColor: CupertinoColors.systemOrange,
                          value: rule.sizeRange,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.sizeRange));
                            ToastUtil.success('已复制');
                          },
                        ),
                        _buildFieldRow(
                          context,
                          title: '做种人数',
                          description: '最小做种人数或做种人数范围',
                          icon: CupertinoIcons.person_2,
                          iconColor: CupertinoColors.systemOrange,
                          value: rule.seeders,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.seeders));
                            ToastUtil.success('已复制');
                          },
                        ),
                        _buildFieldRow(
                          context,
                          title: '发布时间(分钟)',
                          description: '距离资源发布的最小时间间隔或时间区间',
                          icon: CupertinoIcons.clock,
                          iconColor: CupertinoColors.systemOrange,
                          value: rule.publishTime,
                          onCopy: () {
                            Clipboard.setData(
                                ClipboardData(text: rule.publishTime));
                            ToastUtil.success('已复制');
                          },
                        ),
                      ],
                    ),
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
    required VoidCallback onCopy,
  }) {
    final hasValue = value.isNotEmpty;
    return SettingsFieldRow(
      title: title,
      description: description,
      icon: icon,
      iconColor: iconColor,
      iconBackgroundColor: iconColor.withValues(alpha: 0.15),
      controlType: SettingsControlType.textCopy,
      controlValue: hasValue ? value : '-',
      editable: false,
      enableCopy: hasValue,
      onCopyTap: hasValue ? onCopy : null,
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
                  CupertinoIcons.slider_horizontal_3,
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
