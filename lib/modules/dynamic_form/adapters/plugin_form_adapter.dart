import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/dynamic_form_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';

/// 插件表单适配器接口：vue 模式插件需实现
abstract class PluginFormAdapter extends GetxController {
  String get pluginId;

  RxList<FormBlock> get blocks;

  RxList<FormNode> get pageNodes;

  Rx<Map<String, dynamic>> get formModel;

  RxBool get isLoading;

  RxnString get errorText;

  Future<void> load();

  Future<bool> save();
}

/// 扩展接口：支持「立即清理」等立即执行能力的插件
abstract class PluginFormAdapterWithClean extends PluginFormAdapter {
  Future<Map<String, dynamic>?> triggerClean();

  Future<Map<String, dynamic>?> fetchCleanProgress();
}
