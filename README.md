# MoviePilot Mobile

基于 [MoviePilot](https://github.com/jxxghp/MoviePilot) 项目的 Flutter 移动端客户端。

## 技术栈

- **框架**: Flutter
- **网络请求**: Dio
- **状态管理**: GetX
- **路由管理**: GetX
- **UI风格**: iOS (Cupertino)
- **数据解析**: Freezed
- **本地数据库**: Realm

## 功能特性

- ✅ 登录功能（支持多用户管理）
- ✅ 服务器地址、账号、密码本地存储
- ✅ 历史账号选择与自动填充
- ✅ 登录响应数据持久化
- ✅ Dashboard 仪表盘（存储空间、媒体统计、实时速率、后台任务、最新入库）

## 发布打包

### Fastlane 本地打包

```bash
# 仅打包 Android APK
fastlane android

# 仅打包 iOS IPA
fastlane ios

# 同时打包 iOS + Android
fastlane build_all
```

Android Release 打包需要预先设置环境变量：`ANDROID_KEYSTORE_PATH`、`KEYSTORE_PASSWORD`、`KEY_ALIAS`、`KEY_PASSWORD`。

### 生成 Android Release Keystore

首次打包前需生成 keystore（仅执行一次）：

```bash
keytool -genkey -v -keystore moviepilot-release.keystore \
  -alias moviepilot -keyalg RSA -keysize 2048 -validity 10000
```

将 keystore 转为 Base64 存入 GitHub Secrets：

```bash
openssl base64 -A -in moviepilot-release.keystore | tr -d '\n' | pbcopy
```

### GitHub Actions 自动打包

- **触发器**：每周五 UTC 00:00 自动执行，或通过 Actions 页面手动触发
- **产物**：在 GitHub Release 中上传 APK 和 IPA
- **Release 命名**：`yyyy-MM-dd-HH-mm-{version}`（如 `2025-02-14-09-30-1.0.0`）

需在仓库 Settings → Secrets and variables → Actions 中配置：

| Secret | 说明 |
|--------|------|
| `ANDROID_KEYSTORE_BASE64` | Base64 编码的 keystore 文件内容 |
| `KEYSTORE_PASSWORD` | keystore 密码 |
| `KEY_ALIAS` | 密钥别名（如 `moviepilot`） |
| `KEY_PASSWORD` | 密钥密码 |
| `APPLE_CERTIFICATE_BASE64` | iOS 证书（.p12）Base64 编码 |
| `APPLE_CERTIFICATE_PASSWORD` | iOS 证书密码 |
| `APPLE_PROVISIONING_PROFILE_BASE64` | iOS Provisioning Profile Base64 编码 |
| `KEYCHAIN_PASSWORD` | 临时 keychain 密码（任意字符串） |

未配置 iOS 相关 Secrets 时，将仅打包 Android APK。

## 未来路线

- ✅ Dashboard 已完成  
  - ⏳ Dashboard 编辑待完成
- ✅ 系统消息已完成  
  - ⏳ 系统消息 Stream 待完成
- ✅ Log 已完成
- ✅ Profile 已完成  
  - ⏳ Profile 编辑待完成

## 许可证

本项目采用 **Business Source License 1.1 (BSL-1.1)** 许可证。

**重要说明**:
- 本许可证允许查看和修改源代码
- 在特定条件下，生产环境使用可能受到限制
- 许可证将在 **2029-01-21** 自动转换为 **GPL-3.0** 许可证

详细信息请参阅 [LICENSE](LICENSE) 文件。

## 免责声明

- 本软件仅供学习交流使用，任何人不得将本软件用于商业用途
- 任何人不得将本软件用于违法犯罪活动
- 软件对用户行为不知情，一切责任由使用者承担
