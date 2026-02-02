import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

class ApiClient {
  ApiClient(this.baseUrl, this.talker, {this.token})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
          // FormData 需要 multipart/form-data；这里不强行设置，
          // 让 dio 根据 data 类型自动推导 Content-Type。
          headers: const {'accept': 'application/json'},
        ),
      ) {
    // 集成 talker dio logger
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          printRequestData: true,
          printResponseData: true,
          logLevel: LogLevel.info,
        ),
      ),
    );

    // 添加cookie拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          // 从响应头中获取cookie
          final setCookie = response.headers['set-cookie'];
          if (setCookie != null && setCookie.isNotEmpty) {
            final cookie = setCookie.join('; ');
            AppService.instance.setCookie(cookie);
            talker.info('获取并存储cookie: $cookie');
          }
          handler.next(response);
        },
        onRequest: (options, handler) {
          // 在请求头中添加cookie
          final cookie = AppService.instance.cookie;
          if (cookie != null && cookie.isNotEmpty) {
            options.headers['cookie'] = cookie;
            talker.info('添加cookie到请求头');
          }
          handler.next(options);
        },
      ),
    );
  }

  final String baseUrl;
  final Dio _dio;
  final Talker talker;
  String? token;

  Future<Response<T>> postForm<T>(String path, Map<String, dynamic> data) {
    final formData = FormData.fromMap(data);
    return _dio.post<T>(path, data: formData);
  }

  Future<Response<T>> get<T>(String path, {String? token}) {
    final authToken = token ?? this.token;
    talker.info('API请求: $path, token: ${authToken != null ? '***' : 'null'}');
    final options = Options(
      headers: {if (authToken != null) 'authorization': 'Bearer $authToken'},
      validateStatus: (status) {
        // 允许所有状态码，让调用者自己处理错误
        return true;
      },
    );
    return _dio.get<T>(path, options: options);
  }

  Future<Response<T>> getCpuData<T>() {
    return get<T>('/api/v1/dashboard/cpu');
  }

  Future<Response<T>> getNetworkData<T>() {
    return get<T>('/api/v1/dashboard/network');
  }

  Future<Response<T>> getDownloaderData<T>() {
    return get<T>('/api/v1/dashboard/downloader');
  }

  Future<Response<T>> getStorageData<T>() {
    return get<T>('/api/v1/dashboard/storage');
  }

  Future<Response<T>> getStatisticData<T>() {
    return get<T>('/api/v1/dashboard/statistic');
  }

  Future<Response<T>> getScheduleData<T>() {
    return get<T>('/api/v1/dashboard/schedule');
  }

  Future<Response<T>> getMediaServers<T>() {
    return get<T>('/api/v1/system/setting/MediaServers');
  }

  Future<Response<T>> getLatestMediaServerData<T>(String server) {
    return get<T>('/api/v1/mediaserver/latest?server=$server');
  }

  Future<Response<T>> getMediaLibraries<T>(
    String server, {
    bool hidden = true,
  }) {
    return get<T>('/api/v1/mediaserver/library?server=$server&hidden=$hidden');
  }

  Future<Response<T>> runScheduler<T>(String jobId) {
    return get<T>('/api/v1/system/runscheduler?jobid=$jobId');
  }

  Future<Response<T>> getMemoryData<T>() {
    return get<T>('/api/v1/dashboard/memory');
  }

  // 获取最近入库数据
  Future<Response<T>> getTransferData<T>() {
    return get<T>('/api/v1/dashboard/transfer');
  }
}
