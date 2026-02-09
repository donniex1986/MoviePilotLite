import 'package:freezed_annotation/freezed_annotation.dart';

part 'dynamic_form_models.freezed.dart';
part 'dynamic_form_models.g.dart';

/// 动态表单顶层响应（支持 page 展示页 或 conf+model 配置表单）
@freezed
class DynamicFormResponse with _$DynamicFormResponse {
  const factory DynamicFormResponse({
    String? render_mode,
    @Default([]) List<FormNode> page,
    @Default([]) List<FormNode> conf,
    Map<String, dynamic>? model,
  }) = _DynamicFormResponse;

  factory DynamicFormResponse.fromJson(Map<String, dynamic> json) =>
      _$DynamicFormResponseFromJson(json);
}

/// 递归表单节点（component / props / content / text）
@freezed
class FormNode with _$FormNode {
  const factory FormNode({
    required String component,
    Map<String, dynamic>? props,
    @Default([]) List<FormNode> content,
    dynamic text,
  }) = _FormNode;

  factory FormNode.fromJson(Map<String, dynamic> json) =>
      _$FormNodeFromJson(json);
}
