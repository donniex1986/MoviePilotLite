class WorkflowAction {
  final String id;
  final String type;
  final String name;
  final String description;
  final Map<String, dynamic> data;

  const WorkflowAction({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.data,
  });

  factory WorkflowAction.fromJson(Map<String, dynamic> json) {
    return WorkflowAction(
      id: json['id']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      data: json['data'] is Map<String, dynamic>
          ? json['data'] as Map<String, dynamic>
          : {},
    );
  }
}

class WorkflowModel {
  final int id;
  final String name;
  final String description;
  final String? timer;
  final String triggerType;
  final String? eventType;
  final Map<String, dynamic> eventConditions;
  final String state;
  final String? currentAction;
  final String? result;
  final int runCount;
  final List<WorkflowAction> actions;
  final String? addTime;
  final String? lastTime;

  const WorkflowModel({
    required this.id,
    required this.name,
    required this.description,
    this.timer,
    required this.triggerType,
    this.eventType,
    required this.eventConditions,
    required this.state,
    this.currentAction,
    this.result,
    required this.runCount,
    required this.actions,
    this.addTime,
    this.lastTime,
  });

  bool get isRunning => state == 'R';
  bool get isPaused => state == 'P';
  bool get isWaiting => state == 'W';

  String get stateText {
    switch (state) {
      case 'W':
        return '等待';
      case 'P':
        return '暂停';
      case 'R':
        return '运行中';
      default:
        return state;
    }
  }

  String get triggerTypeText {
    switch (triggerType) {
      case 'timer':
        return '定时触发';
      case 'event':
        return '事件触发';
      default:
        return triggerType;
    }
  }

  factory WorkflowModel.fromJson(Map<String, dynamic> json) {
    final rawActions = json['actions'];
    final actionList = <WorkflowAction>[];
    if (rawActions is List) {
      for (final a in rawActions) {
        if (a is Map<String, dynamic>) {
          actionList.add(WorkflowAction.fromJson(a));
        }
      }
    }

    return WorkflowModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      timer: json['timer']?.toString(),
      triggerType: json['trigger_type']?.toString() ?? 'timer',
      eventType: json['event_type']?.toString(),
      eventConditions: json['event_conditions'] is Map<String, dynamic>
          ? json['event_conditions'] as Map<String, dynamic>
          : {},
      state: json['state']?.toString() ?? 'P',
      currentAction: json['current_action']?.toString(),
      result: json['result']?.toString(),
      runCount: json['run_count'] is int
          ? json['run_count'] as int
          : int.tryParse(json['run_count']?.toString() ?? '') ?? 0,
      actions: actionList,
      addTime: json['add_time']?.toString(),
      lastTime: json['last_time']?.toString(),
    );
  }
}
