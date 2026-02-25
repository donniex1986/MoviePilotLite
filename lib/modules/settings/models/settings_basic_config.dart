import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 系统 - 基础 配置区块字段
List<SettingsFieldConfig> get basicConfigFields => [
  SettingsFieldConfig(
    label: '访问域名',
    envKey: 'APP_DOMAIN',
    type: SettingsFieldType.text,
    hint: '用于发送通知时,添加快捷跳转地址',
    icon: Icons.public_outlined,
  ),
  SettingsFieldConfig(
    label: '背景壁纸',
    envKey: 'WALLPAPER',
    type: SettingsFieldType.select,
    hint: '选择登陆页面背景来源',
    icon: Icons.wallpaper_outlined,
    enumKey: 'WALLPAPER',
  ),
  // 条件展示：WALLPAPER=custom 时显示
  SettingsFieldConfig(
    label: '自定义壁纸地址',
    envKey: 'CUSTOMIZE_WALLPAPER_API_URL',
    type: SettingsFieldType.text,
    hint: '自定义壁纸 API 地址',
    icon: Icons.link,
    conditionKey: 'WALLPAPER',
    conditionValue: 'custom',
  ),
  SettingsFieldConfig(
    label: '识别数据源',
    envKey: 'RECOGNIZE_SOURCE',
    type: SettingsFieldType.select,
    hint: '设置默认媒体信息识别数据源',
    icon: Icons.source_outlined,
    enumKey: 'RECOGNIZE_SOURCE',
  ),
  SettingsFieldConfig(
    label: '媒体服务器同步间隔',
    envKey: 'MEDIASERVER_SYNC_INTERVAL',
    type: SettingsFieldType.number,
    hint: '定时同步媒体服务器数据到本地的时间间隔',
    icon: Icons.sync,
    unit: '小时',
    step: 1,
  ),
  SettingsFieldConfig(
    label: 'API 令牌',
    envKey: 'API_TOKEN',
    type: SettingsFieldType.textCopy,
    hint: '设置外部请求Movie Pilot API时使用的token值',
    icon: Icons.key_outlined,
  ),
  SettingsFieldConfig(
    label: 'Github Token',
    envKey: 'GITHUB_TOKEN',
    type: SettingsFieldType.text,
    hint: '用于提高插件等访问Github API时的限流阈值,建议配置,否则插件可能无法正常使用',
    icon: Icons.code_outlined,
  ),
  SettingsFieldConfig(
    label: '验证码识别服务器',
    envKey: 'OCR_HOST',
    type: SettingsFieldType.text,
    hint: '用于站点签到、更新站点Cookie等识别验证码',
    icon: Icons.security_outlined,
  ),
  // 条件展示：AI_AGENT_ENABLE=true 时显示下方 AI 配置区域
  SettingsFieldConfig(
    label: '启用智能助手',
    envKey: 'AI_AGENT_ENABLE',
    type: SettingsFieldType.toggle,
    hint: '启用智能助手功能,需要配置LLM相关参数',
    icon: Icons.smart_toy_outlined,
  ),
];

/// 全局智能助手配置区块字段
List<SettingsFieldConfig> get aiAssistantConfigFields => [
  SettingsFieldConfig(
    label: '全局智能助手',
    envKey: 'AI_AGENT_GLOBAL',
    type: SettingsFieldType.toggle,
    hint: '启用全局智能助手功能,所有消息对话均使用智能体回答而不用使用/ai命令',
    icon: Icons.smart_toy_outlined,
  ),
  SettingsFieldConfig(
    label: 'LLM 提供商',
    envKey: 'LLM_PROVIDER',
    type: SettingsFieldType.select,
    hint: '选择使用的LLM服务提供商',
    icon: Icons.psychology_outlined,
    enumKey: 'LLM_PROVIDER',
  ),
  SettingsFieldConfig(
    label: 'LLM 基础 URL',
    envKey: 'LLM_BASE_URL',
    type: SettingsFieldType.text,
    hint: 'LLM API的基础URL地址,用于自定义API端点',
    icon: Icons.link,
  ),
  SettingsFieldConfig(
    label: 'LLM API 密钥',
    envKey: 'LLM_API_KEY',
    type: SettingsFieldType.text,
    hint: 'LLM服务提供商的API密钥,用于身份验证',
    icon: Icons.key_outlined,
  ),
  SettingsFieldConfig(
    label: 'LLM 模型名称',
    envKey: 'LLM_MODEL',
    type: SettingsFieldType.text,
    hint: '指定使用的LLM模型,如gpt-3.5-turbo、deepseek-chat等',
    icon: Icons.psychology_outlined,
    enumKey: 'LLM_MODEL',
  ),
  SettingsFieldConfig(
    label: 'LLM 最大上下文 Token 数量(K)',
    envKey: 'LLM_MAX_CONTEXT_TOKENS',
    type: SettingsFieldType.number,
    hint: '设定LLM记录会话历史的最大Token数量上限(千),超出后将自动修整历史记录',
    icon: Icons.note_outlined,
    step: 1,
  ),
  SettingsFieldConfig(
    label: '搜索结果智能推荐',
    envKey: 'AI_RECOMMEND_ENABLED',
    type: SettingsFieldType.toggle,
    hint: '启用搜索结果智能推荐功能,开启后将在搜索结果页面显示智能推荐按钮',
    icon: Icons.recommend_outlined,
  ),
];
