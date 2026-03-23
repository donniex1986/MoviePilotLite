import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/l10n/app_localizations.dart';
import 'package:moviepilot_mobile/modules/search/controllers/app_setting_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';

class AppSettingPage extends GetView<AppSettingController> {
  const AppSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('应用设置'), centerTitle: false),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            children: [
              Section(
                padding: EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 8),
                header: _buildHeader(context, '主题风格'),
                separatorBuilder: (context) => Divider(
                  height: 0.1,
                  color: Theme.of(context).dividerColor,
                  endIndent: 16,
                  indent: 16,
                ),
                children: [
                  CupertinoListTile.notched(
                    leading: Container(
                      width: 29,
                      height: 29,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.palette_outlined,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    title: const Text('主题风格'),
                    // subtitle: displaySubtitle != null ? Text(displaySubtitle) : null,
                    trailing: const CupertinoListTileChevron(),
                    onTap: () => Get.toNamed('/settings/app/theme-mode'),
                  ),
                  CupertinoListTile.notched(
                    leading: Container(
                      width: 29,
                      height: 29,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.photo_outlined,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    title: const Text('背景图片'),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () => Get.toNamed('/settings/app/background-image'),
                  ),
                ],
              ),
              Section(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(0),
                header: _buildHeader(context, '搜索'),
                children: [
                  Obx(() {
                    return CupertinoListTile(
                      leading: Container(
                        width: 29,
                        height: 29,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.search,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: const Text('搜索按钮'),
                      // subtitle: displaySubtitle != null ? Text(displaySubtitle) : null,
                      trailing: Switch.adaptive(
                        padding: EdgeInsets.zero,
                        value: controller.showSearchButton.value,
                        onChanged: controller.updateShowSearchButton,
                      ),
                    );
                  }),
                  Obx(() {
                    return CupertinoListTile(
                      leading: Container(
                        width: 29,
                        height: 29,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.video_library_outlined,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: Text('搜索页入库状态'),
                      trailing: Switch.adaptive(
                        padding: EdgeInsets.zero,
                        value: controller
                            .enableFetchMediaserverLibraryStatus
                            .value,
                        onChanged: controller
                            .updateEnableFetchMediaserverLibraryStatus,
                      ),
                    );
                  }),
                ],
              ),

              Section(
                padding: EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 8),
                header: _buildHeader(context, '实验功能'),
                children: [
                  Obx(() {
                    return CupertinoListTile(
                      leading: Container(
                        width: 29,
                        height: 29,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.public,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: const Text('使用外部浏览器'),
                      trailing: Switch.adaptive(
                        value: controller.useExternalBrowser.value,
                        onChanged: controller.updateUseExternalBrowser,
                      ),
                    );
                  }),
                  // Obx(() {
                  //   return CupertinoListTile(
                  //     leading: Container(
                  //       width: 29,
                  //       height: 29,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         color: theme.colorScheme.primary.withValues(
                  //           alpha: 0.2,
                  //         ),
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //       child: Icon(
                  //         Icons.download_outlined,
                  //         size: 18,
                  //         color: theme.colorScheme.primary,
                  //       ),
                  //     ),
                  //     title: const Text('下载器管理'),
                  //     trailing: Switch.adaptive(
                  //       value: controller.enableDownloaderManager.value,
                  //       onChanged: controller.updateEnableDownloaderManager,
                  //     ),
                  //   );
                  // }),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => WebUtil.open(
                        url:
                            'https://github.com/singleton-altman/MoviePilotLite',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'V: ${controller.version}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Copyright © 2026 Altman. All rights reserved.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 6),
      child: Text(
        title,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),
    );
  }
}
