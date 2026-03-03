# Telegram Notify Action

在 GitHub Actions 中通过 Telegram Bot 发送通知消息。

## 前置准备

1. **Bot Token**：在 [@BotFather](https://t.me/BotFather) 创建 Bot，获取 Token
2. **Chat ID**：给 Bot 发一条消息后，访问 `https://api.telegram.org/bot<TOKEN>/getUpdates` 获取 `chat.id`

## 仓库配置

在仓库 Settings → Secrets and variables → Actions 中添加：

| 类型 | 名称 | 说明 |
|------|------|------|
| Secret | `TG_BOT_TOKEN` | Bot Token |
| Secret/Variable | `TG_CHAT_ID` | 接收消息的 Chat ID |

## 使用示例

```yaml
- name: Telegram 通知
  uses: ./.github/actions/telegram-notify
  with:
    token: ${{ secrets.TG_BOT_TOKEN }}
    chat_id: ${{ secrets.TG_CHAT_ID }}
    message: |
      <b>Build 完成</b>
      
      工作流: ${{ github.workflow }}
      分支: ${{ github.ref_name }}
      提交: ${{ github.sha }}
```

### 参数说明

| 参数 | 必填 | 说明 |
|------|------|------|
| token | ✅ | Bot Token |
| chat_id | ✅ | Chat ID |
| message | ✅ | 消息内容 |
| parse_mode | ❌ | `HTML` 或 `Markdown`，默认 `HTML` |
| disable_notification | ❌ | 静默发送，默认 `false` |
