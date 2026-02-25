// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloader_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DownloaderStats {
  double get downloadSpeed => throw _privateConstructorUsedError;
  double get uploadSpeed => throw _privateConstructorUsedError;
  double get downloadSize => throw _privateConstructorUsedError;
  double get uploadSize => throw _privateConstructorUsedError;
  double get freeSpace => throw _privateConstructorUsedError;

  /// Create a copy of DownloaderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloaderStatsCopyWith<DownloaderStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloaderStatsCopyWith<$Res> {
  factory $DownloaderStatsCopyWith(
    DownloaderStats value,
    $Res Function(DownloaderStats) then,
  ) = _$DownloaderStatsCopyWithImpl<$Res, DownloaderStats>;
  @useResult
  $Res call({
    double downloadSpeed,
    double uploadSpeed,
    double downloadSize,
    double uploadSize,
    double freeSpace,
  });
}

/// @nodoc
class _$DownloaderStatsCopyWithImpl<$Res, $Val extends DownloaderStats>
    implements $DownloaderStatsCopyWith<$Res> {
  _$DownloaderStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloaderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadSpeed = null,
    Object? uploadSpeed = null,
    Object? downloadSize = null,
    Object? uploadSize = null,
    Object? freeSpace = null,
  }) {
    return _then(
      _value.copyWith(
            downloadSpeed: null == downloadSpeed
                ? _value.downloadSpeed
                : downloadSpeed // ignore: cast_nullable_to_non_nullable
                      as double,
            uploadSpeed: null == uploadSpeed
                ? _value.uploadSpeed
                : uploadSpeed // ignore: cast_nullable_to_non_nullable
                      as double,
            downloadSize: null == downloadSize
                ? _value.downloadSize
                : downloadSize // ignore: cast_nullable_to_non_nullable
                      as double,
            uploadSize: null == uploadSize
                ? _value.uploadSize
                : uploadSize // ignore: cast_nullable_to_non_nullable
                      as double,
            freeSpace: null == freeSpace
                ? _value.freeSpace
                : freeSpace // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DownloaderStatsImplCopyWith<$Res>
    implements $DownloaderStatsCopyWith<$Res> {
  factory _$$DownloaderStatsImplCopyWith(
    _$DownloaderStatsImpl value,
    $Res Function(_$DownloaderStatsImpl) then,
  ) = __$$DownloaderStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double downloadSpeed,
    double uploadSpeed,
    double downloadSize,
    double uploadSize,
    double freeSpace,
  });
}

/// @nodoc
class __$$DownloaderStatsImplCopyWithImpl<$Res>
    extends _$DownloaderStatsCopyWithImpl<$Res, _$DownloaderStatsImpl>
    implements _$$DownloaderStatsImplCopyWith<$Res> {
  __$$DownloaderStatsImplCopyWithImpl(
    _$DownloaderStatsImpl _value,
    $Res Function(_$DownloaderStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloaderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadSpeed = null,
    Object? uploadSpeed = null,
    Object? downloadSize = null,
    Object? uploadSize = null,
    Object? freeSpace = null,
  }) {
    return _then(
      _$DownloaderStatsImpl(
        downloadSpeed: null == downloadSpeed
            ? _value.downloadSpeed
            : downloadSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        uploadSpeed: null == uploadSpeed
            ? _value.uploadSpeed
            : uploadSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        downloadSize: null == downloadSize
            ? _value.downloadSize
            : downloadSize // ignore: cast_nullable_to_non_nullable
                  as double,
        uploadSize: null == uploadSize
            ? _value.uploadSize
            : uploadSize // ignore: cast_nullable_to_non_nullable
                  as double,
        freeSpace: null == freeSpace
            ? _value.freeSpace
            : freeSpace // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DownloaderStatsImpl implements _DownloaderStats {
  const _$DownloaderStatsImpl({
    this.downloadSpeed = 0,
    this.uploadSpeed = 0,
    this.downloadSize = 0,
    this.uploadSize = 0,
    this.freeSpace = 0,
  });

  @override
  @JsonKey()
  final double downloadSpeed;
  @override
  @JsonKey()
  final double uploadSpeed;
  @override
  @JsonKey()
  final double downloadSize;
  @override
  @JsonKey()
  final double uploadSize;
  @override
  @JsonKey()
  final double freeSpace;

  @override
  String toString() {
    return 'DownloaderStats(downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, downloadSize: $downloadSize, uploadSize: $uploadSize, freeSpace: $freeSpace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloaderStatsImpl &&
            (identical(other.downloadSpeed, downloadSpeed) ||
                other.downloadSpeed == downloadSpeed) &&
            (identical(other.uploadSpeed, uploadSpeed) ||
                other.uploadSpeed == uploadSpeed) &&
            (identical(other.downloadSize, downloadSize) ||
                other.downloadSize == downloadSize) &&
            (identical(other.uploadSize, uploadSize) ||
                other.uploadSize == uploadSize) &&
            (identical(other.freeSpace, freeSpace) ||
                other.freeSpace == freeSpace));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    downloadSpeed,
    uploadSpeed,
    downloadSize,
    uploadSize,
    freeSpace,
  );

  /// Create a copy of DownloaderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloaderStatsImplCopyWith<_$DownloaderStatsImpl> get copyWith =>
      __$$DownloaderStatsImplCopyWithImpl<_$DownloaderStatsImpl>(
        this,
        _$identity,
      );
}

abstract class _DownloaderStats implements DownloaderStats {
  const factory _DownloaderStats({
    final double downloadSpeed,
    final double uploadSpeed,
    final double downloadSize,
    final double uploadSize,
    final double freeSpace,
  }) = _$DownloaderStatsImpl;

  @override
  double get downloadSpeed;
  @override
  double get uploadSpeed;
  @override
  double get downloadSize;
  @override
  double get uploadSize;
  @override
  double get freeSpace;

  /// Create a copy of DownloaderStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloaderStatsImplCopyWith<_$DownloaderStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
