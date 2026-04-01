import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/widgets/bottom_sheet.dart';

import '../controllers/dashboard_controller.dart';

class EditDashboardPage extends StatefulWidget {
  const EditDashboardPage({super.key});

  @override
  State<EditDashboardPage> createState() => _EditDashboardPageState();
}

class _EditDashboardPageState extends State<EditDashboardPage> {
  late final List<String> _allWidgets;
  late final RxSet<String> _selectedWidgets;
  final DashboardController controller = Get.find<DashboardController>();
  final _isLoading = false.obs;

  @override
  void initState() {
    super.initState();
    _allWidgets = List<String>.from(DashboardController.availableWidgets);
    _selectedWidgets = RxSet<String>({...controller.displayedWidgets});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomSheetWidget(
      header: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.xmark),
          onPressed: () => Get.back(),
        ),
        title: const Text('编辑 Dashboard'),
        centerTitle: false,
        actions: [
          Obx(
            () => _isLoading.value
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoActivityIndicator(),
                  )
                : IconButton(
                    icon: const Icon(CupertinoIcons.checkmark),
                    onPressed: _saveChanges,
                  ),
          ),
        ],
      ),
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3.2,
          ),
          itemCount: _allWidgets.length,
          itemBuilder: (context, index) {
            final widgetName = _allWidgets[index];
            final isSelected = _selectedWidgets.contains(widgetName);
            return _buildWidgetItem(context, widgetName, isSelected);
          },
        ),
      ),
    );
  }

  Widget _buildWidgetItem(
    BuildContext context,
    String widgetName,
    bool isSelected,
  ) {
    final primaryColor = context.primaryColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedWidgets.remove(widgetName);
          } else {
            _selectedWidgets.add(widgetName);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withValues(alpha: 0.08)
              : CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryColor : CupertinoColors.systemGrey4,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.circle,
              size: 22,
              color: isSelected
                  ? primaryColor
                  : CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widgetName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? primaryColor
                      : CupertinoColors.label.resolveFrom(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveChanges() async {
    _isLoading.value = true;
    try {
      final visible = _allWidgets
          .where((name) => _selectedWidgets.contains(name))
          .toList();

      await controller.applyLocalDashboardLayout(visible);
      Get.back();
    } catch (_) {
      Get.snackbar('保存失败', '更新 Dashboard 配置失败，请重试');
    } finally {
      _isLoading.value = false;
    }
  }
}
