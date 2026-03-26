# Agent 公约

## Flutter 页面结构
- 页面根布局使用 `Scaffold`，顶栏使用 `appBar`（默认 `AppBar`；若需 iOS 导航栏外观，可将 `CupertinoNavigationBar` 等实现 `PreferredSizeWidget` 的组件赋给 `appBar`），主内容一律放在 `body`。
- 新增页面不要用 `CupertinoPageScaffold` 作为整页根；与上述结构不一致的存量页可在改动时顺带收敛。

## API/Server 约定
- Server 文档地址：https://api.movie-pilot.org
- 所有 HTTP 请求必须严格按照 Swagger 文档定义执行（接口路径、方法、参数、请求体、Header、鉴权等均以 Swagger 为准）。

## 输出约束
- 禁止在对话回复中输出任何代码内容（包括但不限于：代码块、代码片段、行号引用、patch/diff、堆栈中的代码行、以及内联代码格式）。如需修改代码，仅允许直接改动仓库文件而不展示代码。
