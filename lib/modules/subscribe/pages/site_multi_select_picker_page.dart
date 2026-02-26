import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';

/// 站点多选 Picker 页面
class SiteMultiSelectPickerPage extends StatelessWidget {
  const SiteMultiSelectPickerPage({
    super.key,
    required this.availableSites,
    required this.selectedIds,
  });

  final List<SiteModel> availableSites;
  final List<int> selectedIds;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_SiteMultiSelectState>(
      init: _SiteMultiSelectState(
        availableSites: availableSites,
        initialSelectedIds: List.from(selectedIds),
      ),
      builder: (state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              child: const Icon(CupertinoIcons.xmark),
            ),
            middle: const Text('选择站点'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(result: List<int>.from(state.selectedIds)),
              child: const Text('完成'),
            ),
            border: null,
          ),
          child: SafeArea(
            child: Column(
              children: [
                if (state.selectedIds.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: state.selectedIds.map((id) {
                        final site = availableSites.where((s) => s.id == id).firstOrNull;
                        final name = site?.name ?? id.toString();
                        return GestureDetector(
                          onTap: () => state.toggle(id),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemBlue.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(name, style: const TextStyle(fontSize: 14)),
                                const SizedBox(width: 6),
                                Icon(CupertinoIcons.xmark_circle_fill, size: 18,
                                    color: CupertinoColors.systemGrey),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: availableSites.length,
                    itemBuilder: (context, index) {
                      final site = availableSites[index];
                      final isSelected = state.selectedIds.contains(site.id);
                      return CupertinoListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey5.resolveFrom(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            CupertinoIcons.globe,
                            color: isSelected
                                ? CupertinoColors.activeBlue
                                : CupertinoColors.secondaryLabel.resolveFrom(context),
                          ),
                        ),
                        title: Text(site.name),
                        trailing: CupertinoSwitch(
                          value: isSelected,
                          onChanged: (_) => state.toggle(site.id),
                        ),
                        onTap: () => state.toggle(site.id),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SiteMultiSelectState extends GetxController {
  _SiteMultiSelectState({
    required this.availableSites,
    required List<int> initialSelectedIds,
  }) : _initialSelectedIds = initialSelectedIds;

  final List<SiteModel> availableSites;
  final List<int> _initialSelectedIds;
  final selectedIds = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedIds.addAll(_initialSelectedIds);
  }

  void toggle(int id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    selectedIds.refresh();
    update();
  }
}
