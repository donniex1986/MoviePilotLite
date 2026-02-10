// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_resource_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SiteResourceCategory _$SiteResourceCategoryFromJson(Map<String, dynamic> json) {
  return _SiteResourceCategory.fromJson(json);
}

/// @nodoc
mixin _$SiteResourceCategory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get cat => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get desc => throw _privateConstructorUsedError;

  /// Serializes this SiteResourceCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteResourceCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteResourceCategoryCopyWith<SiteResourceCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteResourceCategoryCopyWith<$Res> {
  factory $SiteResourceCategoryCopyWith(
    SiteResourceCategory value,
    $Res Function(SiteResourceCategory) then,
  ) = _$SiteResourceCategoryCopyWithImpl<$Res, SiteResourceCategory>;
  @useResult
  $Res call({
    int id,
    @JsonKey(fromJson: _stringFromJson) String cat,
    @JsonKey(fromJson: _stringFromJson) String desc,
  });
}

/// @nodoc
class _$SiteResourceCategoryCopyWithImpl<
  $Res,
  $Val extends SiteResourceCategory
>
    implements $SiteResourceCategoryCopyWith<$Res> {
  _$SiteResourceCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteResourceCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? cat = null, Object? desc = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            cat: null == cat
                ? _value.cat
                : cat // ignore: cast_nullable_to_non_nullable
                      as String,
            desc: null == desc
                ? _value.desc
                : desc // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteResourceCategoryImplCopyWith<$Res>
    implements $SiteResourceCategoryCopyWith<$Res> {
  factory _$$SiteResourceCategoryImplCopyWith(
    _$SiteResourceCategoryImpl value,
    $Res Function(_$SiteResourceCategoryImpl) then,
  ) = __$$SiteResourceCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(fromJson: _stringFromJson) String cat,
    @JsonKey(fromJson: _stringFromJson) String desc,
  });
}

/// @nodoc
class __$$SiteResourceCategoryImplCopyWithImpl<$Res>
    extends _$SiteResourceCategoryCopyWithImpl<$Res, _$SiteResourceCategoryImpl>
    implements _$$SiteResourceCategoryImplCopyWith<$Res> {
  __$$SiteResourceCategoryImplCopyWithImpl(
    _$SiteResourceCategoryImpl _value,
    $Res Function(_$SiteResourceCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteResourceCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? cat = null, Object? desc = null}) {
    return _then(
      _$SiteResourceCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        cat: null == cat
            ? _value.cat
            : cat // ignore: cast_nullable_to_non_nullable
                  as String,
        desc: null == desc
            ? _value.desc
            : desc // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteResourceCategoryImpl implements _SiteResourceCategory {
  const _$SiteResourceCategoryImpl({
    required this.id,
    @JsonKey(fromJson: _stringFromJson) this.cat = '',
    @JsonKey(fromJson: _stringFromJson) this.desc = '',
  });

  factory _$SiteResourceCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteResourceCategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String cat;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String desc;

  @override
  String toString() {
    return 'SiteResourceCategory(id: $id, cat: $cat, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteResourceCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cat, cat) || other.cat == cat) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cat, desc);

  /// Create a copy of SiteResourceCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteResourceCategoryImplCopyWith<_$SiteResourceCategoryImpl>
  get copyWith =>
      __$$SiteResourceCategoryImplCopyWithImpl<_$SiteResourceCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteResourceCategoryImplToJson(this);
  }
}

abstract class _SiteResourceCategory implements SiteResourceCategory {
  const factory _SiteResourceCategory({
    required final int id,
    @JsonKey(fromJson: _stringFromJson) final String cat,
    @JsonKey(fromJson: _stringFromJson) final String desc,
  }) = _$SiteResourceCategoryImpl;

  factory _SiteResourceCategory.fromJson(Map<String, dynamic> json) =
      _$SiteResourceCategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get cat;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get desc;

  /// Create a copy of SiteResourceCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteResourceCategoryImplCopyWith<_$SiteResourceCategoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SiteResourceItem _$SiteResourceItemFromJson(Map<String, dynamic> json) {
  return _SiteResourceItem.fromJson(json);
}

/// @nodoc
mixin _$SiteResourceItem {
  @JsonKey(fromJson: _intFromJson)
  int get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_name', fromJson: _stringFromJson)
  String get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
  String? get siteCookie => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson)
  String? get siteUa => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_proxy', fromJson: _boolFromJson)
  bool get siteProxy => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_order', fromJson: _intFromJson)
  int get siteOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
  String get siteDownloader => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get imdbid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get enclosure => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
  String? get pageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get size => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get seeders => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get peers => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get grabs => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get pubdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
  String? get dateElapsed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get freedate => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
  double get uploadVolumeFactor => throw _privateConstructorUsedError;
  @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
  double get downloadVolumeFactor => throw _privateConstructorUsedError;
  @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson)
  bool get hitAndRun => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'pri_order', fromJson: _intFromJson)
  int get priOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
  String get volumeFactor => throw _privateConstructorUsedError;
  @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
  String get freedateDiff => throw _privateConstructorUsedError;

  /// Serializes this SiteResourceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteResourceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteResourceItemCopyWith<SiteResourceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteResourceItemCopyWith<$Res> {
  factory $SiteResourceItemCopyWith(
    SiteResourceItem value,
    $Res Function(SiteResourceItem) then,
  ) = _$SiteResourceItemCopyWithImpl<$Res, SiteResourceItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int site,
    @JsonKey(name: 'site_name', fromJson: _stringFromJson) String siteName,
    @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
    String? siteCookie,
    @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson) String? siteUa,
    @JsonKey(name: 'site_proxy', fromJson: _boolFromJson) bool siteProxy,
    @JsonKey(name: 'site_order', fromJson: _intFromJson) int siteOrder,
    @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
    String siteDownloader,
    @JsonKey(fromJson: _stringFromJson) String title,
    @JsonKey(fromJson: _stringFromJson) String description,
    @JsonKey(fromJson: _stringNullableFromJson) String? imdbid,
    @JsonKey(fromJson: _stringNullableFromJson) String? enclosure,
    @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
    String? pageUrl,
    @JsonKey(fromJson: _doubleFromJson) double size,
    @JsonKey(fromJson: _intFromJson) int seeders,
    @JsonKey(fromJson: _intFromJson) int peers,
    @JsonKey(fromJson: _intFromJson) int grabs,
    @JsonKey(fromJson: _stringNullableFromJson) String? pubdate,
    @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
    String? dateElapsed,
    @JsonKey(fromJson: _stringNullableFromJson) String? freedate,
    @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
    double uploadVolumeFactor,
    @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
    double downloadVolumeFactor,
    @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson) bool hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) List<String> labels,
    @JsonKey(name: 'pri_order', fromJson: _intFromJson) int priOrder,
    @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
    String volumeFactor,
    @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
    String freedateDiff,
  });
}

/// @nodoc
class _$SiteResourceItemCopyWithImpl<$Res, $Val extends SiteResourceItem>
    implements $SiteResourceItemCopyWith<$Res> {
  _$SiteResourceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteResourceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? siteName = null,
    Object? siteCookie = freezed,
    Object? siteUa = freezed,
    Object? siteProxy = null,
    Object? siteOrder = null,
    Object? siteDownloader = null,
    Object? title = null,
    Object? description = null,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? pageUrl = freezed,
    Object? size = null,
    Object? seeders = null,
    Object? peers = null,
    Object? grabs = null,
    Object? pubdate = freezed,
    Object? dateElapsed = freezed,
    Object? freedate = freezed,
    Object? uploadVolumeFactor = null,
    Object? downloadVolumeFactor = null,
    Object? hitAndRun = null,
    Object? labels = null,
    Object? priOrder = null,
    Object? volumeFactor = null,
    Object? freedateDiff = null,
  }) {
    return _then(
      _value.copyWith(
            site: null == site
                ? _value.site
                : site // ignore: cast_nullable_to_non_nullable
                      as int,
            siteName: null == siteName
                ? _value.siteName
                : siteName // ignore: cast_nullable_to_non_nullable
                      as String,
            siteCookie: freezed == siteCookie
                ? _value.siteCookie
                : siteCookie // ignore: cast_nullable_to_non_nullable
                      as String?,
            siteUa: freezed == siteUa
                ? _value.siteUa
                : siteUa // ignore: cast_nullable_to_non_nullable
                      as String?,
            siteProxy: null == siteProxy
                ? _value.siteProxy
                : siteProxy // ignore: cast_nullable_to_non_nullable
                      as bool,
            siteOrder: null == siteOrder
                ? _value.siteOrder
                : siteOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            siteDownloader: null == siteDownloader
                ? _value.siteDownloader
                : siteDownloader // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            imdbid: freezed == imdbid
                ? _value.imdbid
                : imdbid // ignore: cast_nullable_to_non_nullable
                      as String?,
            enclosure: freezed == enclosure
                ? _value.enclosure
                : enclosure // ignore: cast_nullable_to_non_nullable
                      as String?,
            pageUrl: freezed == pageUrl
                ? _value.pageUrl
                : pageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as double,
            seeders: null == seeders
                ? _value.seeders
                : seeders // ignore: cast_nullable_to_non_nullable
                      as int,
            peers: null == peers
                ? _value.peers
                : peers // ignore: cast_nullable_to_non_nullable
                      as int,
            grabs: null == grabs
                ? _value.grabs
                : grabs // ignore: cast_nullable_to_non_nullable
                      as int,
            pubdate: freezed == pubdate
                ? _value.pubdate
                : pubdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateElapsed: freezed == dateElapsed
                ? _value.dateElapsed
                : dateElapsed // ignore: cast_nullable_to_non_nullable
                      as String?,
            freedate: freezed == freedate
                ? _value.freedate
                : freedate // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadVolumeFactor: null == uploadVolumeFactor
                ? _value.uploadVolumeFactor
                : uploadVolumeFactor // ignore: cast_nullable_to_non_nullable
                      as double,
            downloadVolumeFactor: null == downloadVolumeFactor
                ? _value.downloadVolumeFactor
                : downloadVolumeFactor // ignore: cast_nullable_to_non_nullable
                      as double,
            hitAndRun: null == hitAndRun
                ? _value.hitAndRun
                : hitAndRun // ignore: cast_nullable_to_non_nullable
                      as bool,
            labels: null == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            priOrder: null == priOrder
                ? _value.priOrder
                : priOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            volumeFactor: null == volumeFactor
                ? _value.volumeFactor
                : volumeFactor // ignore: cast_nullable_to_non_nullable
                      as String,
            freedateDiff: null == freedateDiff
                ? _value.freedateDiff
                : freedateDiff // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteResourceItemImplCopyWith<$Res>
    implements $SiteResourceItemCopyWith<$Res> {
  factory _$$SiteResourceItemImplCopyWith(
    _$SiteResourceItemImpl value,
    $Res Function(_$SiteResourceItemImpl) then,
  ) = __$$SiteResourceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int site,
    @JsonKey(name: 'site_name', fromJson: _stringFromJson) String siteName,
    @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
    String? siteCookie,
    @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson) String? siteUa,
    @JsonKey(name: 'site_proxy', fromJson: _boolFromJson) bool siteProxy,
    @JsonKey(name: 'site_order', fromJson: _intFromJson) int siteOrder,
    @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
    String siteDownloader,
    @JsonKey(fromJson: _stringFromJson) String title,
    @JsonKey(fromJson: _stringFromJson) String description,
    @JsonKey(fromJson: _stringNullableFromJson) String? imdbid,
    @JsonKey(fromJson: _stringNullableFromJson) String? enclosure,
    @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
    String? pageUrl,
    @JsonKey(fromJson: _doubleFromJson) double size,
    @JsonKey(fromJson: _intFromJson) int seeders,
    @JsonKey(fromJson: _intFromJson) int peers,
    @JsonKey(fromJson: _intFromJson) int grabs,
    @JsonKey(fromJson: _stringNullableFromJson) String? pubdate,
    @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
    String? dateElapsed,
    @JsonKey(fromJson: _stringNullableFromJson) String? freedate,
    @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
    double uploadVolumeFactor,
    @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
    double downloadVolumeFactor,
    @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson) bool hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) List<String> labels,
    @JsonKey(name: 'pri_order', fromJson: _intFromJson) int priOrder,
    @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
    String volumeFactor,
    @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
    String freedateDiff,
  });
}

/// @nodoc
class __$$SiteResourceItemImplCopyWithImpl<$Res>
    extends _$SiteResourceItemCopyWithImpl<$Res, _$SiteResourceItemImpl>
    implements _$$SiteResourceItemImplCopyWith<$Res> {
  __$$SiteResourceItemImplCopyWithImpl(
    _$SiteResourceItemImpl _value,
    $Res Function(_$SiteResourceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteResourceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? siteName = null,
    Object? siteCookie = freezed,
    Object? siteUa = freezed,
    Object? siteProxy = null,
    Object? siteOrder = null,
    Object? siteDownloader = null,
    Object? title = null,
    Object? description = null,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? pageUrl = freezed,
    Object? size = null,
    Object? seeders = null,
    Object? peers = null,
    Object? grabs = null,
    Object? pubdate = freezed,
    Object? dateElapsed = freezed,
    Object? freedate = freezed,
    Object? uploadVolumeFactor = null,
    Object? downloadVolumeFactor = null,
    Object? hitAndRun = null,
    Object? labels = null,
    Object? priOrder = null,
    Object? volumeFactor = null,
    Object? freedateDiff = null,
  }) {
    return _then(
      _$SiteResourceItemImpl(
        site: null == site
            ? _value.site
            : site // ignore: cast_nullable_to_non_nullable
                  as int,
        siteName: null == siteName
            ? _value.siteName
            : siteName // ignore: cast_nullable_to_non_nullable
                  as String,
        siteCookie: freezed == siteCookie
            ? _value.siteCookie
            : siteCookie // ignore: cast_nullable_to_non_nullable
                  as String?,
        siteUa: freezed == siteUa
            ? _value.siteUa
            : siteUa // ignore: cast_nullable_to_non_nullable
                  as String?,
        siteProxy: null == siteProxy
            ? _value.siteProxy
            : siteProxy // ignore: cast_nullable_to_non_nullable
                  as bool,
        siteOrder: null == siteOrder
            ? _value.siteOrder
            : siteOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        siteDownloader: null == siteDownloader
            ? _value.siteDownloader
            : siteDownloader // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        imdbid: freezed == imdbid
            ? _value.imdbid
            : imdbid // ignore: cast_nullable_to_non_nullable
                  as String?,
        enclosure: freezed == enclosure
            ? _value.enclosure
            : enclosure // ignore: cast_nullable_to_non_nullable
                  as String?,
        pageUrl: freezed == pageUrl
            ? _value.pageUrl
            : pageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as double,
        seeders: null == seeders
            ? _value.seeders
            : seeders // ignore: cast_nullable_to_non_nullable
                  as int,
        peers: null == peers
            ? _value.peers
            : peers // ignore: cast_nullable_to_non_nullable
                  as int,
        grabs: null == grabs
            ? _value.grabs
            : grabs // ignore: cast_nullable_to_non_nullable
                  as int,
        pubdate: freezed == pubdate
            ? _value.pubdate
            : pubdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateElapsed: freezed == dateElapsed
            ? _value.dateElapsed
            : dateElapsed // ignore: cast_nullable_to_non_nullable
                  as String?,
        freedate: freezed == freedate
            ? _value.freedate
            : freedate // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadVolumeFactor: null == uploadVolumeFactor
            ? _value.uploadVolumeFactor
            : uploadVolumeFactor // ignore: cast_nullable_to_non_nullable
                  as double,
        downloadVolumeFactor: null == downloadVolumeFactor
            ? _value.downloadVolumeFactor
            : downloadVolumeFactor // ignore: cast_nullable_to_non_nullable
                  as double,
        hitAndRun: null == hitAndRun
            ? _value.hitAndRun
            : hitAndRun // ignore: cast_nullable_to_non_nullable
                  as bool,
        labels: null == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        priOrder: null == priOrder
            ? _value.priOrder
            : priOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        volumeFactor: null == volumeFactor
            ? _value.volumeFactor
            : volumeFactor // ignore: cast_nullable_to_non_nullable
                  as String,
        freedateDiff: null == freedateDiff
            ? _value.freedateDiff
            : freedateDiff // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteResourceItemImpl implements _SiteResourceItem {
  const _$SiteResourceItemImpl({
    @JsonKey(fromJson: _intFromJson) this.site = 0,
    @JsonKey(name: 'site_name', fromJson: _stringFromJson) this.siteName = '',
    @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
    this.siteCookie,
    @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson) this.siteUa,
    @JsonKey(name: 'site_proxy', fromJson: _boolFromJson)
    this.siteProxy = false,
    @JsonKey(name: 'site_order', fromJson: _intFromJson) this.siteOrder = 0,
    @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
    this.siteDownloader = '',
    @JsonKey(fromJson: _stringFromJson) this.title = '',
    @JsonKey(fromJson: _stringFromJson) this.description = '',
    @JsonKey(fromJson: _stringNullableFromJson) this.imdbid,
    @JsonKey(fromJson: _stringNullableFromJson) this.enclosure,
    @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson) this.pageUrl,
    @JsonKey(fromJson: _doubleFromJson) this.size = 0,
    @JsonKey(fromJson: _intFromJson) this.seeders = 0,
    @JsonKey(fromJson: _intFromJson) this.peers = 0,
    @JsonKey(fromJson: _intFromJson) this.grabs = 0,
    @JsonKey(fromJson: _stringNullableFromJson) this.pubdate,
    @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
    this.dateElapsed,
    @JsonKey(fromJson: _stringNullableFromJson) this.freedate,
    @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
    this.uploadVolumeFactor = 1,
    @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
    this.downloadVolumeFactor = 1,
    @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson)
    this.hitAndRun = false,
    @JsonKey(fromJson: _stringListFromJson)
    final List<String> labels = const [],
    @JsonKey(name: 'pri_order', fromJson: _intFromJson) this.priOrder = 0,
    @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
    this.volumeFactor = '',
    @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
    this.freedateDiff = '',
  }) : _labels = labels;

  factory _$SiteResourceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteResourceItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int site;
  @override
  @JsonKey(name: 'site_name', fromJson: _stringFromJson)
  final String siteName;
  @override
  @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
  final String? siteCookie;
  @override
  @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson)
  final String? siteUa;
  @override
  @JsonKey(name: 'site_proxy', fromJson: _boolFromJson)
  final bool siteProxy;
  @override
  @JsonKey(name: 'site_order', fromJson: _intFromJson)
  final int siteOrder;
  @override
  @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
  final String siteDownloader;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String title;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String description;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  final String? imdbid;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  final String? enclosure;
  @override
  @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
  final String? pageUrl;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double size;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int seeders;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int peers;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int grabs;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  final String? pubdate;
  @override
  @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
  final String? dateElapsed;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  final String? freedate;
  @override
  @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
  final double uploadVolumeFactor;
  @override
  @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
  final double downloadVolumeFactor;
  @override
  @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson)
  final bool hitAndRun;
  final List<String> _labels;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  @JsonKey(name: 'pri_order', fromJson: _intFromJson)
  final int priOrder;
  @override
  @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
  final String volumeFactor;
  @override
  @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
  final String freedateDiff;

  @override
  String toString() {
    return 'SiteResourceItem(site: $site, siteName: $siteName, siteCookie: $siteCookie, siteUa: $siteUa, siteProxy: $siteProxy, siteOrder: $siteOrder, siteDownloader: $siteDownloader, title: $title, description: $description, imdbid: $imdbid, enclosure: $enclosure, pageUrl: $pageUrl, size: $size, seeders: $seeders, peers: $peers, grabs: $grabs, pubdate: $pubdate, dateElapsed: $dateElapsed, freedate: $freedate, uploadVolumeFactor: $uploadVolumeFactor, downloadVolumeFactor: $downloadVolumeFactor, hitAndRun: $hitAndRun, labels: $labels, priOrder: $priOrder, volumeFactor: $volumeFactor, freedateDiff: $freedateDiff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteResourceItemImpl &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteCookie, siteCookie) ||
                other.siteCookie == siteCookie) &&
            (identical(other.siteUa, siteUa) || other.siteUa == siteUa) &&
            (identical(other.siteProxy, siteProxy) ||
                other.siteProxy == siteProxy) &&
            (identical(other.siteOrder, siteOrder) ||
                other.siteOrder == siteOrder) &&
            (identical(other.siteDownloader, siteDownloader) ||
                other.siteDownloader == siteDownloader) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imdbid, imdbid) || other.imdbid == imdbid) &&
            (identical(other.enclosure, enclosure) ||
                other.enclosure == enclosure) &&
            (identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.seeders, seeders) || other.seeders == seeders) &&
            (identical(other.peers, peers) || other.peers == peers) &&
            (identical(other.grabs, grabs) || other.grabs == grabs) &&
            (identical(other.pubdate, pubdate) || other.pubdate == pubdate) &&
            (identical(other.dateElapsed, dateElapsed) ||
                other.dateElapsed == dateElapsed) &&
            (identical(other.freedate, freedate) ||
                other.freedate == freedate) &&
            (identical(other.uploadVolumeFactor, uploadVolumeFactor) ||
                other.uploadVolumeFactor == uploadVolumeFactor) &&
            (identical(other.downloadVolumeFactor, downloadVolumeFactor) ||
                other.downloadVolumeFactor == downloadVolumeFactor) &&
            (identical(other.hitAndRun, hitAndRun) ||
                other.hitAndRun == hitAndRun) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.priOrder, priOrder) ||
                other.priOrder == priOrder) &&
            (identical(other.volumeFactor, volumeFactor) ||
                other.volumeFactor == volumeFactor) &&
            (identical(other.freedateDiff, freedateDiff) ||
                other.freedateDiff == freedateDiff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    site,
    siteName,
    siteCookie,
    siteUa,
    siteProxy,
    siteOrder,
    siteDownloader,
    title,
    description,
    imdbid,
    enclosure,
    pageUrl,
    size,
    seeders,
    peers,
    grabs,
    pubdate,
    dateElapsed,
    freedate,
    uploadVolumeFactor,
    downloadVolumeFactor,
    hitAndRun,
    const DeepCollectionEquality().hash(_labels),
    priOrder,
    volumeFactor,
    freedateDiff,
  ]);

  /// Create a copy of SiteResourceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteResourceItemImplCopyWith<_$SiteResourceItemImpl> get copyWith =>
      __$$SiteResourceItemImplCopyWithImpl<_$SiteResourceItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteResourceItemImplToJson(this);
  }
}

abstract class _SiteResourceItem implements SiteResourceItem {
  const factory _SiteResourceItem({
    @JsonKey(fromJson: _intFromJson) final int site,
    @JsonKey(name: 'site_name', fromJson: _stringFromJson)
    final String siteName,
    @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
    final String? siteCookie,
    @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson)
    final String? siteUa,
    @JsonKey(name: 'site_proxy', fromJson: _boolFromJson) final bool siteProxy,
    @JsonKey(name: 'site_order', fromJson: _intFromJson) final int siteOrder,
    @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
    final String siteDownloader,
    @JsonKey(fromJson: _stringFromJson) final String title,
    @JsonKey(fromJson: _stringFromJson) final String description,
    @JsonKey(fromJson: _stringNullableFromJson) final String? imdbid,
    @JsonKey(fromJson: _stringNullableFromJson) final String? enclosure,
    @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
    final String? pageUrl,
    @JsonKey(fromJson: _doubleFromJson) final double size,
    @JsonKey(fromJson: _intFromJson) final int seeders,
    @JsonKey(fromJson: _intFromJson) final int peers,
    @JsonKey(fromJson: _intFromJson) final int grabs,
    @JsonKey(fromJson: _stringNullableFromJson) final String? pubdate,
    @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
    final String? dateElapsed,
    @JsonKey(fromJson: _stringNullableFromJson) final String? freedate,
    @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
    final double uploadVolumeFactor,
    @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
    final double downloadVolumeFactor,
    @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson) final bool hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) final List<String> labels,
    @JsonKey(name: 'pri_order', fromJson: _intFromJson) final int priOrder,
    @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
    final String volumeFactor,
    @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
    final String freedateDiff,
  }) = _$SiteResourceItemImpl;

  factory _SiteResourceItem.fromJson(Map<String, dynamic> json) =
      _$SiteResourceItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int get site;
  @override
  @JsonKey(name: 'site_name', fromJson: _stringFromJson)
  String get siteName;
  @override
  @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson)
  String? get siteCookie;
  @override
  @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson)
  String? get siteUa;
  @override
  @JsonKey(name: 'site_proxy', fromJson: _boolFromJson)
  bool get siteProxy;
  @override
  @JsonKey(name: 'site_order', fromJson: _intFromJson)
  int get siteOrder;
  @override
  @JsonKey(name: 'site_downloader', fromJson: _stringFromJson)
  String get siteDownloader;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get title;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get description;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get imdbid;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get enclosure;
  @override
  @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson)
  String? get pageUrl;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get size;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get seeders;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get peers;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get grabs;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get pubdate;
  @override
  @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson)
  String? get dateElapsed;
  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get freedate;
  @override
  @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson)
  double get uploadVolumeFactor;
  @override
  @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson)
  double get downloadVolumeFactor;
  @override
  @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson)
  bool get hitAndRun;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels;
  @override
  @JsonKey(name: 'pri_order', fromJson: _intFromJson)
  int get priOrder;
  @override
  @JsonKey(name: 'volume_factor', fromJson: _stringFromJson)
  String get volumeFactor;
  @override
  @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson)
  String get freedateDiff;

  /// Create a copy of SiteResourceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteResourceItemImplCopyWith<_$SiteResourceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
