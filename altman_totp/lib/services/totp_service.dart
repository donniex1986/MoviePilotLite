import 'dart:convert' show jsonEncode;
import 'dart:async';
import 'package:altman_totp/data/totp_db.dart';
import 'package:altman_totp/models/totp_profile.dart';
import 'package:get/get.dart';
import 'package:otp/otp.dart';
import 'package:uuid/uuid.dart';

class TotpService extends GetxService {
  static const int _refreshIntervalSeconds = 30;
  final _db = TotpDb();
  final _uuid = const Uuid();
  final profiles = <TotpProfile>[].obs;
  final refreshTick = 0.obs;
  final countdownTick = 0.obs;
  Timer? _alignedTimer;
  Timer? _periodicTimer;
  Timer? _countdownTimer;
  bool _countdownStarted = false;

  String _normalizeServer(String value) {
    final trimmed = value.trim().toLowerCase();
    if (trimmed.endsWith('/')) return trimmed.substring(0, trimmed.length - 1);
    return trimmed;
  }

  Future<void> load() async {
    final list = await _db.listAll();
    profiles.assignAll(list);
  }

  @override
  void onInit() {
    super.onInit();
    _startAlignedRefreshTimer();
    _startCountdownTimer();
  }

  @override
  void onClose() {
    _alignedTimer?.cancel();
    _periodicTimer?.cancel();
    _countdownTimer?.cancel();
    super.onClose();
  }

  int _secondsToNextBoundary({
    required int nowSeconds,
    int intervalSeconds = _refreshIntervalSeconds,
  }) {
    final remainder = nowSeconds % intervalSeconds;
    if (remainder == 0) return intervalSeconds;
    return intervalSeconds - remainder;
  }

  void _startAlignedRefreshTimer() {
    _alignedTimer?.cancel();
    _periodicTimer?.cancel();
    final nowSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final firstDelaySeconds = _secondsToNextBoundary(nowSeconds: nowSeconds);
    _alignedTimer = Timer(Duration(seconds: firstDelaySeconds), () {
      refreshTick.value++;
      _periodicTimer = Timer.periodic(
        const Duration(seconds: _refreshIntervalSeconds),
        (_) {
          refreshTick.value++;
        },
      );
    });
  }

  void _startCountdownTimer() {
    if (_countdownStarted) return;
    _countdownStarted = true;
    _countdownTimer?.cancel();
    countdownTick.value = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      countdownTick.value = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    });
  }

  int secondsUntilNextRefresh({int periodSeconds = _refreshIntervalSeconds}) {
    _startCountdownTimer();
    final nowSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final remainder = nowSeconds % periodSeconds;
    if (remainder == 0) return periodSeconds;
    return periodSeconds - remainder;
  }

  double reverseProgress({int periodSeconds = _refreshIntervalSeconds}) {
    _startCountdownTimer();
    final remaining = secondsUntilNextRefresh(periodSeconds: periodSeconds);
    return remaining / periodSeconds;
  }

  Future<void> upsert({
    String? id,
    String server = '',
    required String username,
    required String secret,
    String? issuer,
    int digits = 6,
    int period = 30,
  }) async {
    final normalizedServer = _normalizeServer(server);
    final targetId = id?.trim().isNotEmpty == true ? id!.trim() : _uuid.v4();
    final index = profiles.indexWhere((e) => e.id == targetId);
    final item = TotpProfile(
      id: targetId,
      server: normalizedServer,
      username: username.trim(),
      secret: secret.trim().replaceAll(' ', ''),
      issuer: issuer?.trim().isEmpty == true ? null : issuer?.trim(),
      digits: digits,
      period: period,
      updatedAt: DateTime.now(),
    );
    if (index >= 0) {
      profiles[index] = item;
    } else {
      profiles.add(item);
    }
    profiles.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    await _db.upsert(item);
  }

  Future<void> remove(String id) async {
    profiles.removeWhere((e) => e.id == id);
    await _db.delete(id);
  }

  TotpProfile? findByServerAndUsername(String server, String username) {
    final normalizedServer = _normalizeServer(server);
    final normalizedUsername = username.trim().toLowerCase();
    return profiles.firstWhereOrNull(
      (e) =>
          _normalizeServer(e.server) == normalizedServer &&
          e.username.trim().toLowerCase() == normalizedUsername,
    );
  }

  String? generateCurrentCode(String server, String username) {
    final profile = findByServerAndUsername(server, username);
    if (profile == null || profile.secret.isEmpty) return null;
    try {
      return OTP.generateTOTPCodeString(
        profile.secret,
        DateTime.now().millisecondsSinceEpoch,
        interval: profile.period,
        length: profile.digits,
        algorithm: Algorithm.SHA1,
        isGoogle: true,
      );
    } catch (_) {
      return null;
    }
  }

  String exportCoreInfoJson() {
    final data = profiles
        .map(
          (e) => {
            'server': e.server,
            'username': e.username,
            'secret': e.secret,
            'issuer': e.issuer,
            'digits': e.digits,
            'period': e.period,
          },
        )
        .toList();
    return jsonEncode(data);
  }
}
