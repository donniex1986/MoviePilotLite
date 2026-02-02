/// 应用全局服务
class AppService {
  /// 单例实例
  static final AppService _instance = AppService._();

  /// 获取单例实例
  static AppService get instance => _instance;

  /// 私有构造函数
  AppService._();

  /// 基础URL
  String? _baseUrl;

  /// 缓存的cookie
  String? _cookie;

  /// 获取基础URL
  String? get baseUrl => _baseUrl;

  /// 设置基础URL
  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  /// 清除基础URL
  void clearBaseUrl() {
    _baseUrl = null;
  }

  /// 检查是否有基础URL
  bool get hasBaseUrl => _baseUrl != null && _baseUrl!.isNotEmpty;

  /// 获取缓存的cookie
  String? get cookie => _cookie;

  /// 设置缓存的cookie
  void setCookie(String cookie) {
    _cookie = cookie;
  }

  /// 清除缓存的cookie
  void clearCookie() {
    _cookie = null;
  }

  /// 检查是否有缓存的cookie
  bool get hasCookie => _cookie != null && _cookie!.isNotEmpty;
}
