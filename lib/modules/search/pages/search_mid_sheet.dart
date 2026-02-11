import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';

class SearchMidSheet extends StatefulWidget {
  const SearchMidSheet({
    super.key,
    required this.searchKey,
    this.title,
    this.year,
    this.season,
  });
  final String searchKey;
  final String? title;
  final String? year;
  final String? season;
  @override
  State<SearchMidSheet> createState() => _SearchMidSheetState();
}

class _SearchMidSheetState extends State<SearchMidSheet> {
  final siteController = Get.put(SiteController());
  final selectedSite = <int>[].obs;
  final area = 'title'.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            SizedBox(width: 10),
            Text(
              '搜索资源',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text('搜索')),
          ],
        ),
        CupertinoSlidingSegmentedControl(
          children: {'title': Text('title'), 'imdb': Text('imdb链接')},
          onValueChanged: (value) {
            area.value = value ?? 'title';
          },
        ),
        Row(
          children: [
            Text(
              '已选择站点 ${selectedSite.length}/ ${siteController.items.length} 个',
            ),
            Spacer(),
            Obx(
              () => TextButton.icon(
                onPressed: () {},
                label: Text(
                  selectedSite.length == siteController.items.length
                      ? '清空'
                      : '全选',
                ),
                icon: Icon(
                  selectedSite.length == siteController.items.length
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
              ),
            ),
          ],
        ),
        Section(
          child: GridView.builder(
            itemCount: siteController.items.length,
            itemBuilder: (context, index) {
              final item = siteController.items[index];
              final isSelected = selectedSite.contains(item.site.id);
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: isSelected,
                      onChanged: (value) {
                        if (value == true) {
                          selectedSite.add(item.site.id);
                        } else {
                          selectedSite.remove(item.site.id);
                        }
                      },
                    ),

                    Text(siteController.items[index].site.name),
                  ],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}
