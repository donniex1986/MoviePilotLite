import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_block_models.freezed.dart';

/// 移动端精简后的表单区块（去除 Vuetify/Web 无用参数）
@freezed
sealed class FormBlock with _$FormBlock {
  const FormBlock._();

  /// 统计卡片：图标 + 标题 + 数值
  const factory FormBlock.statCard({
    required String caption,
    required String value,
    String? iconSrc,
  }) = StatCardBlock;

  /// 图表：标题 + 标签 + 数据 + 类型
  const factory FormBlock.chart({
    String? title,
    @Default([]) List<String> labels,
    @Default([]) List<num> series,
    @Default('pie') String chartType,
  }) = ChartBlock;

  /// 表格：表头 + 行数据
  const factory FormBlock.table({
    @Default([]) List<String> headers,
    @Default([]) List<List<dynamic>> rows,
  }) = TableBlock;

  /// 开关：标签 + 当前值
  const factory FormBlock.switchField({
    required String label,
    @Default(false) bool value,
    String? name,
  }) = SwitchFieldBlock;

  /// Cron 表达式：标签 + 当前值
  const factory FormBlock.cronField({
    required String label,
    @Default('') String value,
    String? name,
    String? hint,
  }) = CronFieldBlock;

  /// 单行文本：标签 + 当前值
  const factory FormBlock.textField({
    required String label,
    @Default('') String value,
    String? name,
    String? hint,
  }) = TextFieldBlock;

  /// 多行文本：标签 + 当前值
  const factory FormBlock.textArea({
    required String label,
    @Default('') String value,
    String? name,
    String? hint,
    @Default(3) int rows,
  }) = TextAreaBlock;

  /// 提示条：类型 + 文案
  const factory FormBlock.alert({
    @Default('info') String type,
    required String text,
  }) = AlertBlock;

  /// 下拉选择：标签 + 选项列表 + 当前值（单选或多选）
  const factory FormBlock.selectField({
    required String label,
    @Default([]) List<SelectOption> items,
    dynamic value,
    String? name,
    @Default(false) bool multiple,
  }) = SelectFieldBlock;

  /// 页面标题行：标题 + 可选副标题
  const factory FormBlock.pageHeader({
    required String title,
    String? subtitle,
  }) = PageHeaderBlock;

  /// 折叠卡片：卡片标题 + 副标题 + 可折叠项列表
  const factory FormBlock.expansionCard({
    required String cardTitle,
    String? cardSubtitle,
    @Default([]) List<ExpansionItem> items,
  }) = ExpansionCardBlock;
}

/// 折叠项：标题 + 副标题 + 正文行
@freezed
class ExpansionItem with _$ExpansionItem {
  const factory ExpansionItem({
    required String title,
    String? subtitle,
    @Default([]) List<String> bodyLines,
  }) = _ExpansionItem;
}

/// 选择项：标题 + 值
@freezed
class SelectOption with _$SelectOption {
  const factory SelectOption({
    required String title,
    required dynamic value,
  }) = _SelectOption;
}
