import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_superuser') required bool isSuperuser,
    String? avatar,
    @JsonKey(name: 'is_otp') required bool isOtp,
    @JsonKey(defaultValue: <String, dynamic>{})
    required Map<String, dynamic> permissions,
    @JsonKey(defaultValue: <String, dynamic>{})
    required Map<String, dynamic> settings,

    /// 可选昵称：写入时作为顶层字段发送，读取时从 settings.nickname 获取
    @JsonKey(includeFromJson: false) String? nickname,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

extension UserInfoSettingsX on UserInfo {
  /// 通用访问 settings 中的字符串字段
  String? settingString(String key) => settings[key] as String?;

  /// 昵称：优先使用顶层 nickname，其次 settings.nickname
  String? get nicknameOrSetting =>
      nickname ?? (settings['nickname'] as String?);

  String? get wechatUserId => settings['wechat_userid'] as String?;
  String? get telegramUserId => settings['telegram_userid'] as String?;
  String? get slackUserId => settings['slack_userid'] as String?;
  String? get discordUserId => settings['discord_userid'] as String?;
  String? get vocechatUserId => settings['vocechat_userid'] as String?;
  String? get synologyChatUserId => settings['synologychat_userid'] as String?;
  String? get doubanUserId => settings['douban_userid'] as String?;
}
