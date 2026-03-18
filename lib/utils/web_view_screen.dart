import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

/// WebView 页面，支持设置 Cookie
class WebViewScreen extends StatefulWidget {
  final String url;
  final String? cookie;

  const WebViewScreen({super.key, required this.url, this.cookie});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _cookieSet = false;
  bool _canGoBack = false;
  bool _canGoForward = false;
  bool _isUrlExpanded = false;
  String _currentUrl = '';

  // 点击事件回调
  void Function(String tagName, String? href, Map<String, dynamic>? data)?
  onWebViewClick;

  @override
  void initState() {
    super.initState();
    _currentUrl = widget.url; // 初始化当前 URL
    _initializeWebView();
  }

  void _initializeWebView() async {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // 尽早更新 URL（页面开始加载时）
            setState(() {
              _currentUrl = url;
              _isLoading = true;
            });
          },
          onPageFinished: (String url) async {
            // 确保 URL 是最新的
            setState(() {
              _currentUrl = url;
            });

            // 如果使用 CookieManager 方式 cookie 没有生效，尝试使用 JavaScript 设置
            if (widget.cookie != null &&
                widget.cookie!.isNotEmpty &&
                !_cookieSet) {
              await _setCookiesWithJavaScript(
                controller,
                widget.url,
                widget.cookie!,
              );
              _cookieSet = true;
            }
            // 注入点击事件监听脚本
            await _injectClickListener(controller);
            // 更新导航状态
            _updateNavigationState();
            setState(() {
              _isLoading = false;
            });
          },
          // 拦截导航请求，可以获取链接点击（最早的 URL 变化时机）
          onNavigationRequest: (NavigationRequest request) {
            // 在导航请求时立即更新 URL（最早的时机）
            if (request.url != _currentUrl) {
              setState(() {
                _currentUrl = request.url;
              });
            }
            debugPrint('导航请求: ${request.url}');

            // 如果需要处理点击事件，可以在这里处理
            // 注意：这会拦截所有导航，如果需要允许导航，返回 NavigationDecision.navigate

            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );

    // Android 平台特殊处理
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;

    // 如果有 cookie，先设置 cookie 再加载 URL
    if (widget.cookie != null && widget.cookie!.isNotEmpty) {
      await _setCookiesWithCookieManager(widget.url, widget.cookie!);
    }

    // 加载 URL
    final uri = Uri.parse(widget.url);
    await controller.loadRequest(uri);
  }

  /// 使用 WebViewCookieManager 设置 Cookie（主要方式）
  Future<void> _setCookiesWithCookieManager(
    String url,
    String cookieString,
  ) async {
    try {
      final uri = Uri.parse(url);
      final domain = uri.host;
      final cookieManager = WebViewCookieManager();

      // 解析 cookie 字符串（格式：key1=value1; key2=value2）
      final cookiePairs = cookieString.split(';');

      for (final pair in cookiePairs) {
        final trimmed = pair.trim();
        if (trimmed.isEmpty) continue;

        final keyValue = trimmed.split('=');
        if (keyValue.length >= 2) {
          final name = keyValue[0].trim();
          final value = keyValue.sublist(1).join('=').trim();

          // 使用 WebViewCookieManager 设置 cookie
          await cookieManager.setCookie(
            WebViewCookie(name: name, value: value, domain: domain, path: '/'),
          );
        }
      }

      debugPrint('已通过 CookieManager 设置 Cookie: ${cookiePairs.length} 个');
    } catch (e) {
      debugPrint('通过 CookieManager 设置 Cookie 失败: $e');
    }
  }

  /// 使用 JavaScript 设置 Cookie（备用方案）
  Future<void> _setCookiesWithJavaScript(
    WebViewController controller,
    String url,
    String cookieString,
  ) async {
    try {
      final uri = Uri.parse(url);
      final domain = uri.host;

      // 解析 cookie 字符串（格式：key1=value1; key2=value2）
      final cookiePairs = cookieString.split(';');

      // 构建 JavaScript 代码来设置所有 cookie
      final cookieScripts = <String>[];

      for (final pair in cookiePairs) {
        final trimmed = pair.trim();
        if (trimmed.isEmpty) continue;

        final keyValue = trimmed.split('=');
        if (keyValue.length >= 2) {
          final key = keyValue[0].trim();
          final value = keyValue.sublist(1).join('=').trim();

          // 转义特殊字符
          final escapedKey = key.replaceAll("'", "\\'");
          final escapedValue = value.replaceAll("'", "\\'");

          // 设置 cookie，使用 path=/ 和正确的 domain
          cookieScripts.add(
            "document.cookie = '$escapedKey=$escapedValue; path=/; domain=$domain';",
          );
        }
      }

      if (cookieScripts.isNotEmpty) {
        final script = cookieScripts.join('\n');
        await controller.runJavaScript(script);
        debugPrint('已通过 JavaScript 设置 Cookie: ${cookieScripts.length} 个');
      }
    } catch (e) {
      debugPrint('通过 JavaScript 设置 Cookie 失败: $e');
    }
  }

  /// 注入点击事件监听脚本
  Future<void> _injectClickListener(WebViewController controller) async {
    // 注入 JavaScript 代码来监听点击事件
    const script = '''
      (function() {
        // 移除之前的事件监听器（如果存在）
        if (window._flutterWebViewClickListener) {
          document.removeEventListener('click', window._flutterWebViewClickListener, true);
          window.removeEventListener('click', window._flutterWebViewClickListener, true);
        }
        
        // 创建新的点击事件监听器
        window._flutterWebViewClickListener = function(event) {
          try {
            var target = event.target || event.srcElement;
            var tagName = (target.tagName || '').toLowerCase();
            var href = null;
            var data = {};
            
            // 获取链接地址
            var linkElement = target;
            if (tagName !== 'a') {
              linkElement = target.closest('a');
            }
            if (linkElement) {
              href = linkElement.href || linkElement.getAttribute('href') || null;
            }
            
            // 获取其他有用的数据
            var text = target.innerText || target.textContent || '';
            data = {
              id: target.id || '',
              className: target.className || '',
              text: text.substring(0, 100),
              x: event.clientX || 0,
              y: event.clientY || 0,
            };
            
            // 存储到全局变量
            var clickEvent = {
              tagName: tagName,
              href: href,
              data: data,
              timestamp: Date.now()
            };
            
            window._lastClickEvent = clickEvent;
            
            // 输出到控制台（用于调试）
            console.log('[WebView点击事件]', JSON.stringify(clickEvent));
            
            // 标记有新点击事件
            window._hasNewClickEvent = true;
          } catch (e) {
            console.error('[点击事件处理错误]', e);
          }
        };
        
        // 添加事件监听器（使用捕获阶段以确保捕获所有点击）
        document.addEventListener('click', window._flutterWebViewClickListener, true);
        window.addEventListener('click', window._flutterWebViewClickListener, true);
        
        // 初始化标志
        window._hasNewClickEvent = false;
        window._lastClickEvent = null;
        
        console.log('[WebView] 点击事件监听器已安装');
      })();
    ''';

    try {
      await controller.runJavaScript(script);
      debugPrint('✅ 已注入点击事件监听脚本');

      // 启动定时器检查点击事件
      _startClickEventMonitor();
    } catch (e) {
      debugPrint('❌ 注入点击事件监听脚本失败: $e');
    }
  }

  /// 启动点击事件监控（定期检查）
  void _startClickEventMonitor() {
    // 使用 Future.delayed 定期检查
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (!mounted) return;

      try {
        // 检查是否有新的点击事件
        final hasNew = await _controller.runJavaScriptReturningResult(
          'window._hasNewClickEvent || false',
        );

        if (hasNew.toString() == 'true') {
          // 获取点击事件
          final clickEvent = await getLastClickEvent();
          if (clickEvent != null) {
            debugPrint('🔔 检测到点击事件: ${clickEvent['raw']}');

            // 重置标志
            await _controller.runJavaScript(
              'window._hasNewClickEvent = false;',
            );

            // 调用回调
            if (onWebViewClick != null) {
              // 这里可以解析 JSON 并调用回调
            }
          }
        }
      } catch (e) {
        debugPrint('检查点击事件失败: $e');
      }

      // 继续监控
      if (mounted) {
        _startClickEventMonitor();
      }
    });
  }

  /// 获取最后一次点击事件（通过 JavaScript 查询）
  /// 使用示例：在需要获取点击事件时调用此方法
  Future<Map<String, dynamic>?> getLastClickEvent() async {
    try {
      final result = await _controller.runJavaScriptReturningResult(
        'JSON.stringify(window._lastClickEvent || null)',
      );
      final resultStr = result.toString();
      if (resultStr != 'null' && resultStr.isNotEmpty) {
        // 解析 JSON 字符串
        // 注意：这里需要根据实际返回格式处理
        debugPrint('最后点击事件: $resultStr');
        return {'raw': resultStr};
      }
    } catch (e) {
      debugPrint('获取点击事件失败: $e');
    }
    return null;
  }

  /// 更新导航状态（是否可以后退/前进）
  Future<void> _updateNavigationState() async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();
    if (mounted) {
      setState(() {
        _canGoBack = canGoBack;
        _canGoForward = canGoForward;
      });
    }
  }

  /// 后退
  Future<void> _goBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      _updateNavigationState();
    }
  }

  /// 前进
  Future<void> _goForward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
      _updateNavigationState();
    }
  }

  /// 关闭页面
  void _close() {
    Navigator.of(context).pop();
  }

  /// 切换 URL 展开/收起
  void _toggleUrlExpanded() {
    setState(() {
      _isUrlExpanded = !_isUrlExpanded;
    });
  }

  /// 构建操作按钮（统一样式）
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
    required Color color,
    bool enabled = true,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: enabled
                  ? color.withOpacity(0.9)
                  : Colors.grey.shade400.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: enabled
                    ? color.withOpacity(0.3)
                    : Colors.grey.shade500.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: enabled
                  ? [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: enabled ? Colors.white : Colors.grey.shade600,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  /// 打开下载器列表
  void _openDownloaderList() {
    Get.toNamed('/downloader/list');
  }

  /// 构建按钮栏（带渐变背景）
  Widget _buildButtonBar(BuildContext context) {
    // 获取 safe area 的底部高度
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    const buttonBarHeight = 80.0;
    final totalHeight = buttonBarHeight + bottomPadding;

    return SizedBox(
      height: totalHeight,
      child: Stack(
        children: [
          // 渐变背景，从顶部到底部逐渐增强
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.4),
                  Colors.black.withValues(alpha: 0.6),
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black.withValues(alpha: 0.9),
                ],
                stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
              ),
            ),
          ),
          // 按钮内容层
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 12 + bottomPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 关闭按钮 - 左侧
                _buildActionButton(
                  context,
                  icon: Icons.close,
                  onPressed: _close,
                  tooltip: '关闭',
                  color: Colors.red.shade400,
                ),
                // URL 显示区域 - 中间
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: _toggleUrlExpanded,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        constraints: BoxConstraints(
                          maxHeight: _isUrlExpanded ? 100 : 45,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.25),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.language,
                              size: 14,
                              color: Colors.black.withValues(alpha: 0.9),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  _currentUrl.isNotEmpty
                                      ? _currentUrl
                                      : widget.url,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                  maxLines: _isUrlExpanded ? null : 1,
                                  overflow: _isUrlExpanded
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              _isUrlExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: Colors.black.withValues(alpha: 0.9),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildActionButton(
                  context,
                  icon: Icons.arrow_back,
                  onPressed: _goBack,
                  tooltip: '后退',
                  color: _canGoBack
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
                // 前进按钮 - 仅在可以前进时显示
                if (_canGoForward) ...[
                  const SizedBox(width: 10),
                  _buildActionButton(
                    context,
                    icon: Icons.arrow_forward,
                    onPressed: _goForward,
                    tooltip: '前进',
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],

                // // 更多按钮 - 下拉菜单
                // PopupMenuButton<String>(
                //   tooltip: '更多',
                //   icon: Container(
                //     width: 44,
                //     height: 44,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context)
                //           .colorScheme
                //           .secondary
                //           .withOpacity(0.9),
                //       borderRadius: BorderRadius.circular(12),
                //       border: Border.all(
                //         color: Theme.of(context)
                //             .colorScheme
                //             .secondary
                //             .withOpacity(0.3),
                //         width: 1.5,
                //       ),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Theme.of(context)
                //               .colorScheme
                //               .secondary
                //               .withOpacity(0.3),
                //           blurRadius: 8,
                //           offset: const Offset(0, 2),
                //         ),
                //       ],
                //     ),
                //     child: Icon(
                //       Icons.more_vert,
                //       color: Colors.white,
                //       size: 20,
                //     ),
                //   ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(12),
                //   ),
                //   color: Colors.grey.shade900,
                //   elevation: 8,
                //   onSelected: (String value) {
                //     if (value == 'downloader') {
                //       _openDownloaderList();
                //     }
                //   },
                //   itemBuilder: (BuildContext context) =>
                //       <PopupMenuEntry<String>>[
                //     PopupMenuItem<String>(
                //       value: 'downloader',
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.download_outlined,
                //             color: Colors.white,
                //             size: 20,
                //           ),
                //           const SizedBox(width: 12),
                //           Text(
                //             '下载器',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Scaffold(
      // iOS 设备上移除 AppBar
      appBar: isIOS
          ? null
          : AppBar(
              title: const Text('网页浏览'),
              actions: [
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              ],
            ),
      body: Stack(
        children: [
          // WebView - iOS 上使用 SafeArea
          isIOS
              ? SafeArea(
                  bottom: false,
                  top: false,
                  child: WebViewWidget(controller: _controller),
                )
              : WebViewWidget(controller: _controller),
          // // 加载指示器
          // if (_isLoading)
          //   const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // 底部按钮区域 - 带渐变模糊背景，延伸到 safe area
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildButtonBar(context),
          ),
        ],
      ),
    );
  }
}
