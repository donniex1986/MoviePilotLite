# Agent 公约

## API/Server 约定
- Server 文档地址：https://api.movie-pilot.org
- 所有 HTTP 请求必须严格按照 Swagger 文档定义执行（接口路径、方法、参数、请求体、Header、鉴权等均以 Swagger 为准）。

## Cursor Cloud specific instructions

### Environment
- Flutter 3.38.2 installed at `/opt/flutter`, Dart 3.10.0 bundled
- Android SDK at `/opt/android-sdk` (SDK 36, build-tools 36.0.0, NDK 28.2)
- PATH and ANDROID_HOME are set in `~/.bashrc`

### Commands
- **Install deps**: `flutter pub get`
- **Code gen** (freezed/json_serializable/flutter_gen): `dart run build_runner build --delete-conflicting-outputs`
- **Lint**: `flutter analyze`
- **Test**: `flutter test`
- **Build debug APK**: `flutter build apk --debug`
- **Build release APK**: `flutter build apk --release --dart-define=FLUTTER_APP_ENV=release`

### Gotchas
- `dart run build_runner build` regenerates `*.freezed.dart` files. The committed `form_block_models.freezed.dart` has a known duplicate class issue (`InfoCardRowMenu` used for both `menu` and `group` constructors in `InfoCardRow`). **Do not regenerate** this file unless the source model is fixed — the build succeeds only with the committed version.
- The project targets **Android/iOS/macOS only** — no web or linux platform. Cannot run interactively in a headless VM; use `flutter build apk --debug` to verify builds.
- First Android build downloads Realm native binaries and CMake automatically — this can take ~2 minutes extra.
- `pubspec.lock` may show minor version drifts after `flutter pub get`; restore with `git checkout -- pubspec.lock` if you don't intend to update deps.
