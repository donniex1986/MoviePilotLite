import 'dart:async';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/modules/mediaserver/models/mediaserver_model.dart';
import 'package:talker/talker.dart';

/// 媒体服务器控制器
class MediaServerController extends GetxController {
  /// API客户端
  late final ApiClient apiClient;

  /// Talker日志实例
  late final Talker talker;

  /// 媒体服务器列表
  final mediaServers = Rx<List<MediaServer>>([]);

  /// 加载状态
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    talker = Talker();
    // 初始化API客户端
    apiClient = ApiClient('https://mploser.x.ddnsto.com', talker);
    // 加载媒体服务器数据
    loadMediaServers();
  }

  /// 加载媒体服务器数据
  Future<void> loadMediaServers() async {
    try {
      isLoading.value = true;
      talker.info('开始加载媒体服务器数据');
      final response = await apiClient.getMediaServers<Map<String, dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        if (data['success'] == true) {
          final value = data['data']['value'] as List<dynamic>;
          final servers = value
              .map((item) => MediaServer.fromJson(item))
              .toList();
          mediaServers.value = servers;
          talker.info('媒体服务器数据加载成功: ${servers.length} 个服务器');
        } else {
          talker.warning('媒体服务器数据加载失败: ${data['message']}');
        }
      } else if (response.statusCode == 401) {
        talker.error('媒体服务器数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('媒体服务器数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载媒体服务器数据失败');
    } finally {
      isLoading.value = false;
    }
  }

  /// 刷新媒体服务器数据
  Future<void> refreshMediaServers() async {
    await loadMediaServers();
  }

  /// 加载媒体服务器最新入库数据
  Future<Map<String, dynamic>?> loadLatestMediaData(String server) async {
    try {
      talker.info('开始加载媒体服务器最新入库数据: $server');
      final response = await apiClient
          .getLatestMediaServerData<Map<String, dynamic>>(server);
      if (response.statusCode == 200) {
        final data = response.data!;
        if (data['success'] == true) {
          talker.info('媒体服务器最新入库数据加载成功');
          return data;
        } else {
          talker.warning('媒体服务器最新入库数据加载失败: ${data['message']}');
          return null;
        }
      } else if (response.statusCode == 401) {
        talker.error('媒体服务器最新入库数据加载失败: 未授权，请重新登录');
        return null;
      } else {
        talker.warning('媒体服务器最新入库数据加载失败，状态码: ${response.statusCode}');
        return null;
      }
    } catch (e, st) {
      talker.handle(e, st, '加载媒体服务器最新入库数据失败');
      return null;
    }
  }
}
