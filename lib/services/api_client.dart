import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:get/get.dart' as g;

enum RequestMethod { get, post, put, delete }

class ApiAuthException implements Exception {
  ApiAuthException(this.statusCode, [this.message]);

  final int statusCode;
  final String? message;

  @override
  String toString() =>
      'ApiAuthException(statusCode: $statusCode, message: $message)';
}

class ApiHttpException implements Exception {
  ApiHttpException(this.statusCode, [this.message]);

  final int statusCode;
  final String? message;

  @override
  String toString() =>
      'ApiHttpException(statusCode: $statusCode, message: $message)';
}

class ApiClient extends g.GetxController {
  final _appService = g.Get.find<AppService>();
  final _log = g.Get.find<AppLog>();
  late final Dio _dio;
  late final Future<void> _ready;
  bool _dioReady = false;
  String? _pendingBaseUrl;

  String? get baseUrl {
    if (_dioReady) return _dio.options.baseUrl;
    return _pendingBaseUrl ?? _appService.baseUrl;
  }

  @override
  void onInit() {
    super.onInit();
    _ready = _initClient();
  }

  Future<void> _initClient() async {
    _dio = Dio(
      BaseOptions(
        // 初始时 baseUrl 为空，后续在登录时根据服务器地址进行配置。
        baseUrl: _appService.baseUrl ?? '',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        // FormData 需要 multipart/form-data；这里不强行设置，
        // 让 dio 根据 data 类型自动推导 Content-Type。
        headers: const {'accept': 'application/json'},
      ),
    );
    _dioReady = true;

    if ((_pendingBaseUrl ?? '').isNotEmpty) {
      _dio.options.baseUrl = _pendingBaseUrl!;
    } else if (_appService.hasBaseUrl) {
      _dio.options.baseUrl = _appService.baseUrl!;
    }

    final CookieJar cookieJar;
    if (kIsWeb) {
      cookieJar = CookieJar();
    } else {
      final dir = await getApplicationSupportDirectory();
      cookieJar = PersistCookieJar(storage: FileStorage('${dir.path}/cookies'));
    }
    _dio.interceptors.add(CookieManager(cookieJar));
    _dio.interceptors.add(
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
  }

  Future<void> _ensureReady() => _ready;

  String? token;

  /// 配置服务端基础地址。
  ///
  /// 登录时会根据用户输入的 serverUrl 调用该方法，
  /// 之后所有以 `/api/...` 开头的请求都会以此为前缀。
  void setBaseUrl(String baseUrl) {
    _pendingBaseUrl = baseUrl;
    if (_dioReady) {
      _dio.options.baseUrl = baseUrl;
    }
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
  ) async {
    await _ensureReady();
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

  Future<Response<T>> postForm<T>(
    String path,
    Map<String, dynamic> data,
  ) async {
    await _ensureReady();
    final formData = FormData.fromMap(data);
    return _dio.post<T>(path, data: formData);
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    await _ensureReady();
    final authToken = token ?? this.token;
    _log.info(
      'API POST请求: $path, token: ${authToken != null ? '***' : 'null'}',
    );
    final options = Options(
      headers: {if (authToken != null) 'authorization': 'Bearer $authToken'},
      validateStatus: (status) {
        // 允许所有状态码，让调用者自己处理错误
        return true;
      },
    );
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path,
    Map<String, dynamic> data, {
    String? token,
  }) async {
    await _ensureReady();
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

  Future<Response<T>> get<T>(String path, {String? token}) async {
    await _ensureReady();
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

  /// SSE / 流式 GET，请求 `text/event-stream` 并返回按行解码后的字符串流。
  Future<Stream<String>> streamLines(String path, {String? token}) async {
    await _ensureReady();
    final authToken = token ?? this.token;
    _log.info('API流式请求: $path, token: ${authToken != null ? '***' : 'null'}');
    final response = await _dio.get<ResponseBody>(
      path,
      options: Options(
        responseType: ResponseType.stream,
        receiveTimeout: Duration.zero,
        headers: {
          'accept': 'text/event-stream',
          if (authToken != null) 'authorization': 'Bearer $authToken',
        },
        validateStatus: (status) => true,
      ),
    );
    final status = response.statusCode ?? 0;
    if (status == 401 || status == 403) {
      throw ApiAuthException(status, response.statusMessage);
    }
    if (status >= 400) {
      throw ApiHttpException(status, response.statusMessage);
    }
    final body = response.data;
    if (body == null) {
      return const Stream<String>.empty();
    }
    // 将底层字节流转换为按行分隔的 UTF8 字符串流
    final byteStream = body.stream.map((chunk) => chunk as List<int>);
    return byteStream.transform(utf8.decoder).transform(const LineSplitter());
  }
}
