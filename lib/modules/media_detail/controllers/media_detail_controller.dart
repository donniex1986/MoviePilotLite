import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_detail_model.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class MediaDetailController extends GetxController {
  final ApiClient _apiClient = Get.find<ApiClient>();

  final isLoading = false.obs;
  final mediaDetail = Rxn<MediaDetail>();
  final errorText = RxnString();
  final statusCode = RxnInt();

  late final MediaDetailArgs _args;

  MediaDetailArgs get args => _args;

  @override
  void onInit() {
    super.onInit();
    _args = MediaDetailArgs.fromRoute(
      parameters: Get.parameters as Map<String, String>?,
      arguments: Get.arguments,
    );
    if (!_args.isValid) {
      errorText.value = _args.validationMessage;
      return;
    }
    fetchDetail();
  }

  Future<void> fetchDetail() async {
    if (!_args.isValid) {
      errorText.value = _args.validationMessage;
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    errorText.value = null;
    statusCode.value = null;

    try {
      final path = _buildPath(_args);
      final query = _buildQuery(_args);
      final response = await _apiClient.get<dynamic>(
        path,
        queryParameters: query,
      );

      statusCode.value = response.statusCode ?? 0;
      final detail = _parseResponse(response.data);
      if (detail != null) {
        mediaDetail.value = detail;
      }

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        errorText.value = _buildErrorMessage(
          response.statusCode,
          response.data,
        );
      } else if (detail == null) {
        errorText.value = '响应解析失败';
      }
    } catch (e) {
      errorText.value = '请求异常: $e';
      ToastUtil.error('加载失败');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshDetail() => fetchDetail();

  String _buildPath(MediaDetailArgs args) {
    final path = _normalizePath(args.path);
    if (path.isEmpty) return '/api/v1/media/';
    return '/api/v1/media/$path';
  }

  Map<String, dynamic> _buildQuery(MediaDetailArgs args) {
    final query = <String, dynamic>{};
    if (args.title.trim().isNotEmpty) {
      query['title'] = args.title.trim();
    }
    if (args.year?.trim().isNotEmpty == true) {
      query['year'] = args.year!.trim();
    }
    if (args.typeName?.trim().isNotEmpty == true) {
      query['type_name'] = args.typeName!.trim();
    }
    if (args.session?.trim().isNotEmpty == true) {
      query['session'] = args.session!.trim();
    }
    return query;
  }

  String _normalizePath(String raw) {
    var path = raw.trim();
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    return path;
  }

  String _buildErrorMessage(int? status, dynamic data) {
    final code = status ?? 0;
    final detail = _extractMessage(data);
    if (detail != null && detail.trim().isNotEmpty) {
      return '请求失败 ($code): $detail';
    }
    return '请求失败 ($code)';
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final key in ['message', 'detail', 'error', 'msg']) {
        final value = data[key];
        if (value is String && value.trim().isNotEmpty) {
          return value;
        }
      }
    }
    return null;
  }

  MediaDetail? _parseResponse(dynamic data) {
    if (data == null) return null;
    try {
      if (data is Map) {
        return MediaDetail.fromJson(Map<String, dynamic>.from(data));
      }
      if (data is String) {
        final trimmed = data.trim();
        if (!_looksLikeJson(trimmed)) return null;
        final decoded = jsonDecode(trimmed);
        if (decoded is Map) {
          return MediaDetail.fromJson(Map<String, dynamic>.from(decoded));
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  bool _looksLikeJson(String input) {
    if (input.isEmpty) return false;
    final first = input[0];
    final last = input[input.length - 1];
    return (first == '{' && last == '}') || (first == '[' && last == ']');
  }
}

class MediaDetailArgs {
  const MediaDetailArgs({
    required this.path,
    required this.title,
    this.year,
    this.typeName,
    this.session,
  });

  final String path;
  final String title;
  final String? year;
  final String? typeName;
  final String? session;

  bool get isValid => path.trim().isNotEmpty;

  String get validationMessage {
    if (path.trim().isEmpty) {
      return '缺少参数：path';
    }
    return '';
  }

  factory MediaDetailArgs.fromRoute({
    Map<String, String>? parameters,
    Object? arguments,
  }) {
    if (arguments is MediaDetailArgs) return arguments;
    final merged = <String, dynamic>{};
    if (parameters != null) {
      merged.addAll(parameters);
    }
    if (arguments is Map) {
      arguments.forEach((key, value) {
        if (key != null) {
          merged[key.toString()] = value;
        }
      });
    } else if (arguments is String) {
      merged['path'] = arguments;
    }

    String? readKey(List<String> keys) {
      for (final key in keys) {
        final value = merged[key];
        if (value != null && value.toString().trim().isNotEmpty) {
          return value.toString();
        }
      }
      return null;
    }

    final path = readKey(['path', 'id', 'mediaId']) ?? '';
    final title = readKey(['title', 'name']) ?? '';
    final year = readKey(['year']);
    final typeName = readKey(['type_name', 'typeName', 'type']);
    final session = readKey(['session']);
    return MediaDetailArgs(
      path: path,
      title: title,
      year: year,
      typeName: typeName,
      session: session,
    );
  }
}
