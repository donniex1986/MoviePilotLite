import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import '../models/system_message.dart';

class SystemMessageController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final hasMore = true.obs;

  final messages = <SystemMessage>[].obs;
  final scrollController = ScrollController();
  final inputController = TextEditingController();
  final isSending = false.obs;

  int _page = 1;
  final int _size = 20;

  @override
  void onInit() {
    super.onInit();
    loadInitial();
  }

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadInitial() async {
    isLoading.value = true;
    _page = 1;
    hasMore.value = true;
    messages.clear();
    try {
      await _fetchPage(_page, appendOlder: false);
    } finally {
      isLoading.value = false;
      _scrollToBottom();
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore.value || !hasMore.value) return;
    isLoadingMore.value = true;
    try {
      _page += 1;
      await _fetchPage(_page, appendOlder: true);
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> _fetchPage(int page, {required bool appendOlder}) async {
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/message/web?page=$page&size=$_size',
      );
      final data = response.data;
      if (data == null) return;

      final list = _extractList(data);
      final items = list
          .whereType<Map<String, dynamic>>()
          .map(SystemMessage.fromJson)
          .toList();

      // 按时间升序：旧在上，新在下
      items.sort((a, b) => a.regTime.compareTo(b.regTime));

      if (appendOlder) {
        if (items.isEmpty) {
          hasMore.value = false;
        } else {
          messages.insertAll(0, items);
        }
      } else {
        messages.assignAll(items);
      }

      // 兜底判断是否还有更多
      if (items.length < _size) {
        hasMore.value = false;
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取系统消息失败');
    }
  }

  List<dynamic> _extractList(dynamic root) {
    if (root is List) return root;
    if (root is Map<String, dynamic>) {
      final direct = root['data'];
      if (direct is List) return direct;
      if (direct is Map<String, dynamic>) {
        for (final key in ['items', 'list', 'records', 'data']) {
          final value = direct[key];
          if (value is List) return value;
        }
      }
    }
    return const [];
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      final position = scrollController.position;
      if (position.maxScrollExtent > 0) {
        scrollController.jumpTo(position.maxScrollExtent);
      }
    });
  }

  Future<void> sendMessage() async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;
    isSending.value = true;
    try {
      await _apiClient.post<Map<String, dynamic>>(
        '/api/v1/message/web',
        queryParameters: {'text': text},
      );
      inputController.clear();
      await _fetchPage(1, appendOlder: false);
      _scrollToBottom();
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '发送消息失败');
    } finally {
      isSending.value = false;
    }
  }
}
