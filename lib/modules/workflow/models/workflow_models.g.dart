// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedWorkflowImpl _$$SharedWorkflowImplFromJson(Map<String, dynamic> json) =>
    _$SharedWorkflowImpl(
      id: (json['id'] as num).toInt(),
      shareTitle: json['share_title'] as String,
      shareComment: json['share_comment'] as String?,
      shareUser: json['share_user'] as String,
      shareUid: json['share_uid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      timer: json['timer'] as String?,
      triggerType: json['trigger_type'] as String?,
      eventType: json['event_type'] as String?,
      eventConditions: json['event_conditions'],
      actions: json['actions'] as String,
      flows: json['flows'] as String,
      context: json['context'],
      date: json['date'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$SharedWorkflowImplToJson(
  _$SharedWorkflowImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'share_title': instance.shareTitle,
  'share_comment': instance.shareComment,
  'share_user': instance.shareUser,
  'share_uid': instance.shareUid,
  'name': instance.name,
  'description': instance.description,
  'timer': instance.timer,
  'trigger_type': instance.triggerType,
  'event_type': instance.eventType,
  'event_conditions': instance.eventConditions,
  'actions': instance.actions,
  'flows': instance.flows,
  'context': instance.context,
  'date': instance.date,
  'count': instance.count,
};
