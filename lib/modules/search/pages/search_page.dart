
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: CupertinoSearchTextField(
          placeholder: '搜索电影、电视剧、演员...',
          onChanged: controller.updateSearchText,
          onSubmitted: (_) => controller.performSearch(),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '搜索历史',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 搜索历史内容
                    _buildSearchHistory(),
                    const SizedBox(height: 24),
                    const Text(
                      '热门搜索',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 热门搜索内容
                    _buildHotSearches(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建搜索历史
  Widget _buildSearchHistory() {
    // 模拟搜索历史数据
    final history = ['星际穿越', '复仇者联盟', '权力的游戏', '盗梦空间'];
    
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: history.map((item) {
        return CupertinoButton(
          onPressed: () {
            controller.updateSearchText(item);
            controller.performSearch();
          },
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(item),
        );
      }).toList(),
    );
  }

  /// 构建热门搜索
  Widget _buildHotSearches() {
    // 模拟热门搜索数据
    final hotSearches = ['奥本海默', '沙丘2', '哥斯拉-1.0', '怪物史莱克5', '死侍与金刚狼'];
    
    return Column(
      children: hotSearches.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final item = entry.value;
        
        return CupertinoButton(
          onPressed: () {
            controller.updateSearchText(item);
            controller.performSearch();
          },
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: index <= 3 
                      ? CupertinoColors.systemRed 
                      : CupertinoColors.systemGrey3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(item),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
