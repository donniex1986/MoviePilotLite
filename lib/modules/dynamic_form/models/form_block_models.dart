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
}
