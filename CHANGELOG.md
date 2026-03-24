# Changelog

## 2026-03-22
- 修复 bug
- 下载管理能力升级：支持 qBittorrent（qB）与 Transmission（TR）种子管理。
- 统一种子列表展示与基础操作（暂停、恢复、删除、重命名、分类/标签、限速）。
- 下载器页面结构调整，增强不同下载器类型下的兼容性。

## 2026-03-23

- 新增下载任务页面 `torrent_download_screen`，补全 qBittorrent/Transmission 提交逻辑与错误提示。
- 下载管理页支持筛选与排序条件本地持久化恢复，减少页面状态回退。
- 优化种子列表项视觉层级与间距，降低信息拥挤感。
- 调整下载管理入口路由逻辑，支持按设置切换到下载器配置页。
- 修复媒体详情页骨架加载与 `soft_edge_blur` 组合导致的断言问题。
- 移除种子管理本地 Realm 缓存逻辑，回归在线数据流。
- fix: douban media detail subscribe state error
