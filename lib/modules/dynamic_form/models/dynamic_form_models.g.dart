// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_form_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicFormResponseImpl _$$DynamicFormResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DynamicFormResponseImpl(
  render_mode: json['render_mode'] as String?,
  page:
      (json['page'] as List<dynamic>?)
          ?.map((e) => FormNode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  conf:
      (json['conf'] as List<dynamic>?)
          ?.map((e) => FormNode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  model: json['model'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$DynamicFormResponseImplToJson(
  _$DynamicFormResponseImpl instance,
) => <String, dynamic>{
  'render_mode': instance.render_mode,
  'page': instance.page,
  'conf': instance.conf,
  'model': instance.model,
};

_$FormNodeImpl _$$FormNodeImplFromJson(Map<String, dynamic> json) =>
    _$FormNodeImpl(
      component: json['component'] == null
          ? ''
          : _stringFromJson(json['component']),
      props: json['props'] as Map<String, dynamic>?,
      content: json['content'] == null
          ? const []
          : _contentFromJson(json['content']),
      text: json['text'],
      events: json['events'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FormNodeImplToJson(_$FormNodeImpl instance) =>
    <String, dynamic>{
      'component': instance.component,
      'props': instance.props,
      'content': instance.content,
      'text': instance.text,
      'events': instance.events,
    };
