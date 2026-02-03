import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

import '../controllers/dashboard_controller.dart';

/// 编辑Dashboard页面
class EditDashboardPage extends StatefulWidget {
  const EditDashboardPage({super.key});

  @override
  State<EditDashboardPage> createState() => _EditDashboardPageState();
}

class _EditDashboardPageState extends State<EditDashboardPage> {
  late List<String> _displayedWidgets;
  final DashboardController controller = Get.find<DashboardController>();
  final _isLoading = false.obs;
  @override
  void initState() {
    super.initState();
    // 初始化显示的组件列表
    _displayedWidgets = List.from(controller.displayedWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      snap: true,
      snapSizes: const [0.5, 0.7, 0.95],
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('编辑Dashboard'),
            actions: [
              Obx(
                () => _isLoading.value
                    ? const CupertinoActivityIndicator()
                    : IconButton(
                        icon: const Icon(CupertinoIcons.checkmark),
                        onPressed: _saveChanges,
                      ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            child: ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _displayedWidgets.length,
              itemBuilder: (context, index) {
                final widget = _displayedWidgets[index];
                return Container(
                  key: Key(widget),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: _buildWidgetItem(context, widget, true),
                );
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final widget = _displayedWidgets.removeAt(oldIndex);
                  _displayedWidgets.insert(newIndex, widget);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetItem(
    BuildContext context,
    String widget,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _displayedWidgets.remove(widget);
          } else {
            _displayedWidgets.add(widget);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.primaryColor
                : CupertinoColors.systemGrey4,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(CupertinoIcons.bars, size: 20),
              ),
            Expanded(
              child: Text(
                widget,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? context.primaryColor
                      : CupertinoColors.label,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: context.primaryColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  /// 保存更改
  Future<void> _saveChanges() async {
    _isLoading.value = true;
    try {
      // 创建id到中文名称的映射
      final nameToIdMap = {
        '存储空间': 'storage',
        '媒体统计': 'mediaStatistic',
        '最近入库': 'weeklyOverview',
        '实时速率': 'speed',
        '后台任务': 'scheduler',
        'CPU': 'cpu',
        '内存': 'memory',
        '网络流量': 'network',
        '我的媒体库': 'library',
        '继续观看': 'playing',
        '最近添加': 'latest',
      };

      // 创建dashboard配置
      final config = {
        'mediaStatistic': _displayedWidgets.contains('媒体统计'),
        'scheduler': _displayedWidgets.contains('后台任务'),
        'speed': _displayedWidgets.contains('实时速率'),
        'storage': _displayedWidgets.contains('存储空间'),
        'weeklyOverview': _displayedWidgets.contains('最近入库'),
        'cpu': _displayedWidgets.contains('CPU'),
        'memory': _displayedWidgets.contains('内存'),
        'network': _displayedWidgets.contains('网络流量'),
        'library': _displayedWidgets.contains('我的媒体库'),
        'playing': _displayedWidgets.contains('继续观看'),
        'latest': _displayedWidgets.contains('最近添加'),
      };

      // 创建dashboard排序
      final order = _displayedWidgets
          .map((widget) => {'id': nameToIdMap[widget], 'key': ''})
          .toList();

      // 更新dashboard配置
      await controller.updateDashboardConfig(config);

      // 更新dashboard排序
      await controller.updateDashboardOrder(order);

      // 重新获取dashboard配置和排序
      await controller.refreshDashboard();

      // 关闭弹窗
      Get.back();
    } catch (e) {
      // 显示错误提示
      Get.snackbar('保存失败', '更新dashboard配置失败，请重试');
    } finally {
      _isLoading.value = false;
    }
  }
}
