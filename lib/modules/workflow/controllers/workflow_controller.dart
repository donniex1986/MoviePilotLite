import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/workflow/models/workflow_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class WorkflowController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final items = <WorkflowModel>[].obs;
  final sharedWorkflows = <SharedWorkflow>[].obs;
  final isLoading = false.obs;
  final isLoadingShared = false.obs;
  final isLoadingMore = false.obs;
  final errorText = RxnString();
  final errorTextShared = RxnString();
  final keyword = ''.obs;
  final currentPage = 1.obs;
  final hasMore = true.obs;

  @override
  void onReady() {
    super.onReady();
    load();
    loadSharedWorkflows();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;

    try {
      final response = await _apiClient.get<dynamic>('/api/v1/workflow/');
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '获取工作流列表失败 (HTTP $status)';
        if (items.isEmpty) items.clear();
        return;
      }

      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final workflows = <WorkflowModel>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            workflows.add(WorkflowModel.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析工作流失败');
          }
        }
      }

      items.assignAll(workflows);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载工作流失败');
      errorText.value = '加载失败，请稍后重试';
      if (items.isEmpty) items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> startWorkflow(int workflowId) async {
    try {
      final response = await _apiClient.post<dynamic>(
        '/api/v1/workflow/$workflowId/start',
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('启动工作流失败 (HTTP $status)');
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == true) {
        await load();
        return true;
      }
      final msg = data is Map ? data['message']?.toString() : null;
      _log.warning('启动工作流失败: ${msg ?? "未知错误"}');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '启动工作流失败');
      return false;
    }
  }

  Future<bool> pauseWorkflow(int workflowId) async {
    try {
      final response = await _apiClient.post<dynamic>(
        '/api/v1/workflow/$workflowId/pause',
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('停止工作流失败 (HTTP $status)');
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == true) {
        await load();
        return true;
      }
      final msg = data is Map ? data['message']?.toString() : null;
      _log.warning('停止工作流失败: ${msg ?? "未知错误"}');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '停止工作流失败');
      return false;
    }
  }

  Future<bool> resetWorkflow(int workflowId) async {
    try {
      final response = await _apiClient.post<dynamic>(
        '/api/v1/workflow/$workflowId/reset',
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('重置工作流失败 (HTTP $status)');
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == true) {
        await load();
        return true;
      }
      final msg = data is Map ? data['message']?.toString() : null;
      _log.warning('重置工作流失败: ${msg ?? "未知错误"}');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '重置工作流失败');
      return false;
    }
  }

  Future<bool> deleteWorkflow(int workflowId) async {
    try {
      final response = await _apiClient.delete<dynamic>(
        '/api/v1/workflow/$workflowId',
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('删除工作流失败 (HTTP $status)');
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == true) {
        items.removeWhere((w) => w.id == workflowId);
        return true;
      }
      final msg = data is Map ? data['message']?.toString() : null;
      _log.warning('删除工作流失败: ${msg ?? "未知错误"}');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '删除工作流失败');
      return false;
    }
  }

  Future<void> loadSharedWorkflows() async {
    currentPage.value = 1;
    hasMore.value = true;
    isLoadingShared.value = true;
    errorTextShared.value = null;

    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/workflow/shares',
        queryParameters: {
          'page': currentPage.value,
          'count': 30,
          'name': keyword.value,
        },
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorTextShared.value = '获取分享工作流失败 (HTTP $status)';
        if (sharedWorkflows.isEmpty) sharedWorkflows.clear();
        return;
      }

      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final workflows = <SharedWorkflow>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            workflows.add(SharedWorkflow.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析分享工作流失败');
          }
        }
      }

      sharedWorkflows.assignAll(workflows);
      hasMore.value = workflows.length == 30;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载分享工作流失败');
      errorTextShared.value = '加载失败，请稍后重试';
      if (sharedWorkflows.isEmpty) sharedWorkflows.clear();
    } finally {
      isLoadingShared.value = false;
    }
  }

  Future<void> loadMoreSharedWorkflows() async {
    if (isLoadingMore.value || !hasMore.value) return;

    isLoadingMore.value = true;

    try {
      final nextPage = currentPage.value + 1;
      final response = await _apiClient.get<dynamic>(
        '/api/v1/workflow/shares',
        queryParameters: {'page': nextPage, 'count': 30, 'name': keyword.value},
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('加载更多分享工作流失败 (HTTP $status)');
        return;
      }

      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final workflows = <SharedWorkflow>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            workflows.add(SharedWorkflow.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析分享工作流失败');
          }
        }
      }

      if (workflows.isNotEmpty) {
        sharedWorkflows.addAll(workflows);
        currentPage.value = nextPage;
        hasMore.value = workflows.length == 30;
      } else {
        hasMore.value = false;
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载更多分享工作流失败');
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<bool> forkWorkflow(SharedWorkflow workflow) async {
    try {
      final response = await _apiClient.post<dynamic>(
        '/api/v1/workflow/fork',
        data: {
          'id': workflow.id,
          'share_title': workflow.shareTitle,
          'share_comment': workflow.shareComment,
          'share_user': workflow.shareUser,
          'share_uid': workflow.shareUid,
          'name': workflow.name,
          'description': workflow.description,
          'timer': workflow.timer,
          'trigger_type': workflow.triggerType,
          'event_type': workflow.eventType,
          'event_conditions': workflow.eventConditions,
          'actions': workflow.actions,
          'flows': workflow.flows,
        },
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _log.warning('复刻工作流失败 (HTTP $status)');
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == true) {
        await load();
        return true;
      }
      final msg = data is Map ? data['message']?.toString() : null;
      _log.warning('复刻工作流失败: ${msg ?? "未知错误"}');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '复刻工作流失败');
      return false;
    }
  }

  void updateKeyword(String value) {
    keyword.value = value;
    loadSharedWorkflows();
  }
}
