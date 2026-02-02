import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dashboard/models/statistic_model.dart';
import 'package:moviepilot_mobile/modules/dashboard/models/schedule_model.dart';
import 'package:moviepilot_mobile/modules/login/models/login_profile.dart';
import 'package:moviepilot_mobile/modules/mediaserver/controllers/mediaserver_controller.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/realm_service.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:talker/talker.dart';

/// Dashboard 控制器
class DashboardController extends GetxController {
  /// 可用的组件类型
  static const List<String> availableWidgets = [
    '存储空间',
    '媒体统计',
    '最近入库',
    '实时速率',
    '后台任务',
    'CPU',
    '内存',
    '网络流量',
    '我的媒体库',
    '继续观看',
    '最近添加',
    '最新入库',
  ];

  /// 当前显示的组件列表
  final displayedWidgets = <String>[].obs;

  /// CPU使用率
  final cpuUsage = 0.0.obs;

  /// 网络流量 [上行, 下行]
  final networkTraffic = <int>[0, 0].obs;

  /// 内存数据 [内存占用(字节), 使用率(%)]
  final memoryData = <int>[0, 0].obs;

  /// 下载器数据
  final downloaderData = <String, dynamic>{}.obs;

  /// 存储空间数据
  final storageData = <String, dynamic>{}.obs;

  /// 媒体统计数据
  final statisticData = Rx<StatisticModel>(
    const StatisticModel(
      movie_count: 0,
      tv_count: 0,
      episode_count: 0,
      user_count: 0,
    ),
  );

  /// 后台任务列表数据
  final scheduleData = Rx<List<ScheduleModel>>([]);

  /// 媒体服务器最新入库数据
  final latestMediaData = Rx<Map<String, dynamic>?>(null);

  /// 最近入库数据（一周内每天的入库量）
  final transferData = <int>[].obs;

  /// API客户端
  late final ApiClient apiClient;

  /// 媒体服务器控制器
  late final MediaServerController mediaServerController;

  /// 认证令牌
  String? token;

  /// Talker日志实例
  late final Talker talker;

  late Timer _cpuTimer;
  late Timer _networkTimer;
  late Timer _downloaderTimer;
  late Timer _memoryTimer;
  late RealmService _realmService;

  @override
  void onInit() {
    super.onInit();
    // 默认显示所有组件
    displayedWidgets.assignAll(availableWidgets);

    // 初始化Talker实例
    talker = Talker();
    talker.info('Dashboard控制器初始化');

    // 初始化Realm服务
    _realmService = RealmService();

    // 从登录信息中获取baseUrl和token
    final loginProfile = _getLatestLoginProfile();
    if (loginProfile != null) {
      token = loginProfile.accessToken;
      apiClient = ApiClient(loginProfile.server, talker, token: token);
      talker.info('从登录信息中获取认证数据成功');
    } else {
      talker.warning('未找到登录信息，请先登录');
      // 这里可以添加重定向到登录页面的逻辑
      ToastUtil.info('请先登录后再访问仪表盘');
    }

    // 初始化媒体服务器控制器
    mediaServerController = Get.put(MediaServerController());

    // 加载数据
    loadCpuData();
    loadNetworkData();
    loadMemoryData();
    loadDownloaderData();
    loadStorageData();
    loadStatisticData();
    loadScheduleData();
    loadLatestMediaData();
    loadTransferData();

    // 初始化定时任务队列，每5秒获取一次数据
    _cpuTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      loadCpuData();
    });

    _networkTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      loadNetworkData();
    });

    _downloaderTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      loadDownloaderData();
    });

    _memoryTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      loadMemoryData();
    });
  }

  @override
  void onClose() {
    _cpuTimer.cancel();
    _networkTimer.cancel();
    _downloaderTimer.cancel();
    _memoryTimer.cancel();
    _realmService.close();
    super.onClose();
  }

  /// 获取最新的登录配置文件
  LoginProfile? _getLatestLoginProfile() {
    try {
      final profiles = _realmService.realm.all<LoginProfile>();
      if (profiles.isEmpty) {
        return null;
      }
      // 按更新时间排序，返回最新的登录配置
      final sortedProfiles = profiles.toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return sortedProfiles.first;
    } catch (e, st) {
      talker.handle(e, st, '获取登录配置文件失败');
      return null;
    }
  }

  /// 添加组件
  void addWidget(String widget) {
    if (!displayedWidgets.contains(widget)) {
      displayedWidgets.add(widget);
    }
  }

  /// 移除组件
  void removeWidget(String widget) {
    displayedWidgets.remove(widget);
  }

  /// 重新排序组件
  void reorderWidgets(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = displayedWidgets.removeAt(oldIndex);
    displayedWidgets.insert(newIndex, item);
  }

  /// 加载CPU数据
  Future<void> loadCpuData() async {
    try {
      talker.info('开始加载CPU数据');
      final response = await apiClient.getCpuData<double>();
      if (response.statusCode == 200) {
        // 模拟CPU使用率的波动，使动画效果更明显
        final newUsage = response.data!;
        // 添加适当的随机波动，使数据变化更自然明显
        final fluctuation = (Random().nextDouble() * 2 - 1) * 2.0;
        final finalUsage = newUsage + fluctuation;
        // 确保CPU使用率在合理范围内
        cpuUsage.value = finalUsage.clamp(0.0, 100.0);
        talker.info('CPU数据加载成功: ${cpuUsage.value.toStringAsFixed(1)}%');
      } else if (response.statusCode == 401) {
        talker.error('CPU数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('CPU数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载CPU数据失败');
    }
  }

  /// 加载网络流量数据
  Future<void> loadNetworkData() async {
    try {
      talker.info('开始加载网络流量数据');
      final response = await apiClient.getNetworkData<List<dynamic>>();
      if (response.statusCode == 200) {
        final traffic = response.data!;
        if (traffic.length >= 2) {
          // 转换为int类型
          final uploadKbps = traffic.first as int? ?? 0;
          final downloadKbps = traffic.last as int? ?? 0;
          networkTraffic.value = [uploadKbps, downloadKbps];
          talker.info(
            '网络流量数据加载成功: 上行 ${uploadKbps}Kbps, 下行 ${downloadKbps}Kbps',
          );
        }
      } else if (response.statusCode == 401) {
        talker.error('网络流量数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('网络流量数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载网络流量数据失败');
    }
  }

  /// 加载下载器数据
  Future<void> loadDownloaderData() async {
    try {
      talker.info('开始加载下载器数据');
      final response = await apiClient
          .getDownloaderData<Map<String, dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        downloaderData.value = data;
        talker.info(
          '下载器数据加载成功: 下载速度 ${data['download_speed']}MB/s, 上传速度 ${data['upload_speed']}MB/s',
        );
      } else if (response.statusCode == 401) {
        talker.error('下载器数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('下载器数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载下载器数据失败');
    }
  }

  /// 加载存储空间数据
  Future<void> loadStorageData() async {
    try {
      talker.info('开始加载存储空间数据');
      final response = await apiClient.getStorageData<Map<String, dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        storageData.value = data;
        talker.info(
          '存储空间数据加载成功: 总存储 ${_formatStorageSize(data['total_storage'] ?? 0.0)}, 已用存储 ${_formatStorageSize(data['used_storage'] ?? 0.0)}',
        );
      } else if (response.statusCode == 401) {
        talker.error('存储空间数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('存储空间数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载存储空间数据失败');
    }
  }

  /// 格式化存储大小
  String _formatStorageSize(double bytes) {
    return SizeFormatter.formatSize(bytes, 2);
  }

  /// 加载媒体统计数据
  Future<void> loadStatisticData() async {
    try {
      talker.info('开始加载媒体统计数据');
      final response = await apiClient.getStatisticData<Map<String, dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        final statisticModel = StatisticModel.fromJson(data);
        statisticData.value = statisticModel;
        talker.info('媒体统计数据加载成功: $statisticModel');
      } else if (response.statusCode == 401) {
        talker.error('媒体统计数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('媒体统计数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载媒体统计数据失败');
    }
  }

  /// 加载后台任务列表数据
  Future<void> loadScheduleData() async {
    try {
      talker.info('开始加载后台任务列表数据');
      final response = await apiClient.getScheduleData<List<dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        final scheduleList = data
            .map((item) => ScheduleModel.fromJson(item))
            .toList();
        scheduleData.value = scheduleList;
        talker.info('后台任务列表数据加载成功: ${scheduleList.length} 个任务');
      } else if (response.statusCode == 401) {
        talker.error('后台任务列表数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('后台任务列表数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载后台任务列表数据失败');
    }
  }

  /// 加载媒体服务器最新入库数据
  Future<void> loadLatestMediaData() async {
    try {
      talker.info('开始加载媒体服务器最新入库数据');
      // 获取第一个媒体服务器的最新入库数据
      final data = await mediaServerController.loadLatestMediaData('emby');
      latestMediaData.value = data;
      talker.info('媒体服务器最新入库数据加载成功');
    } catch (e, st) {
      talker.handle(e, st, '加载媒体服务器最新入库数据失败');
    }
  }

  /// 加载最近入库数据（一周内每天的入库量）
  Future<void> loadTransferData() async {
    try {
      talker.info('开始加载最近入库数据');
      final response = await apiClient.getTransferData<List<dynamic>>();
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data!;
        // 将数据转换为整数列表
        final transferList = data
            .map((item) => item is int ? item : 0)
            .toList();
        transferData.value = transferList;
        talker.info('最近入库数据加载成功: $transferList');
      } else if (response.statusCode == 401) {
        talker.error('最近入库数据加载失败: 未授权，请重新登录');
      } else {
        talker.warning('最近入库数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载最近入库数据失败');
    }
  }

  /// 刷新所有数据
  Future<void> refreshData() async {
    talker.info('开始刷新所有数据');
    await Future.wait([
      loadCpuData(),
      loadNetworkData(),
      loadMemoryData(),
      loadDownloaderData(),
      loadStorageData(),
      loadStatisticData(),
      loadScheduleData(),
      loadLatestMediaData(),
      loadTransferData(),
    ]);
    talker.info('所有数据刷新完成');
  }

  /// 执行后台任务
  Future<void> runScheduler(String jobId) async {
    try {
      talker.info('开始执行后台任务: $jobId');
      final response = await apiClient.runScheduler<Map<String, dynamic>>(
        jobId,
      );
      if (response.statusCode == 200) {
        final data = response.data!;
        if (data['success'] == true) {
          talker.info('后台任务执行成功: $jobId');
          // 显示执行成功提示
          ToastUtil.success('后台任务已成功启动', title: '执行成功');

          // 执行成功后刷新任务列表
          await loadScheduleData();
        } else {
          final errorMessage = data['message'] ?? '未知错误';
          talker.warning('后台任务执行失败: $errorMessage');
          // 显示执行失败提示
          ToastUtil.error(errorMessage, title: '执行失败');
        }
      } else if (response.statusCode == 401) {
        talker.error('后台任务执行失败: 未授权，请重新登录');
        // 显示未授权提示
        ToastUtil.error('未授权，请重新登录', title: '执行失败');

        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('后台任务执行失败，状态码: ${response.statusCode}');
        // 显示执行失败提示
        ToastUtil.error('请求失败，请稍后重试', title: '执行失败');
      }
    } catch (e, st) {
      talker.handle(e, st, '执行后台任务失败');
      // 显示执行失败提示
      ToastUtil.error('网络错误，请检查网络连接', title: '执行失败');
    }
  }

  /// 加载内存数据
  Future<void> loadMemoryData() async {
    try {
      talker.info('开始加载内存数据');
      final response = await apiClient.getMemoryData<List<dynamic>>();
      if (response.statusCode == 200) {
        final data = response.data!;
        if (data.length >= 2) {
          final memoryUsed = data[0] as int;
          final memoryUsage = data[1] as int;
          memoryData.value = [memoryUsed, memoryUsage];
          talker.info('内存数据加载成功: 使用 $memoryUsed 字节, 使用率 $memoryUsage%');
        }
      } else if (response.statusCode == 401) {
        talker.error('内存数据加载失败: 未授权，请重新登录');
        // 这里可以添加重定向到登录页面的逻辑
      } else {
        talker.warning('内存数据加载失败，状态码: ${response.statusCode}');
      }
    } catch (e, st) {
      talker.handle(e, st, '加载内存数据失败');
    }
  }
}
