import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';

void RecommondCategoryGroupEditPannel(
  BuildContext context,
  RecommendController controller,
) {
  showCupertinoModalBottomSheet(
    context: context,
    builder: (sheetContext) => _RecommondCategoryGroupEditPannelWidget(
      sheetContext: sheetContext,
      controller: controller,
    ),
  );
}

class _RecommondCategoryGroupEditPannelWidget extends StatelessWidget {
  final BuildContext sheetContext;
  final RecommendController controller;

  const _RecommondCategoryGroupEditPannelWidget({
    required this.sheetContext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() => _buildBody(context)),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0.5,
      title: Text(
        '分组管理',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.xmark, size: 18),
        onPressed: () => Navigator.of(sheetContext).pop(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(sheetContext).pop(),
          child: Text(
            '完成',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoScrollbar(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildSectionHeader('至少保留一个子分组'),
          const SizedBox(height: 16),
          _buildCategorySection('子分组', true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildCategorySection(String sectionTitle, bool isSubCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            sectionTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 8),
        _buildCategoryCardGroup(isSubCategory),
      ],
    );
  }

  Widget _buildCategoryCardGroup(bool isSubCategory) {
    final categories = RecommendCategory.values
        .where((c) => c != RecommendCategory.all)
        .toList();

    return Column(
      children: List.generate(categories.length, (index) {
        final category = categories[index];
        final isLast = index == categories.length - 1;
        return Column(
          children: [
            _buildCategoryTile(category, true),
            if (!isLast) const SizedBox(height: 8),
          ],
        );
      }),
    );
  }

  Widget _buildCategoryTile(RecommendCategory category, bool isSubCategory) {
    final isVisible = controller.isSubCategoryVisible(category, category.label);

    return Section(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          CupertinoListTile(
            title: Text(
              category.label,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
            trailing: Switch(
              value: isVisible,
              onChanged: (value) {
                controller.setSubCategoryVisibility(
                  category,
                  category.label,
                  value,
                );
              },
            ),
          ),
          if (isVisible)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(children: _buildSubCategoryTiles(category)),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildSubCategoryTiles(RecommendCategory category) {
    final subCategories = category.subCategories;
    return List.generate(subCategories.length, (index) {
      final subCategory = subCategories[index];
      final isSubVisible = controller.isSubCategoryVisible(
        category,
        subCategory,
      );
      final isLast = index == subCategories.length - 1;

      return Column(
        children: [
          CupertinoListTile(
            title: Text(
              subCategory,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            trailing: Switch(
              value: isSubVisible,
              onChanged: (value) {
                controller.setSubCategoryVisibility(
                  category,
                  subCategory,
                  value,
                );
              },
            ),
          ),
          if (!isLast) const SizedBox(height: 6),
        ],
      );
    });
  }
}
