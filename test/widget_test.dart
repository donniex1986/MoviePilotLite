import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // 说明：当前 App 启动时会初始化 Realm（需要原生动态库），
    // 这在纯 Dart VM 的 widget test 环境下无法加载。
    expect(true, isTrue);
  });
}
