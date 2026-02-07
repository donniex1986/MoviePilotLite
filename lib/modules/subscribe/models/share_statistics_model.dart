/// 分享统计单项：API /api/v1/subscribe/share/statistics
class ShareStatisticsItem {
  const ShareStatisticsItem({
    this.shareUser,
    this.shareCount,
    this.totalReuseCount,
  });

  final String? shareUser;
  final int? shareCount;
  final int? totalReuseCount;

  factory ShareStatisticsItem.fromJson(Map<String, dynamic> json) {
    return ShareStatisticsItem(
      shareUser: json['share_user'] as String?,
      shareCount: _intFromJson(json['share_count']),
      totalReuseCount: _intFromJson(json['total_reuse_count']),
    );
  }

  static int? _intFromJson(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }
}
