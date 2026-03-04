import 'package:moviepilot_mobile/modules/dynamic_form/adapters/plugin_form_adapter.dart';

/// 插件适配器工厂：根据 formMode 创建 page 或 form 模式下的 adapter
typedef PluginFormAdapterFactory = PluginFormAdapter Function({
  required bool formMode,
});

/// 插件表单适配器注册表：pluginId -> 工厂方法
class PluginFormAdapterRegistry {
  PluginFormAdapterRegistry._();

  static final Map<String, PluginFormAdapterFactory> _factories = {};

  /// 注册插件适配器
  static void register(String pluginId, PluginFormAdapterFactory factory) {
    _factories[pluginId] = factory;
  }

  /// 是否已注册该插件
  static bool hasAdapter(String pluginId) => _factories.containsKey(pluginId);

  /// 创建适配器实例（调用方负责 Get.put 等生命周期）
  static PluginFormAdapter? createAdapter(
    String pluginId, {
    required bool formMode,
  }) {
    final factory = _factories[pluginId];
    if (factory == null) return null;
    return factory(formMode: formMode);
  }
}
