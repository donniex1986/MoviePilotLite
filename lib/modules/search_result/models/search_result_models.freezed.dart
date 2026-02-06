// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) {
  return _SearchResultItem.fromJson(json);
}

/// @nodoc
mixin _$SearchResultItem {
  @JsonKey(name: 'meta_info')
  SearchMetaInfo? get meta_info => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_info')
  Map<String, dynamic>? get media_info => throw _privateConstructorUsedError;
  @JsonKey(name: 'torrent_info')
  SearchTorrentInfo? get torrent_info => throw _privateConstructorUsedError;

  /// Serializes this SearchResultItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultItemCopyWith<SearchResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultItemCopyWith<$Res> {
  factory $SearchResultItemCopyWith(
    SearchResultItem value,
    $Res Function(SearchResultItem) then,
  ) = _$SearchResultItemCopyWithImpl<$Res, SearchResultItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'meta_info') SearchMetaInfo? meta_info,
    @JsonKey(name: 'media_info') Map<String, dynamic>? media_info,
    @JsonKey(name: 'torrent_info') SearchTorrentInfo? torrent_info,
  });

  $SearchMetaInfoCopyWith<$Res>? get meta_info;
  $SearchTorrentInfoCopyWith<$Res>? get torrent_info;
}

/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res, $Val extends SearchResultItem>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta_info = freezed,
    Object? media_info = freezed,
    Object? torrent_info = freezed,
  }) {
    return _then(
      _value.copyWith(
            meta_info: freezed == meta_info
                ? _value.meta_info
                : meta_info // ignore: cast_nullable_to_non_nullable
                      as SearchMetaInfo?,
            media_info: freezed == media_info
                ? _value.media_info
                : media_info // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            torrent_info: freezed == torrent_info
                ? _value.torrent_info
                : torrent_info // ignore: cast_nullable_to_non_nullable
                      as SearchTorrentInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchMetaInfoCopyWith<$Res>? get meta_info {
    if (_value.meta_info == null) {
      return null;
    }

    return $SearchMetaInfoCopyWith<$Res>(_value.meta_info!, (value) {
      return _then(_value.copyWith(meta_info: value) as $Val);
    });
  }

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTorrentInfoCopyWith<$Res>? get torrent_info {
    if (_value.torrent_info == null) {
      return null;
    }

    return $SearchTorrentInfoCopyWith<$Res>(_value.torrent_info!, (value) {
      return _then(_value.copyWith(torrent_info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultItemImplCopyWith<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  factory _$$SearchResultItemImplCopyWith(
    _$SearchResultItemImpl value,
    $Res Function(_$SearchResultItemImpl) then,
  ) = __$$SearchResultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'meta_info') SearchMetaInfo? meta_info,
    @JsonKey(name: 'media_info') Map<String, dynamic>? media_info,
    @JsonKey(name: 'torrent_info') SearchTorrentInfo? torrent_info,
  });

  @override
  $SearchMetaInfoCopyWith<$Res>? get meta_info;
  @override
  $SearchTorrentInfoCopyWith<$Res>? get torrent_info;
}

/// @nodoc
class __$$SearchResultItemImplCopyWithImpl<$Res>
    extends _$SearchResultItemCopyWithImpl<$Res, _$SearchResultItemImpl>
    implements _$$SearchResultItemImplCopyWith<$Res> {
  __$$SearchResultItemImplCopyWithImpl(
    _$SearchResultItemImpl _value,
    $Res Function(_$SearchResultItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta_info = freezed,
    Object? media_info = freezed,
    Object? torrent_info = freezed,
  }) {
    return _then(
      _$SearchResultItemImpl(
        meta_info: freezed == meta_info
            ? _value.meta_info
            : meta_info // ignore: cast_nullable_to_non_nullable
                  as SearchMetaInfo?,
        media_info: freezed == media_info
            ? _value._media_info
            : media_info // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        torrent_info: freezed == torrent_info
            ? _value.torrent_info
            : torrent_info // ignore: cast_nullable_to_non_nullable
                  as SearchTorrentInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultItemImpl implements _SearchResultItem {
  const _$SearchResultItemImpl({
    @JsonKey(name: 'meta_info') this.meta_info,
    @JsonKey(name: 'media_info') final Map<String, dynamic>? media_info,
    @JsonKey(name: 'torrent_info') this.torrent_info,
  }) : _media_info = media_info;

  factory _$SearchResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultItemImplFromJson(json);

  @override
  @JsonKey(name: 'meta_info')
  final SearchMetaInfo? meta_info;
  final Map<String, dynamic>? _media_info;
  @override
  @JsonKey(name: 'media_info')
  Map<String, dynamic>? get media_info {
    final value = _media_info;
    if (value == null) return null;
    if (_media_info is EqualUnmodifiableMapView) return _media_info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'torrent_info')
  final SearchTorrentInfo? torrent_info;

  @override
  String toString() {
    return 'SearchResultItem(meta_info: $meta_info, media_info: $media_info, torrent_info: $torrent_info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultItemImpl &&
            (identical(other.meta_info, meta_info) ||
                other.meta_info == meta_info) &&
            const DeepCollectionEquality().equals(
              other._media_info,
              _media_info,
            ) &&
            (identical(other.torrent_info, torrent_info) ||
                other.torrent_info == torrent_info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    meta_info,
    const DeepCollectionEquality().hash(_media_info),
    torrent_info,
  );

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultItemImplCopyWith<_$SearchResultItemImpl> get copyWith =>
      __$$SearchResultItemImplCopyWithImpl<_$SearchResultItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultItemImplToJson(this);
  }
}

abstract class _SearchResultItem implements SearchResultItem {
  const factory _SearchResultItem({
    @JsonKey(name: 'meta_info') final SearchMetaInfo? meta_info,
    @JsonKey(name: 'media_info') final Map<String, dynamic>? media_info,
    @JsonKey(name: 'torrent_info') final SearchTorrentInfo? torrent_info,
  }) = _$SearchResultItemImpl;

  factory _SearchResultItem.fromJson(Map<String, dynamic> json) =
      _$SearchResultItemImpl.fromJson;

  @override
  @JsonKey(name: 'meta_info')
  SearchMetaInfo? get meta_info;
  @override
  @JsonKey(name: 'media_info')
  Map<String, dynamic>? get media_info;
  @override
  @JsonKey(name: 'torrent_info')
  SearchTorrentInfo? get torrent_info;

  /// Create a copy of SearchResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultItemImplCopyWith<_$SearchResultItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchMetaInfo _$SearchMetaInfoFromJson(Map<String, dynamic> json) {
  return _SearchMetaInfo.fromJson(json);
}

/// @nodoc
mixin _$SearchMetaInfo {
  bool? get isfile => throw _privateConstructorUsedError;
  String? get org_string => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get cn_name => throw _privateConstructorUsedError;
  String? get en_name => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get total_season => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get begin_season => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get end_season => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get total_episode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get begin_episode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get end_episode => throw _privateConstructorUsedError;
  String? get season_episode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get episode_list => throw _privateConstructorUsedError;
  String? get part => throw _privateConstructorUsedError;
  String? get resource_type => throw _privateConstructorUsedError;
  String? get resource_effect => throw _privateConstructorUsedError;
  String? get resource_pix => throw _privateConstructorUsedError;
  String? get resource_team => throw _privateConstructorUsedError;
  String? get video_encode => throw _privateConstructorUsedError;
  String? get audio_encode => throw _privateConstructorUsedError;
  String? get edition => throw _privateConstructorUsedError;
  String? get web_source => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get apply_words => throw _privateConstructorUsedError;

  /// Serializes this SearchMetaInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchMetaInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchMetaInfoCopyWith<SearchMetaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMetaInfoCopyWith<$Res> {
  factory $SearchMetaInfoCopyWith(
    SearchMetaInfo value,
    $Res Function(SearchMetaInfo) then,
  ) = _$SearchMetaInfoCopyWithImpl<$Res, SearchMetaInfo>;
  @useResult
  $Res call({
    bool? isfile,
    String? org_string,
    String? title,
    String? subtitle,
    String? type,
    String? name,
    String? cn_name,
    String? en_name,
    String? year,
    @JsonKey(fromJson: _intFromJson) int? total_season,
    @JsonKey(fromJson: _intFromJson) int? begin_season,
    @JsonKey(fromJson: _intFromJson) int? end_season,
    @JsonKey(fromJson: _intFromJson) int? total_episode,
    @JsonKey(fromJson: _intFromJson) int? begin_episode,
    @JsonKey(fromJson: _intFromJson) int? end_episode,
    String? season_episode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? episode_list,
    String? part,
    String? resource_type,
    String? resource_effect,
    String? resource_pix,
    String? resource_team,
    String? video_encode,
    String? audio_encode,
    String? edition,
    String? web_source,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    List<String>? apply_words,
  });
}

/// @nodoc
class _$SearchMetaInfoCopyWithImpl<$Res, $Val extends SearchMetaInfo>
    implements $SearchMetaInfoCopyWith<$Res> {
  _$SearchMetaInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchMetaInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isfile = freezed,
    Object? org_string = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? cn_name = freezed,
    Object? en_name = freezed,
    Object? year = freezed,
    Object? total_season = freezed,
    Object? begin_season = freezed,
    Object? end_season = freezed,
    Object? total_episode = freezed,
    Object? begin_episode = freezed,
    Object? end_episode = freezed,
    Object? season_episode = freezed,
    Object? episode_list = freezed,
    Object? part = freezed,
    Object? resource_type = freezed,
    Object? resource_effect = freezed,
    Object? resource_pix = freezed,
    Object? resource_team = freezed,
    Object? video_encode = freezed,
    Object? audio_encode = freezed,
    Object? edition = freezed,
    Object? web_source = freezed,
    Object? apply_words = freezed,
  }) {
    return _then(
      _value.copyWith(
            isfile: freezed == isfile
                ? _value.isfile
                : isfile // ignore: cast_nullable_to_non_nullable
                      as bool?,
            org_string: freezed == org_string
                ? _value.org_string
                : org_string // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            cn_name: freezed == cn_name
                ? _value.cn_name
                : cn_name // ignore: cast_nullable_to_non_nullable
                      as String?,
            en_name: freezed == en_name
                ? _value.en_name
                : en_name // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            total_season: freezed == total_season
                ? _value.total_season
                : total_season // ignore: cast_nullable_to_non_nullable
                      as int?,
            begin_season: freezed == begin_season
                ? _value.begin_season
                : begin_season // ignore: cast_nullable_to_non_nullable
                      as int?,
            end_season: freezed == end_season
                ? _value.end_season
                : end_season // ignore: cast_nullable_to_non_nullable
                      as int?,
            total_episode: freezed == total_episode
                ? _value.total_episode
                : total_episode // ignore: cast_nullable_to_non_nullable
                      as int?,
            begin_episode: freezed == begin_episode
                ? _value.begin_episode
                : begin_episode // ignore: cast_nullable_to_non_nullable
                      as int?,
            end_episode: freezed == end_episode
                ? _value.end_episode
                : end_episode // ignore: cast_nullable_to_non_nullable
                      as int?,
            season_episode: freezed == season_episode
                ? _value.season_episode
                : season_episode // ignore: cast_nullable_to_non_nullable
                      as String?,
            episode_list: freezed == episode_list
                ? _value.episode_list
                : episode_list // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            part: freezed == part
                ? _value.part
                : part // ignore: cast_nullable_to_non_nullable
                      as String?,
            resource_type: freezed == resource_type
                ? _value.resource_type
                : resource_type // ignore: cast_nullable_to_non_nullable
                      as String?,
            resource_effect: freezed == resource_effect
                ? _value.resource_effect
                : resource_effect // ignore: cast_nullable_to_non_nullable
                      as String?,
            resource_pix: freezed == resource_pix
                ? _value.resource_pix
                : resource_pix // ignore: cast_nullable_to_non_nullable
                      as String?,
            resource_team: freezed == resource_team
                ? _value.resource_team
                : resource_team // ignore: cast_nullable_to_non_nullable
                      as String?,
            video_encode: freezed == video_encode
                ? _value.video_encode
                : video_encode // ignore: cast_nullable_to_non_nullable
                      as String?,
            audio_encode: freezed == audio_encode
                ? _value.audio_encode
                : audio_encode // ignore: cast_nullable_to_non_nullable
                      as String?,
            edition: freezed == edition
                ? _value.edition
                : edition // ignore: cast_nullable_to_non_nullable
                      as String?,
            web_source: freezed == web_source
                ? _value.web_source
                : web_source // ignore: cast_nullable_to_non_nullable
                      as String?,
            apply_words: freezed == apply_words
                ? _value.apply_words
                : apply_words // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchMetaInfoImplCopyWith<$Res>
    implements $SearchMetaInfoCopyWith<$Res> {
  factory _$$SearchMetaInfoImplCopyWith(
    _$SearchMetaInfoImpl value,
    $Res Function(_$SearchMetaInfoImpl) then,
  ) = __$$SearchMetaInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isfile,
    String? org_string,
    String? title,
    String? subtitle,
    String? type,
    String? name,
    String? cn_name,
    String? en_name,
    String? year,
    @JsonKey(fromJson: _intFromJson) int? total_season,
    @JsonKey(fromJson: _intFromJson) int? begin_season,
    @JsonKey(fromJson: _intFromJson) int? end_season,
    @JsonKey(fromJson: _intFromJson) int? total_episode,
    @JsonKey(fromJson: _intFromJson) int? begin_episode,
    @JsonKey(fromJson: _intFromJson) int? end_episode,
    String? season_episode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? episode_list,
    String? part,
    String? resource_type,
    String? resource_effect,
    String? resource_pix,
    String? resource_team,
    String? video_encode,
    String? audio_encode,
    String? edition,
    String? web_source,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    List<String>? apply_words,
  });
}

/// @nodoc
class __$$SearchMetaInfoImplCopyWithImpl<$Res>
    extends _$SearchMetaInfoCopyWithImpl<$Res, _$SearchMetaInfoImpl>
    implements _$$SearchMetaInfoImplCopyWith<$Res> {
  __$$SearchMetaInfoImplCopyWithImpl(
    _$SearchMetaInfoImpl _value,
    $Res Function(_$SearchMetaInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchMetaInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isfile = freezed,
    Object? org_string = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? cn_name = freezed,
    Object? en_name = freezed,
    Object? year = freezed,
    Object? total_season = freezed,
    Object? begin_season = freezed,
    Object? end_season = freezed,
    Object? total_episode = freezed,
    Object? begin_episode = freezed,
    Object? end_episode = freezed,
    Object? season_episode = freezed,
    Object? episode_list = freezed,
    Object? part = freezed,
    Object? resource_type = freezed,
    Object? resource_effect = freezed,
    Object? resource_pix = freezed,
    Object? resource_team = freezed,
    Object? video_encode = freezed,
    Object? audio_encode = freezed,
    Object? edition = freezed,
    Object? web_source = freezed,
    Object? apply_words = freezed,
  }) {
    return _then(
      _$SearchMetaInfoImpl(
        isfile: freezed == isfile
            ? _value.isfile
            : isfile // ignore: cast_nullable_to_non_nullable
                  as bool?,
        org_string: freezed == org_string
            ? _value.org_string
            : org_string // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        cn_name: freezed == cn_name
            ? _value.cn_name
            : cn_name // ignore: cast_nullable_to_non_nullable
                  as String?,
        en_name: freezed == en_name
            ? _value.en_name
            : en_name // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        total_season: freezed == total_season
            ? _value.total_season
            : total_season // ignore: cast_nullable_to_non_nullable
                  as int?,
        begin_season: freezed == begin_season
            ? _value.begin_season
            : begin_season // ignore: cast_nullable_to_non_nullable
                  as int?,
        end_season: freezed == end_season
            ? _value.end_season
            : end_season // ignore: cast_nullable_to_non_nullable
                  as int?,
        total_episode: freezed == total_episode
            ? _value.total_episode
            : total_episode // ignore: cast_nullable_to_non_nullable
                  as int?,
        begin_episode: freezed == begin_episode
            ? _value.begin_episode
            : begin_episode // ignore: cast_nullable_to_non_nullable
                  as int?,
        end_episode: freezed == end_episode
            ? _value.end_episode
            : end_episode // ignore: cast_nullable_to_non_nullable
                  as int?,
        season_episode: freezed == season_episode
            ? _value.season_episode
            : season_episode // ignore: cast_nullable_to_non_nullable
                  as String?,
        episode_list: freezed == episode_list
            ? _value._episode_list
            : episode_list // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        part: freezed == part
            ? _value.part
            : part // ignore: cast_nullable_to_non_nullable
                  as String?,
        resource_type: freezed == resource_type
            ? _value.resource_type
            : resource_type // ignore: cast_nullable_to_non_nullable
                  as String?,
        resource_effect: freezed == resource_effect
            ? _value.resource_effect
            : resource_effect // ignore: cast_nullable_to_non_nullable
                  as String?,
        resource_pix: freezed == resource_pix
            ? _value.resource_pix
            : resource_pix // ignore: cast_nullable_to_non_nullable
                  as String?,
        resource_team: freezed == resource_team
            ? _value.resource_team
            : resource_team // ignore: cast_nullable_to_non_nullable
                  as String?,
        video_encode: freezed == video_encode
            ? _value.video_encode
            : video_encode // ignore: cast_nullable_to_non_nullable
                  as String?,
        audio_encode: freezed == audio_encode
            ? _value.audio_encode
            : audio_encode // ignore: cast_nullable_to_non_nullable
                  as String?,
        edition: freezed == edition
            ? _value.edition
            : edition // ignore: cast_nullable_to_non_nullable
                  as String?,
        web_source: freezed == web_source
            ? _value.web_source
            : web_source // ignore: cast_nullable_to_non_nullable
                  as String?,
        apply_words: freezed == apply_words
            ? _value._apply_words
            : apply_words // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchMetaInfoImpl implements _SearchMetaInfo {
  const _$SearchMetaInfoImpl({
    this.isfile,
    this.org_string,
    this.title,
    this.subtitle,
    this.type,
    this.name,
    this.cn_name,
    this.en_name,
    this.year,
    @JsonKey(fromJson: _intFromJson) this.total_season,
    @JsonKey(fromJson: _intFromJson) this.begin_season,
    @JsonKey(fromJson: _intFromJson) this.end_season,
    @JsonKey(fromJson: _intFromJson) this.total_episode,
    @JsonKey(fromJson: _intFromJson) this.begin_episode,
    @JsonKey(fromJson: _intFromJson) this.end_episode,
    this.season_episode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? episode_list,
    this.part,
    this.resource_type,
    this.resource_effect,
    this.resource_pix,
    this.resource_team,
    this.video_encode,
    this.audio_encode,
    this.edition,
    this.web_source,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    final List<String>? apply_words,
  }) : _episode_list = episode_list,
       _apply_words = apply_words;

  factory _$SearchMetaInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchMetaInfoImplFromJson(json);

  @override
  final bool? isfile;
  @override
  final String? org_string;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? cn_name;
  @override
  final String? en_name;
  @override
  final String? year;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? total_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? begin_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? end_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? total_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? begin_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? end_episode;
  @override
  final String? season_episode;
  final List<int>? _episode_list;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get episode_list {
    final value = _episode_list;
    if (value == null) return null;
    if (_episode_list is EqualUnmodifiableListView) return _episode_list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? part;
  @override
  final String? resource_type;
  @override
  final String? resource_effect;
  @override
  final String? resource_pix;
  @override
  final String? resource_team;
  @override
  final String? video_encode;
  @override
  final String? audio_encode;
  @override
  final String? edition;
  @override
  final String? web_source;
  final List<String>? _apply_words;
  @override
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get apply_words {
    final value = _apply_words;
    if (value == null) return null;
    if (_apply_words is EqualUnmodifiableListView) return _apply_words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchMetaInfo(isfile: $isfile, org_string: $org_string, title: $title, subtitle: $subtitle, type: $type, name: $name, cn_name: $cn_name, en_name: $en_name, year: $year, total_season: $total_season, begin_season: $begin_season, end_season: $end_season, total_episode: $total_episode, begin_episode: $begin_episode, end_episode: $end_episode, season_episode: $season_episode, episode_list: $episode_list, part: $part, resource_type: $resource_type, resource_effect: $resource_effect, resource_pix: $resource_pix, resource_team: $resource_team, video_encode: $video_encode, audio_encode: $audio_encode, edition: $edition, web_source: $web_source, apply_words: $apply_words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMetaInfoImpl &&
            (identical(other.isfile, isfile) || other.isfile == isfile) &&
            (identical(other.org_string, org_string) ||
                other.org_string == org_string) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cn_name, cn_name) || other.cn_name == cn_name) &&
            (identical(other.en_name, en_name) || other.en_name == en_name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.total_season, total_season) ||
                other.total_season == total_season) &&
            (identical(other.begin_season, begin_season) ||
                other.begin_season == begin_season) &&
            (identical(other.end_season, end_season) ||
                other.end_season == end_season) &&
            (identical(other.total_episode, total_episode) ||
                other.total_episode == total_episode) &&
            (identical(other.begin_episode, begin_episode) ||
                other.begin_episode == begin_episode) &&
            (identical(other.end_episode, end_episode) ||
                other.end_episode == end_episode) &&
            (identical(other.season_episode, season_episode) ||
                other.season_episode == season_episode) &&
            const DeepCollectionEquality().equals(
              other._episode_list,
              _episode_list,
            ) &&
            (identical(other.part, part) || other.part == part) &&
            (identical(other.resource_type, resource_type) ||
                other.resource_type == resource_type) &&
            (identical(other.resource_effect, resource_effect) ||
                other.resource_effect == resource_effect) &&
            (identical(other.resource_pix, resource_pix) ||
                other.resource_pix == resource_pix) &&
            (identical(other.resource_team, resource_team) ||
                other.resource_team == resource_team) &&
            (identical(other.video_encode, video_encode) ||
                other.video_encode == video_encode) &&
            (identical(other.audio_encode, audio_encode) ||
                other.audio_encode == audio_encode) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.web_source, web_source) ||
                other.web_source == web_source) &&
            const DeepCollectionEquality().equals(
              other._apply_words,
              _apply_words,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    isfile,
    org_string,
    title,
    subtitle,
    type,
    name,
    cn_name,
    en_name,
    year,
    total_season,
    begin_season,
    end_season,
    total_episode,
    begin_episode,
    end_episode,
    season_episode,
    const DeepCollectionEquality().hash(_episode_list),
    part,
    resource_type,
    resource_effect,
    resource_pix,
    resource_team,
    video_encode,
    audio_encode,
    edition,
    web_source,
    const DeepCollectionEquality().hash(_apply_words),
  ]);

  /// Create a copy of SearchMetaInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMetaInfoImplCopyWith<_$SearchMetaInfoImpl> get copyWith =>
      __$$SearchMetaInfoImplCopyWithImpl<_$SearchMetaInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchMetaInfoImplToJson(this);
  }
}

abstract class _SearchMetaInfo implements SearchMetaInfo {
  const factory _SearchMetaInfo({
    final bool? isfile,
    final String? org_string,
    final String? title,
    final String? subtitle,
    final String? type,
    final String? name,
    final String? cn_name,
    final String? en_name,
    final String? year,
    @JsonKey(fromJson: _intFromJson) final int? total_season,
    @JsonKey(fromJson: _intFromJson) final int? begin_season,
    @JsonKey(fromJson: _intFromJson) final int? end_season,
    @JsonKey(fromJson: _intFromJson) final int? total_episode,
    @JsonKey(fromJson: _intFromJson) final int? begin_episode,
    @JsonKey(fromJson: _intFromJson) final int? end_episode,
    final String? season_episode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? episode_list,
    final String? part,
    final String? resource_type,
    final String? resource_effect,
    final String? resource_pix,
    final String? resource_team,
    final String? video_encode,
    final String? audio_encode,
    final String? edition,
    final String? web_source,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    final List<String>? apply_words,
  }) = _$SearchMetaInfoImpl;

  factory _SearchMetaInfo.fromJson(Map<String, dynamic> json) =
      _$SearchMetaInfoImpl.fromJson;

  @override
  bool? get isfile;
  @override
  String? get org_string;
  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get cn_name;
  @override
  String? get en_name;
  @override
  String? get year;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get total_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get begin_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get end_season;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get total_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get begin_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get end_episode;
  @override
  String? get season_episode;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get episode_list;
  @override
  String? get part;
  @override
  String? get resource_type;
  @override
  String? get resource_effect;
  @override
  String? get resource_pix;
  @override
  String? get resource_team;
  @override
  String? get video_encode;
  @override
  String? get audio_encode;
  @override
  String? get edition;
  @override
  String? get web_source;
  @override
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get apply_words;

  /// Create a copy of SearchMetaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchMetaInfoImplCopyWith<_$SearchMetaInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchTorrentInfo _$SearchTorrentInfoFromJson(Map<String, dynamic> json) {
  return _SearchTorrentInfo.fromJson(json);
}

/// @nodoc
mixin _$SearchTorrentInfo {
  @JsonKey(fromJson: _intFromJson)
  int? get site => throw _privateConstructorUsedError;
  String? get site_name => throw _privateConstructorUsedError;
  String? get site_cookie => throw _privateConstructorUsedError;
  String? get site_ua => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool? get site_proxy => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get site_order => throw _privateConstructorUsedError;
  String? get site_downloader => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imdbid => throw _privateConstructorUsedError;
  String? get enclosure => throw _privateConstructorUsedError;
  String? get page_url => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get size => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get seeders => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get peers => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get grabs => throw _privateConstructorUsedError;
  String? get pubdate => throw _privateConstructorUsedError;
  String? get date_elapsed => throw _privateConstructorUsedError;
  String? get freedate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get uploadvolumefactor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get downloadvolumefactor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool? get hit_and_run => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get labels => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get pri_order => throw _privateConstructorUsedError;
  String? get volume_factor => throw _privateConstructorUsedError;
  String? get freedate_diff => throw _privateConstructorUsedError;

  /// Serializes this SearchTorrentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTorrentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTorrentInfoCopyWith<SearchTorrentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTorrentInfoCopyWith<$Res> {
  factory $SearchTorrentInfoCopyWith(
    SearchTorrentInfo value,
    $Res Function(SearchTorrentInfo) then,
  ) = _$SearchTorrentInfoCopyWithImpl<$Res, SearchTorrentInfo>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? site,
    String? site_name,
    String? site_cookie,
    String? site_ua,
    @JsonKey(fromJson: _boolFromJson) bool? site_proxy,
    @JsonKey(fromJson: _intFromJson) int? site_order,
    String? site_downloader,
    String? title,
    String? description,
    String? imdbid,
    String? enclosure,
    String? page_url,
    @JsonKey(fromJson: _doubleFromJson) double? size,
    @JsonKey(fromJson: _intFromJson) int? seeders,
    @JsonKey(fromJson: _intFromJson) int? peers,
    @JsonKey(fromJson: _intFromJson) int? grabs,
    String? pubdate,
    String? date_elapsed,
    String? freedate,
    @JsonKey(fromJson: _doubleFromJson) double? uploadvolumefactor,
    @JsonKey(fromJson: _doubleFromJson) double? downloadvolumefactor,
    @JsonKey(fromJson: _boolFromJson) bool? hit_and_run,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    List<String>? labels,
    @JsonKey(fromJson: _intFromJson) int? pri_order,
    String? volume_factor,
    String? freedate_diff,
  });
}

/// @nodoc
class _$SearchTorrentInfoCopyWithImpl<$Res, $Val extends SearchTorrentInfo>
    implements $SearchTorrentInfoCopyWith<$Res> {
  _$SearchTorrentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTorrentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = freezed,
    Object? site_name = freezed,
    Object? site_cookie = freezed,
    Object? site_ua = freezed,
    Object? site_proxy = freezed,
    Object? site_order = freezed,
    Object? site_downloader = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? page_url = freezed,
    Object? size = freezed,
    Object? seeders = freezed,
    Object? peers = freezed,
    Object? grabs = freezed,
    Object? pubdate = freezed,
    Object? date_elapsed = freezed,
    Object? freedate = freezed,
    Object? uploadvolumefactor = freezed,
    Object? downloadvolumefactor = freezed,
    Object? hit_and_run = freezed,
    Object? labels = freezed,
    Object? pri_order = freezed,
    Object? volume_factor = freezed,
    Object? freedate_diff = freezed,
  }) {
    return _then(
      _value.copyWith(
            site: freezed == site
                ? _value.site
                : site // ignore: cast_nullable_to_non_nullable
                      as int?,
            site_name: freezed == site_name
                ? _value.site_name
                : site_name // ignore: cast_nullable_to_non_nullable
                      as String?,
            site_cookie: freezed == site_cookie
                ? _value.site_cookie
                : site_cookie // ignore: cast_nullable_to_non_nullable
                      as String?,
            site_ua: freezed == site_ua
                ? _value.site_ua
                : site_ua // ignore: cast_nullable_to_non_nullable
                      as String?,
            site_proxy: freezed == site_proxy
                ? _value.site_proxy
                : site_proxy // ignore: cast_nullable_to_non_nullable
                      as bool?,
            site_order: freezed == site_order
                ? _value.site_order
                : site_order // ignore: cast_nullable_to_non_nullable
                      as int?,
            site_downloader: freezed == site_downloader
                ? _value.site_downloader
                : site_downloader // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            imdbid: freezed == imdbid
                ? _value.imdbid
                : imdbid // ignore: cast_nullable_to_non_nullable
                      as String?,
            enclosure: freezed == enclosure
                ? _value.enclosure
                : enclosure // ignore: cast_nullable_to_non_nullable
                      as String?,
            page_url: freezed == page_url
                ? _value.page_url
                : page_url // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as double?,
            seeders: freezed == seeders
                ? _value.seeders
                : seeders // ignore: cast_nullable_to_non_nullable
                      as int?,
            peers: freezed == peers
                ? _value.peers
                : peers // ignore: cast_nullable_to_non_nullable
                      as int?,
            grabs: freezed == grabs
                ? _value.grabs
                : grabs // ignore: cast_nullable_to_non_nullable
                      as int?,
            pubdate: freezed == pubdate
                ? _value.pubdate
                : pubdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            date_elapsed: freezed == date_elapsed
                ? _value.date_elapsed
                : date_elapsed // ignore: cast_nullable_to_non_nullable
                      as String?,
            freedate: freezed == freedate
                ? _value.freedate
                : freedate // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadvolumefactor: freezed == uploadvolumefactor
                ? _value.uploadvolumefactor
                : uploadvolumefactor // ignore: cast_nullable_to_non_nullable
                      as double?,
            downloadvolumefactor: freezed == downloadvolumefactor
                ? _value.downloadvolumefactor
                : downloadvolumefactor // ignore: cast_nullable_to_non_nullable
                      as double?,
            hit_and_run: freezed == hit_and_run
                ? _value.hit_and_run
                : hit_and_run // ignore: cast_nullable_to_non_nullable
                      as bool?,
            labels: freezed == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            pri_order: freezed == pri_order
                ? _value.pri_order
                : pri_order // ignore: cast_nullable_to_non_nullable
                      as int?,
            volume_factor: freezed == volume_factor
                ? _value.volume_factor
                : volume_factor // ignore: cast_nullable_to_non_nullable
                      as String?,
            freedate_diff: freezed == freedate_diff
                ? _value.freedate_diff
                : freedate_diff // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchTorrentInfoImplCopyWith<$Res>
    implements $SearchTorrentInfoCopyWith<$Res> {
  factory _$$SearchTorrentInfoImplCopyWith(
    _$SearchTorrentInfoImpl value,
    $Res Function(_$SearchTorrentInfoImpl) then,
  ) = __$$SearchTorrentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? site,
    String? site_name,
    String? site_cookie,
    String? site_ua,
    @JsonKey(fromJson: _boolFromJson) bool? site_proxy,
    @JsonKey(fromJson: _intFromJson) int? site_order,
    String? site_downloader,
    String? title,
    String? description,
    String? imdbid,
    String? enclosure,
    String? page_url,
    @JsonKey(fromJson: _doubleFromJson) double? size,
    @JsonKey(fromJson: _intFromJson) int? seeders,
    @JsonKey(fromJson: _intFromJson) int? peers,
    @JsonKey(fromJson: _intFromJson) int? grabs,
    String? pubdate,
    String? date_elapsed,
    String? freedate,
    @JsonKey(fromJson: _doubleFromJson) double? uploadvolumefactor,
    @JsonKey(fromJson: _doubleFromJson) double? downloadvolumefactor,
    @JsonKey(fromJson: _boolFromJson) bool? hit_and_run,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    List<String>? labels,
    @JsonKey(fromJson: _intFromJson) int? pri_order,
    String? volume_factor,
    String? freedate_diff,
  });
}

/// @nodoc
class __$$SearchTorrentInfoImplCopyWithImpl<$Res>
    extends _$SearchTorrentInfoCopyWithImpl<$Res, _$SearchTorrentInfoImpl>
    implements _$$SearchTorrentInfoImplCopyWith<$Res> {
  __$$SearchTorrentInfoImplCopyWithImpl(
    _$SearchTorrentInfoImpl _value,
    $Res Function(_$SearchTorrentInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchTorrentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = freezed,
    Object? site_name = freezed,
    Object? site_cookie = freezed,
    Object? site_ua = freezed,
    Object? site_proxy = freezed,
    Object? site_order = freezed,
    Object? site_downloader = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? page_url = freezed,
    Object? size = freezed,
    Object? seeders = freezed,
    Object? peers = freezed,
    Object? grabs = freezed,
    Object? pubdate = freezed,
    Object? date_elapsed = freezed,
    Object? freedate = freezed,
    Object? uploadvolumefactor = freezed,
    Object? downloadvolumefactor = freezed,
    Object? hit_and_run = freezed,
    Object? labels = freezed,
    Object? pri_order = freezed,
    Object? volume_factor = freezed,
    Object? freedate_diff = freezed,
  }) {
    return _then(
      _$SearchTorrentInfoImpl(
        site: freezed == site
            ? _value.site
            : site // ignore: cast_nullable_to_non_nullable
                  as int?,
        site_name: freezed == site_name
            ? _value.site_name
            : site_name // ignore: cast_nullable_to_non_nullable
                  as String?,
        site_cookie: freezed == site_cookie
            ? _value.site_cookie
            : site_cookie // ignore: cast_nullable_to_non_nullable
                  as String?,
        site_ua: freezed == site_ua
            ? _value.site_ua
            : site_ua // ignore: cast_nullable_to_non_nullable
                  as String?,
        site_proxy: freezed == site_proxy
            ? _value.site_proxy
            : site_proxy // ignore: cast_nullable_to_non_nullable
                  as bool?,
        site_order: freezed == site_order
            ? _value.site_order
            : site_order // ignore: cast_nullable_to_non_nullable
                  as int?,
        site_downloader: freezed == site_downloader
            ? _value.site_downloader
            : site_downloader // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        imdbid: freezed == imdbid
            ? _value.imdbid
            : imdbid // ignore: cast_nullable_to_non_nullable
                  as String?,
        enclosure: freezed == enclosure
            ? _value.enclosure
            : enclosure // ignore: cast_nullable_to_non_nullable
                  as String?,
        page_url: freezed == page_url
            ? _value.page_url
            : page_url // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as double?,
        seeders: freezed == seeders
            ? _value.seeders
            : seeders // ignore: cast_nullable_to_non_nullable
                  as int?,
        peers: freezed == peers
            ? _value.peers
            : peers // ignore: cast_nullable_to_non_nullable
                  as int?,
        grabs: freezed == grabs
            ? _value.grabs
            : grabs // ignore: cast_nullable_to_non_nullable
                  as int?,
        pubdate: freezed == pubdate
            ? _value.pubdate
            : pubdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        date_elapsed: freezed == date_elapsed
            ? _value.date_elapsed
            : date_elapsed // ignore: cast_nullable_to_non_nullable
                  as String?,
        freedate: freezed == freedate
            ? _value.freedate
            : freedate // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadvolumefactor: freezed == uploadvolumefactor
            ? _value.uploadvolumefactor
            : uploadvolumefactor // ignore: cast_nullable_to_non_nullable
                  as double?,
        downloadvolumefactor: freezed == downloadvolumefactor
            ? _value.downloadvolumefactor
            : downloadvolumefactor // ignore: cast_nullable_to_non_nullable
                  as double?,
        hit_and_run: freezed == hit_and_run
            ? _value.hit_and_run
            : hit_and_run // ignore: cast_nullable_to_non_nullable
                  as bool?,
        labels: freezed == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        pri_order: freezed == pri_order
            ? _value.pri_order
            : pri_order // ignore: cast_nullable_to_non_nullable
                  as int?,
        volume_factor: freezed == volume_factor
            ? _value.volume_factor
            : volume_factor // ignore: cast_nullable_to_non_nullable
                  as String?,
        freedate_diff: freezed == freedate_diff
            ? _value.freedate_diff
            : freedate_diff // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTorrentInfoImpl implements _SearchTorrentInfo {
  const _$SearchTorrentInfoImpl({
    @JsonKey(fromJson: _intFromJson) this.site,
    this.site_name,
    this.site_cookie,
    this.site_ua,
    @JsonKey(fromJson: _boolFromJson) this.site_proxy,
    @JsonKey(fromJson: _intFromJson) this.site_order,
    this.site_downloader,
    this.title,
    this.description,
    this.imdbid,
    this.enclosure,
    this.page_url,
    @JsonKey(fromJson: _doubleFromJson) this.size,
    @JsonKey(fromJson: _intFromJson) this.seeders,
    @JsonKey(fromJson: _intFromJson) this.peers,
    @JsonKey(fromJson: _intFromJson) this.grabs,
    this.pubdate,
    this.date_elapsed,
    this.freedate,
    @JsonKey(fromJson: _doubleFromJson) this.uploadvolumefactor,
    @JsonKey(fromJson: _doubleFromJson) this.downloadvolumefactor,
    @JsonKey(fromJson: _boolFromJson) this.hit_and_run,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    final List<String>? labels,
    @JsonKey(fromJson: _intFromJson) this.pri_order,
    this.volume_factor,
    this.freedate_diff,
  }) : _labels = labels;

  factory _$SearchTorrentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTorrentInfoImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? site;
  @override
  final String? site_name;
  @override
  final String? site_cookie;
  @override
  final String? site_ua;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool? site_proxy;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? site_order;
  @override
  final String? site_downloader;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? imdbid;
  @override
  final String? enclosure;
  @override
  final String? page_url;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? size;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? seeders;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? peers;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? grabs;
  @override
  final String? pubdate;
  @override
  final String? date_elapsed;
  @override
  final String? freedate;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? uploadvolumefactor;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? downloadvolumefactor;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool? hit_and_run;
  final List<String>? _labels;
  @override
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? pri_order;
  @override
  final String? volume_factor;
  @override
  final String? freedate_diff;

  @override
  String toString() {
    return 'SearchTorrentInfo(site: $site, site_name: $site_name, site_cookie: $site_cookie, site_ua: $site_ua, site_proxy: $site_proxy, site_order: $site_order, site_downloader: $site_downloader, title: $title, description: $description, imdbid: $imdbid, enclosure: $enclosure, page_url: $page_url, size: $size, seeders: $seeders, peers: $peers, grabs: $grabs, pubdate: $pubdate, date_elapsed: $date_elapsed, freedate: $freedate, uploadvolumefactor: $uploadvolumefactor, downloadvolumefactor: $downloadvolumefactor, hit_and_run: $hit_and_run, labels: $labels, pri_order: $pri_order, volume_factor: $volume_factor, freedate_diff: $freedate_diff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTorrentInfoImpl &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.site_name, site_name) ||
                other.site_name == site_name) &&
            (identical(other.site_cookie, site_cookie) ||
                other.site_cookie == site_cookie) &&
            (identical(other.site_ua, site_ua) || other.site_ua == site_ua) &&
            (identical(other.site_proxy, site_proxy) ||
                other.site_proxy == site_proxy) &&
            (identical(other.site_order, site_order) ||
                other.site_order == site_order) &&
            (identical(other.site_downloader, site_downloader) ||
                other.site_downloader == site_downloader) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imdbid, imdbid) || other.imdbid == imdbid) &&
            (identical(other.enclosure, enclosure) ||
                other.enclosure == enclosure) &&
            (identical(other.page_url, page_url) ||
                other.page_url == page_url) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.seeders, seeders) || other.seeders == seeders) &&
            (identical(other.peers, peers) || other.peers == peers) &&
            (identical(other.grabs, grabs) || other.grabs == grabs) &&
            (identical(other.pubdate, pubdate) || other.pubdate == pubdate) &&
            (identical(other.date_elapsed, date_elapsed) ||
                other.date_elapsed == date_elapsed) &&
            (identical(other.freedate, freedate) ||
                other.freedate == freedate) &&
            (identical(other.uploadvolumefactor, uploadvolumefactor) ||
                other.uploadvolumefactor == uploadvolumefactor) &&
            (identical(other.downloadvolumefactor, downloadvolumefactor) ||
                other.downloadvolumefactor == downloadvolumefactor) &&
            (identical(other.hit_and_run, hit_and_run) ||
                other.hit_and_run == hit_and_run) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.pri_order, pri_order) ||
                other.pri_order == pri_order) &&
            (identical(other.volume_factor, volume_factor) ||
                other.volume_factor == volume_factor) &&
            (identical(other.freedate_diff, freedate_diff) ||
                other.freedate_diff == freedate_diff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    site,
    site_name,
    site_cookie,
    site_ua,
    site_proxy,
    site_order,
    site_downloader,
    title,
    description,
    imdbid,
    enclosure,
    page_url,
    size,
    seeders,
    peers,
    grabs,
    pubdate,
    date_elapsed,
    freedate,
    uploadvolumefactor,
    downloadvolumefactor,
    hit_and_run,
    const DeepCollectionEquality().hash(_labels),
    pri_order,
    volume_factor,
    freedate_diff,
  ]);

  /// Create a copy of SearchTorrentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTorrentInfoImplCopyWith<_$SearchTorrentInfoImpl> get copyWith =>
      __$$SearchTorrentInfoImplCopyWithImpl<_$SearchTorrentInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTorrentInfoImplToJson(this);
  }
}

abstract class _SearchTorrentInfo implements SearchTorrentInfo {
  const factory _SearchTorrentInfo({
    @JsonKey(fromJson: _intFromJson) final int? site,
    final String? site_name,
    final String? site_cookie,
    final String? site_ua,
    @JsonKey(fromJson: _boolFromJson) final bool? site_proxy,
    @JsonKey(fromJson: _intFromJson) final int? site_order,
    final String? site_downloader,
    final String? title,
    final String? description,
    final String? imdbid,
    final String? enclosure,
    final String? page_url,
    @JsonKey(fromJson: _doubleFromJson) final double? size,
    @JsonKey(fromJson: _intFromJson) final int? seeders,
    @JsonKey(fromJson: _intFromJson) final int? peers,
    @JsonKey(fromJson: _intFromJson) final int? grabs,
    final String? pubdate,
    final String? date_elapsed,
    final String? freedate,
    @JsonKey(fromJson: _doubleFromJson) final double? uploadvolumefactor,
    @JsonKey(fromJson: _doubleFromJson) final double? downloadvolumefactor,
    @JsonKey(fromJson: _boolFromJson) final bool? hit_and_run,
    @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
    final List<String>? labels,
    @JsonKey(fromJson: _intFromJson) final int? pri_order,
    final String? volume_factor,
    final String? freedate_diff,
  }) = _$SearchTorrentInfoImpl;

  factory _SearchTorrentInfo.fromJson(Map<String, dynamic> json) =
      _$SearchTorrentInfoImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get site;
  @override
  String? get site_name;
  @override
  String? get site_cookie;
  @override
  String? get site_ua;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool? get site_proxy;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get site_order;
  @override
  String? get site_downloader;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get imdbid;
  @override
  String? get enclosure;
  @override
  String? get page_url;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get size;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get seeders;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get peers;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get grabs;
  @override
  String? get pubdate;
  @override
  String? get date_elapsed;
  @override
  String? get freedate;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get uploadvolumefactor;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get downloadvolumefactor;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool? get hit_and_run;
  @override
  @JsonKey(fromJson: _stringListFromJson, toJson: _stringListToJson)
  List<String>? get labels;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get pri_order;
  @override
  String? get volume_factor;
  @override
  String? get freedate_diff;

  /// Create a copy of SearchTorrentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTorrentInfoImplCopyWith<_$SearchTorrentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
