import 'package:dio/dio.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:get/get.dart' as g;

enum RequestMethod { get, post, put, delete }

class ApiClient extends g.GetxController {
  final _appService = g.Get.find<AppService>();
  final _log = g.Get.find<AppLog>();
  late final Dio _dio;
  String? get baseUrl => _dio.options.baseUrl;
  @override
  void onInit() {
    super.onInit();
    _dio =
        Dio(
            BaseOptions(
              // 初始时 baseUrl 为空，后续在登录时根据服务器地址进行配置。
              baseUrl: _appService.baseUrl ?? '',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 15),
              // FormData 需要 multipart/form-data；这里不强行设置，
              // 让 dio 根据 data 类型自动推导 Content-Type。
              headers: const {'accept': 'application/json'},
            ),
          )
          ..interceptors.add(
            TalkerDioLogger(
              talker: _log.talker,
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
    // cookie 写入存在问题，这里不再做全局 cookie 读写，
    // 只由具体业务在调用 /api/v1/user 等接口时按需要读取响应体。
  }

  String? token;

  /// 配置服务端基础地址。
  ///
  /// 登录时会根据用户输入的 serverUrl 调用该方法，
  /// 之后所有以 `/api/...` 开头的请求都会以此为前缀。
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _log.info('设置 API baseUrl: $baseUrl');
  }

  /// 设置当前使用的访问 Token，后续 GET 请求会自动带上该 Token。
  void setToken(String token) {
    this.token = token;
    _log.info('更新 API Token');
  }

  Future<Response<T>> request<T>(
    String url,
    RequestMethod method,
    Map<String, dynamic> data,
  ) {
    if (method == RequestMethod.get) {
      return get<T>(url);
    } else if (method == RequestMethod.post) {
      return _dio.post<T>(url, data: data);
    } else if (method == RequestMethod.put) {
      return _dio.put<T>(url, data: data);
    } else if (method == RequestMethod.delete) {
      return _dio.delete<T>(url, data: data);
    } else {
      throw ArgumentError('Invalid method: $method');
    }
  }

  Future<Response<T>> postForm<T>(String path, Map<String, dynamic> data) {
    final formData = FormData.fromMap(data);
    return _dio.post<T>(path, data: formData);
  }

  Future<Response<T>> put<T>(
    String path,
    Map<String, dynamic> data, {
    String? token,
  }) {
    final authToken = token ?? this.token;
    _log.info('API PUT请求: $path, token: ${authToken != null ? '***' : 'null'}');
    final options = Options(
      headers: {if (authToken != null) 'authorization': 'Bearer $authToken'},
      validateStatus: (status) {
        // 允许所有状态码，让调用者自己处理错误
        return true;
      },
    );
    return _dio.put<T>(path, data: data, options: options);
  }

  Future<Response<T>> get<T>(String path, {String? token}) {
    final authToken = token ?? this.token;
    _log.info('API请求: $path, token: ${authToken != null ? '***' : 'null'}');
    final options = Options(
      headers: {if (authToken != null) 'authorization': 'Bearer $authToken'},
      validateStatus: (status) {
        // 允许所有状态码，让调用者自己处理错误
        return true;
      },
    );
    return _dio.get<T>(path, options: options);
  }
}
