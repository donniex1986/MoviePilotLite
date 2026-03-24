class TotpProfile {
  final String id;
  final String server;
  final String username;
  final String secret;
  final String? issuer;
  final int digits;
  final int period;
  final DateTime updatedAt;

  const TotpProfile({
    required this.id,
    required this.server,
    required this.username,
    required this.secret,
    this.issuer,
    this.digits = 6,
    this.period = 30,
    required this.updatedAt,
  });

  factory TotpProfile.fromJson(Map<String, dynamic> json) {
    return TotpProfile(
      id: json['id']?.toString() ?? '',
      server: json['server']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      secret: json['secret']?.toString() ?? '',
      issuer: json['issuer']?.toString(),
      digits: (json['digits'] as num?)?.toInt() ?? 6,
      period: (json['period'] as num?)?.toInt() ?? 30,
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'server': server,
      'username': username,
      'secret': secret,
      'issuer': issuer,
      'digits': digits,
      'period': period,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
