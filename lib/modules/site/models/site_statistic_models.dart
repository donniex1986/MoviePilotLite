/// 站点统计信息（API: GET /api/v1/site/statistic）
///
/// 返回样例：
/// [
///   {
///     "domain": "audiences.me",
///     "success": 1919,
///     "fail": 1,
///     "seconds": 1,
///     "lst_state": 0,
///     "lst_mod_date": "2026-02-10 14:58:46",
///     "note": { "2026-02-10 14:58:46": 2 }
///   }
/// ]
class SiteStatisticItem {
  const SiteStatisticItem({
    required this.domain,
    required this.success,
    required this.fail,
    required this.seconds,
    required this.lstState,
    required this.lstModDate,
    required this.note,
  });

  final String domain;
  final int success;
  final int fail;
  final int seconds;
  final int lstState;
  final String lstModDate;

  /// key: 时间字符串；value: 状态码（通常 0/1/2）
  final Map<String, int> note;

  int get total => success + fail;

  double get successRate {
    final t = total;
    if (t <= 0) return 0;
    return success / t;
  }

  SiteStatisticState get state => SiteStatisticState.fromCode(lstState);

  static SiteStatisticItem fromJson(Map<String, dynamic> json) {
    final domain = (json['domain'] ?? '').toString();
    final success = _intFromJson(json['success']);
    final fail = _intFromJson(json['fail']);
    final seconds = _intFromJson(json['seconds']);
    final lstState = _intFromJson(json['lst_state']);
    final lstModDate = (json['lst_mod_date'] ?? '').toString();

    final noteRaw = json['note'];
    final note = <String, int>{};
    if (noteRaw is Map) {
      for (final entry in noteRaw.entries) {
        final k = entry.key?.toString() ?? '';
        if (k.isEmpty) continue;
        note[k] = _intFromJson(entry.value);
      }
    }

    return SiteStatisticItem(
      domain: domain,
      success: success,
      fail: fail,
      seconds: seconds,
      lstState: lstState,
      lstModDate: lstModDate,
      note: note,
    );
  }
}

enum SiteStatisticState {
  ok,
  fail,
  unknown;

  static SiteStatisticState fromCode(int code) {
    if (code == 0) return SiteStatisticState.ok;
    if (code == 1) return SiteStatisticState.fail;
    return SiteStatisticState.unknown;
  }
}

int _intFromJson(Object? value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}
