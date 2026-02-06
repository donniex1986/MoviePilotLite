// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscribeItem _$SubscribeItemFromJson(Map<String, dynamic> json) {
  return _SubscribeItem.fromJson(json);
}

/// @nodoc
mixin _$SubscribeItem {
  @JsonKey(fromJson: _intFromJson)
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid => throw _privateConstructorUsedError;
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  int? get doubanid => throw _privateConstructorUsedError;
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  int? get bangumiid => throw _privateConstructorUsedError;
  String? get mediaid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get season => throw _privateConstructorUsedError;
  String? get poster => throw _privateConstructorUsedError;
  String? get backdrop => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get filter => throw _privateConstructorUsedError;
  String? get include => throw _privateConstructorUsedError;
  String? get exclude => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  String? get effect => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  int? get totalEpisode => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_episode', fromJson: _intFromJson)
  int? get startEpisode => throw _privateConstructorUsedError;
  @JsonKey(name: 'lack_episode', fromJson: _intFromJson)
  int? get lackEpisode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get note => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_update')
  String? get lastUpdate => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get sites => throw _privateConstructorUsedError;
  String? get downloader => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_version', fromJson: _intFromJson)
  int? get bestVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_priority')
  int? get currentPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'save_path')
  String? get savePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'search_imdbid', fromJson: _intFromJson)
  int? get searchImdbid => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_words')
  String? get customWords => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_category')
  String? get mediaCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'filter_groups')
  dynamic get filterGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_group')
  dynamic get episodeGroup => throw _privateConstructorUsedError;

  /// 热门订阅专用：订阅人数
  @JsonKey(name: 'count', fromJson: _intFromJson)
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this SubscribeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeItemCopyWith<SubscribeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeItemCopyWith<$Res> {
  factory $SubscribeItemCopyWith(
    SubscribeItem value,
    $Res Function(SubscribeItem) then,
  ) = _$SubscribeItemCopyWithImpl<$Res, SubscribeItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) int? bangumiid,
    String? mediaid,
    @JsonKey(fromJson: _intFromJson) int? season,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    String? filter,
    String? include,
    String? exclude,
    String? quality,
    String? resolution,
    String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    @JsonKey(name: 'start_episode', fromJson: _intFromJson) int? startEpisode,
    @JsonKey(name: 'lack_episode', fromJson: _intFromJson) int? lackEpisode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? note,
    String? state,
    @JsonKey(name: 'last_update') String? lastUpdate,
    String? username,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? sites,
    String? downloader,
    @JsonKey(name: 'best_version', fromJson: _intFromJson) int? bestVersion,
    @JsonKey(name: 'current_priority') int? currentPriority,
    @JsonKey(name: 'save_path') String? savePath,
    @JsonKey(name: 'search_imdbid', fromJson: _intFromJson) int? searchImdbid,
    String? date,
    @JsonKey(name: 'custom_words') String? customWords,
    @JsonKey(name: 'media_category') String? mediaCategory,
    @JsonKey(name: 'filter_groups') dynamic filterGroups,
    @JsonKey(name: 'episode_group') dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) int? count,
  });
}

/// @nodoc
class _$SubscribeItemCopyWithImpl<$Res, $Val extends SubscribeItem>
    implements $SubscribeItemCopyWith<$Res> {
  _$SubscribeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? type = freezed,
    Object? keyword = freezed,
    Object? tmdbid = freezed,
    Object? doubanid = freezed,
    Object? bangumiid = freezed,
    Object? mediaid = freezed,
    Object? season = freezed,
    Object? poster = freezed,
    Object? backdrop = freezed,
    Object? vote = freezed,
    Object? description = freezed,
    Object? filter = freezed,
    Object? include = freezed,
    Object? exclude = freezed,
    Object? quality = freezed,
    Object? resolution = freezed,
    Object? effect = freezed,
    Object? totalEpisode = freezed,
    Object? startEpisode = freezed,
    Object? lackEpisode = freezed,
    Object? note = freezed,
    Object? state = freezed,
    Object? lastUpdate = freezed,
    Object? username = freezed,
    Object? sites = freezed,
    Object? downloader = freezed,
    Object? bestVersion = freezed,
    Object? currentPriority = freezed,
    Object? savePath = freezed,
    Object? searchImdbid = freezed,
    Object? date = freezed,
    Object? customWords = freezed,
    Object? mediaCategory = freezed,
    Object? filterGroups = freezed,
    Object? episodeGroup = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            keyword: freezed == keyword
                ? _value.keyword
                : keyword // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbid: freezed == tmdbid
                ? _value.tmdbid
                : tmdbid // ignore: cast_nullable_to_non_nullable
                      as int?,
            doubanid: freezed == doubanid
                ? _value.doubanid
                : doubanid // ignore: cast_nullable_to_non_nullable
                      as int?,
            bangumiid: freezed == bangumiid
                ? _value.bangumiid
                : bangumiid // ignore: cast_nullable_to_non_nullable
                      as int?,
            mediaid: freezed == mediaid
                ? _value.mediaid
                : mediaid // ignore: cast_nullable_to_non_nullable
                      as String?,
            season: freezed == season
                ? _value.season
                : season // ignore: cast_nullable_to_non_nullable
                      as int?,
            poster: freezed == poster
                ? _value.poster
                : poster // ignore: cast_nullable_to_non_nullable
                      as String?,
            backdrop: freezed == backdrop
                ? _value.backdrop
                : backdrop // ignore: cast_nullable_to_non_nullable
                      as String?,
            vote: freezed == vote
                ? _value.vote
                : vote // ignore: cast_nullable_to_non_nullable
                      as double?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            filter: freezed == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as String?,
            include: freezed == include
                ? _value.include
                : include // ignore: cast_nullable_to_non_nullable
                      as String?,
            exclude: freezed == exclude
                ? _value.exclude
                : exclude // ignore: cast_nullable_to_non_nullable
                      as String?,
            quality: freezed == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                      as String?,
            resolution: freezed == resolution
                ? _value.resolution
                : resolution // ignore: cast_nullable_to_non_nullable
                      as String?,
            effect: freezed == effect
                ? _value.effect
                : effect // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalEpisode: freezed == totalEpisode
                ? _value.totalEpisode
                : totalEpisode // ignore: cast_nullable_to_non_nullable
                      as int?,
            startEpisode: freezed == startEpisode
                ? _value.startEpisode
                : startEpisode // ignore: cast_nullable_to_non_nullable
                      as int?,
            lackEpisode: freezed == lackEpisode
                ? _value.lackEpisode
                : lackEpisode // ignore: cast_nullable_to_non_nullable
                      as int?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastUpdate: freezed == lastUpdate
                ? _value.lastUpdate
                : lastUpdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            sites: freezed == sites
                ? _value.sites
                : sites // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            downloader: freezed == downloader
                ? _value.downloader
                : downloader // ignore: cast_nullable_to_non_nullable
                      as String?,
            bestVersion: freezed == bestVersion
                ? _value.bestVersion
                : bestVersion // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPriority: freezed == currentPriority
                ? _value.currentPriority
                : currentPriority // ignore: cast_nullable_to_non_nullable
                      as int?,
            savePath: freezed == savePath
                ? _value.savePath
                : savePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            searchImdbid: freezed == searchImdbid
                ? _value.searchImdbid
                : searchImdbid // ignore: cast_nullable_to_non_nullable
                      as int?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            customWords: freezed == customWords
                ? _value.customWords
                : customWords // ignore: cast_nullable_to_non_nullable
                      as String?,
            mediaCategory: freezed == mediaCategory
                ? _value.mediaCategory
                : mediaCategory // ignore: cast_nullable_to_non_nullable
                      as String?,
            filterGroups: freezed == filterGroups
                ? _value.filterGroups
                : filterGroups // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            episodeGroup: freezed == episodeGroup
                ? _value.episodeGroup
                : episodeGroup // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            count: freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscribeItemImplCopyWith<$Res>
    implements $SubscribeItemCopyWith<$Res> {
  factory _$$SubscribeItemImplCopyWith(
    _$SubscribeItemImpl value,
    $Res Function(_$SubscribeItemImpl) then,
  ) = __$$SubscribeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) int? bangumiid,
    String? mediaid,
    @JsonKey(fromJson: _intFromJson) int? season,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    String? filter,
    String? include,
    String? exclude,
    String? quality,
    String? resolution,
    String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    @JsonKey(name: 'start_episode', fromJson: _intFromJson) int? startEpisode,
    @JsonKey(name: 'lack_episode', fromJson: _intFromJson) int? lackEpisode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? note,
    String? state,
    @JsonKey(name: 'last_update') String? lastUpdate,
    String? username,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? sites,
    String? downloader,
    @JsonKey(name: 'best_version', fromJson: _intFromJson) int? bestVersion,
    @JsonKey(name: 'current_priority') int? currentPriority,
    @JsonKey(name: 'save_path') String? savePath,
    @JsonKey(name: 'search_imdbid', fromJson: _intFromJson) int? searchImdbid,
    String? date,
    @JsonKey(name: 'custom_words') String? customWords,
    @JsonKey(name: 'media_category') String? mediaCategory,
    @JsonKey(name: 'filter_groups') dynamic filterGroups,
    @JsonKey(name: 'episode_group') dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) int? count,
  });
}

/// @nodoc
class __$$SubscribeItemImplCopyWithImpl<$Res>
    extends _$SubscribeItemCopyWithImpl<$Res, _$SubscribeItemImpl>
    implements _$$SubscribeItemImplCopyWith<$Res> {
  __$$SubscribeItemImplCopyWithImpl(
    _$SubscribeItemImpl _value,
    $Res Function(_$SubscribeItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? type = freezed,
    Object? keyword = freezed,
    Object? tmdbid = freezed,
    Object? doubanid = freezed,
    Object? bangumiid = freezed,
    Object? mediaid = freezed,
    Object? season = freezed,
    Object? poster = freezed,
    Object? backdrop = freezed,
    Object? vote = freezed,
    Object? description = freezed,
    Object? filter = freezed,
    Object? include = freezed,
    Object? exclude = freezed,
    Object? quality = freezed,
    Object? resolution = freezed,
    Object? effect = freezed,
    Object? totalEpisode = freezed,
    Object? startEpisode = freezed,
    Object? lackEpisode = freezed,
    Object? note = freezed,
    Object? state = freezed,
    Object? lastUpdate = freezed,
    Object? username = freezed,
    Object? sites = freezed,
    Object? downloader = freezed,
    Object? bestVersion = freezed,
    Object? currentPriority = freezed,
    Object? savePath = freezed,
    Object? searchImdbid = freezed,
    Object? date = freezed,
    Object? customWords = freezed,
    Object? mediaCategory = freezed,
    Object? filterGroups = freezed,
    Object? episodeGroup = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _$SubscribeItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        keyword: freezed == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbid: freezed == tmdbid
            ? _value.tmdbid
            : tmdbid // ignore: cast_nullable_to_non_nullable
                  as int?,
        doubanid: freezed == doubanid
            ? _value.doubanid
            : doubanid // ignore: cast_nullable_to_non_nullable
                  as int?,
        bangumiid: freezed == bangumiid
            ? _value.bangumiid
            : bangumiid // ignore: cast_nullable_to_non_nullable
                  as int?,
        mediaid: freezed == mediaid
            ? _value.mediaid
            : mediaid // ignore: cast_nullable_to_non_nullable
                  as String?,
        season: freezed == season
            ? _value.season
            : season // ignore: cast_nullable_to_non_nullable
                  as int?,
        poster: freezed == poster
            ? _value.poster
            : poster // ignore: cast_nullable_to_non_nullable
                  as String?,
        backdrop: freezed == backdrop
            ? _value.backdrop
            : backdrop // ignore: cast_nullable_to_non_nullable
                  as String?,
        vote: freezed == vote
            ? _value.vote
            : vote // ignore: cast_nullable_to_non_nullable
                  as double?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        filter: freezed == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as String?,
        include: freezed == include
            ? _value.include
            : include // ignore: cast_nullable_to_non_nullable
                  as String?,
        exclude: freezed == exclude
            ? _value.exclude
            : exclude // ignore: cast_nullable_to_non_nullable
                  as String?,
        quality: freezed == quality
            ? _value.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String?,
        resolution: freezed == resolution
            ? _value.resolution
            : resolution // ignore: cast_nullable_to_non_nullable
                  as String?,
        effect: freezed == effect
            ? _value.effect
            : effect // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalEpisode: freezed == totalEpisode
            ? _value.totalEpisode
            : totalEpisode // ignore: cast_nullable_to_non_nullable
                  as int?,
        startEpisode: freezed == startEpisode
            ? _value.startEpisode
            : startEpisode // ignore: cast_nullable_to_non_nullable
                  as int?,
        lackEpisode: freezed == lackEpisode
            ? _value.lackEpisode
            : lackEpisode // ignore: cast_nullable_to_non_nullable
                  as int?,
        note: freezed == note
            ? _value._note
            : note // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastUpdate: freezed == lastUpdate
            ? _value.lastUpdate
            : lastUpdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        sites: freezed == sites
            ? _value._sites
            : sites // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        downloader: freezed == downloader
            ? _value.downloader
            : downloader // ignore: cast_nullable_to_non_nullable
                  as String?,
        bestVersion: freezed == bestVersion
            ? _value.bestVersion
            : bestVersion // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPriority: freezed == currentPriority
            ? _value.currentPriority
            : currentPriority // ignore: cast_nullable_to_non_nullable
                  as int?,
        savePath: freezed == savePath
            ? _value.savePath
            : savePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        searchImdbid: freezed == searchImdbid
            ? _value.searchImdbid
            : searchImdbid // ignore: cast_nullable_to_non_nullable
                  as int?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        customWords: freezed == customWords
            ? _value.customWords
            : customWords // ignore: cast_nullable_to_non_nullable
                  as String?,
        mediaCategory: freezed == mediaCategory
            ? _value.mediaCategory
            : mediaCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        filterGroups: freezed == filterGroups
            ? _value.filterGroups
            : filterGroups // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        episodeGroup: freezed == episodeGroup
            ? _value.episodeGroup
            : episodeGroup // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        count: freezed == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeItemImpl implements _SubscribeItem {
  const _$SubscribeItemImpl({
    @JsonKey(fromJson: _intFromJson) this.id,
    this.name,
    this.year,
    this.type,
    this.keyword,
    @JsonKey(fromJson: _intFromJson) this.tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) this.doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) this.bangumiid,
    this.mediaid,
    @JsonKey(fromJson: _intFromJson) this.season,
    this.poster,
    this.backdrop,
    @JsonKey(fromJson: _doubleFromJson) this.vote,
    this.description,
    this.filter,
    this.include,
    this.exclude,
    this.quality,
    this.resolution,
    this.effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) this.totalEpisode,
    @JsonKey(name: 'start_episode', fromJson: _intFromJson) this.startEpisode,
    @JsonKey(name: 'lack_episode', fromJson: _intFromJson) this.lackEpisode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? note,
    this.state,
    @JsonKey(name: 'last_update') this.lastUpdate,
    this.username,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? sites,
    this.downloader,
    @JsonKey(name: 'best_version', fromJson: _intFromJson) this.bestVersion,
    @JsonKey(name: 'current_priority') this.currentPriority,
    @JsonKey(name: 'save_path') this.savePath,
    @JsonKey(name: 'search_imdbid', fromJson: _intFromJson) this.searchImdbid,
    this.date,
    @JsonKey(name: 'custom_words') this.customWords,
    @JsonKey(name: 'media_category') this.mediaCategory,
    @JsonKey(name: 'filter_groups') this.filterGroups,
    @JsonKey(name: 'episode_group') this.episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) this.count,
  }) : _note = note,
       _sites = sites;

  factory _$SubscribeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? id;
  @override
  final String? name;
  @override
  final String? year;
  @override
  final String? type;
  @override
  final String? keyword;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? tmdbid;
  @override
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  final int? doubanid;
  @override
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  final int? bangumiid;
  @override
  final String? mediaid;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? season;
  @override
  final String? poster;
  @override
  final String? backdrop;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? vote;
  @override
  final String? description;
  @override
  final String? filter;
  @override
  final String? include;
  @override
  final String? exclude;
  @override
  final String? quality;
  @override
  final String? resolution;
  @override
  final String? effect;
  @override
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  final int? totalEpisode;
  @override
  @JsonKey(name: 'start_episode', fromJson: _intFromJson)
  final int? startEpisode;
  @override
  @JsonKey(name: 'lack_episode', fromJson: _intFromJson)
  final int? lackEpisode;
  final List<int>? _note;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get note {
    final value = _note;
    if (value == null) return null;
    if (_note is EqualUnmodifiableListView) return _note;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? state;
  @override
  @JsonKey(name: 'last_update')
  final String? lastUpdate;
  @override
  final String? username;
  final List<int>? _sites;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get sites {
    final value = _sites;
    if (value == null) return null;
    if (_sites is EqualUnmodifiableListView) return _sites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? downloader;
  @override
  @JsonKey(name: 'best_version', fromJson: _intFromJson)
  final int? bestVersion;
  @override
  @JsonKey(name: 'current_priority')
  final int? currentPriority;
  @override
  @JsonKey(name: 'save_path')
  final String? savePath;
  @override
  @JsonKey(name: 'search_imdbid', fromJson: _intFromJson)
  final int? searchImdbid;
  @override
  final String? date;
  @override
  @JsonKey(name: 'custom_words')
  final String? customWords;
  @override
  @JsonKey(name: 'media_category')
  final String? mediaCategory;
  @override
  @JsonKey(name: 'filter_groups')
  final dynamic filterGroups;
  @override
  @JsonKey(name: 'episode_group')
  final dynamic episodeGroup;

  /// 热门订阅专用：订阅人数
  @override
  @JsonKey(name: 'count', fromJson: _intFromJson)
  final int? count;

  @override
  String toString() {
    return 'SubscribeItem(id: $id, name: $name, year: $year, type: $type, keyword: $keyword, tmdbid: $tmdbid, doubanid: $doubanid, bangumiid: $bangumiid, mediaid: $mediaid, season: $season, poster: $poster, backdrop: $backdrop, vote: $vote, description: $description, filter: $filter, include: $include, exclude: $exclude, quality: $quality, resolution: $resolution, effect: $effect, totalEpisode: $totalEpisode, startEpisode: $startEpisode, lackEpisode: $lackEpisode, note: $note, state: $state, lastUpdate: $lastUpdate, username: $username, sites: $sites, downloader: $downloader, bestVersion: $bestVersion, currentPriority: $currentPriority, savePath: $savePath, searchImdbid: $searchImdbid, date: $date, customWords: $customWords, mediaCategory: $mediaCategory, filterGroups: $filterGroups, episodeGroup: $episodeGroup, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.tmdbid, tmdbid) || other.tmdbid == tmdbid) &&
            (identical(other.doubanid, doubanid) ||
                other.doubanid == doubanid) &&
            (identical(other.bangumiid, bangumiid) ||
                other.bangumiid == bangumiid) &&
            (identical(other.mediaid, mediaid) || other.mediaid == mediaid) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.backdrop, backdrop) ||
                other.backdrop == backdrop) &&
            (identical(other.vote, vote) || other.vote == vote) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.include, include) || other.include == include) &&
            (identical(other.exclude, exclude) || other.exclude == exclude) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.totalEpisode, totalEpisode) ||
                other.totalEpisode == totalEpisode) &&
            (identical(other.startEpisode, startEpisode) ||
                other.startEpisode == startEpisode) &&
            (identical(other.lackEpisode, lackEpisode) ||
                other.lackEpisode == lackEpisode) &&
            const DeepCollectionEquality().equals(other._note, _note) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._sites, _sites) &&
            (identical(other.downloader, downloader) ||
                other.downloader == downloader) &&
            (identical(other.bestVersion, bestVersion) ||
                other.bestVersion == bestVersion) &&
            (identical(other.currentPriority, currentPriority) ||
                other.currentPriority == currentPriority) &&
            (identical(other.savePath, savePath) ||
                other.savePath == savePath) &&
            (identical(other.searchImdbid, searchImdbid) ||
                other.searchImdbid == searchImdbid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.customWords, customWords) ||
                other.customWords == customWords) &&
            (identical(other.mediaCategory, mediaCategory) ||
                other.mediaCategory == mediaCategory) &&
            const DeepCollectionEquality().equals(
              other.filterGroups,
              filterGroups,
            ) &&
            const DeepCollectionEquality().equals(
              other.episodeGroup,
              episodeGroup,
            ) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    year,
    type,
    keyword,
    tmdbid,
    doubanid,
    bangumiid,
    mediaid,
    season,
    poster,
    backdrop,
    vote,
    description,
    filter,
    include,
    exclude,
    quality,
    resolution,
    effect,
    totalEpisode,
    startEpisode,
    lackEpisode,
    const DeepCollectionEquality().hash(_note),
    state,
    lastUpdate,
    username,
    const DeepCollectionEquality().hash(_sites),
    downloader,
    bestVersion,
    currentPriority,
    savePath,
    searchImdbid,
    date,
    customWords,
    mediaCategory,
    const DeepCollectionEquality().hash(filterGroups),
    const DeepCollectionEquality().hash(episodeGroup),
    count,
  ]);

  /// Create a copy of SubscribeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeItemImplCopyWith<_$SubscribeItemImpl> get copyWith =>
      __$$SubscribeItemImplCopyWithImpl<_$SubscribeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeItemImplToJson(this);
  }
}

abstract class _SubscribeItem implements SubscribeItem {
  const factory _SubscribeItem({
    @JsonKey(fromJson: _intFromJson) final int? id,
    final String? name,
    final String? year,
    final String? type,
    final String? keyword,
    @JsonKey(fromJson: _intFromJson) final int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) final int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) final int? bangumiid,
    final String? mediaid,
    @JsonKey(fromJson: _intFromJson) final int? season,
    final String? poster,
    final String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) final double? vote,
    final String? description,
    final String? filter,
    final String? include,
    final String? exclude,
    final String? quality,
    final String? resolution,
    final String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson)
    final int? totalEpisode,
    @JsonKey(name: 'start_episode', fromJson: _intFromJson)
    final int? startEpisode,
    @JsonKey(name: 'lack_episode', fromJson: _intFromJson)
    final int? lackEpisode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? note,
    final String? state,
    @JsonKey(name: 'last_update') final String? lastUpdate,
    final String? username,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    final List<int>? sites,
    final String? downloader,
    @JsonKey(name: 'best_version', fromJson: _intFromJson)
    final int? bestVersion,
    @JsonKey(name: 'current_priority') final int? currentPriority,
    @JsonKey(name: 'save_path') final String? savePath,
    @JsonKey(name: 'search_imdbid', fromJson: _intFromJson)
    final int? searchImdbid,
    final String? date,
    @JsonKey(name: 'custom_words') final String? customWords,
    @JsonKey(name: 'media_category') final String? mediaCategory,
    @JsonKey(name: 'filter_groups') final dynamic filterGroups,
    @JsonKey(name: 'episode_group') final dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) final int? count,
  }) = _$SubscribeItemImpl;

  factory _SubscribeItem.fromJson(Map<String, dynamic> json) =
      _$SubscribeItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get id;
  @override
  String? get name;
  @override
  String? get year;
  @override
  String? get type;
  @override
  String? get keyword;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid;
  @override
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  int? get doubanid;
  @override
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  int? get bangumiid;
  @override
  String? get mediaid;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get season;
  @override
  String? get poster;
  @override
  String? get backdrop;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote;
  @override
  String? get description;
  @override
  String? get filter;
  @override
  String? get include;
  @override
  String? get exclude;
  @override
  String? get quality;
  @override
  String? get resolution;
  @override
  String? get effect;
  @override
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  int? get totalEpisode;
  @override
  @JsonKey(name: 'start_episode', fromJson: _intFromJson)
  int? get startEpisode;
  @override
  @JsonKey(name: 'lack_episode', fromJson: _intFromJson)
  int? get lackEpisode;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get note;
  @override
  String? get state;
  @override
  @JsonKey(name: 'last_update')
  String? get lastUpdate;
  @override
  String? get username;
  @override
  @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
  List<int>? get sites;
  @override
  String? get downloader;
  @override
  @JsonKey(name: 'best_version', fromJson: _intFromJson)
  int? get bestVersion;
  @override
  @JsonKey(name: 'current_priority')
  int? get currentPriority;
  @override
  @JsonKey(name: 'save_path')
  String? get savePath;
  @override
  @JsonKey(name: 'search_imdbid', fromJson: _intFromJson)
  int? get searchImdbid;
  @override
  String? get date;
  @override
  @JsonKey(name: 'custom_words')
  String? get customWords;
  @override
  @JsonKey(name: 'media_category')
  String? get mediaCategory;
  @override
  @JsonKey(name: 'filter_groups')
  dynamic get filterGroups;
  @override
  @JsonKey(name: 'episode_group')
  dynamic get episodeGroup;

  /// 热门订阅专用：订阅人数
  @override
  @JsonKey(name: 'count', fromJson: _intFromJson)
  int? get count;

  /// Create a copy of SubscribeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeItemImplCopyWith<_$SubscribeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscribeShareItem _$SubscribeShareItemFromJson(Map<String, dynamic> json) {
  return _SubscribeShareItem.fromJson(json);
}

/// @nodoc
mixin _$SubscribeShareItem {
  @JsonKey(fromJson: _intFromJson)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscribe_id', fromJson: _intFromJson)
  int? get subscribeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_title')
  String? get shareTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_comment')
  String? get shareComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_user')
  String? get shareUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_uid')
  String? get shareUid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid => throw _privateConstructorUsedError;
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  int? get doubanid => throw _privateConstructorUsedError;
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  int? get bangumiid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get season => throw _privateConstructorUsedError;
  String? get poster => throw _privateConstructorUsedError;
  String? get backdrop => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get include => throw _privateConstructorUsedError;
  String? get exclude => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  String? get effect => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  int? get totalEpisode => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_words')
  String? get customWords => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_category')
  String? get mediaCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_group')
  dynamic get episodeGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'count', fromJson: _intFromJson)
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this SubscribeShareItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeShareItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeShareItemCopyWith<SubscribeShareItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeShareItemCopyWith<$Res> {
  factory $SubscribeShareItemCopyWith(
    SubscribeShareItem value,
    $Res Function(SubscribeShareItem) then,
  ) = _$SubscribeShareItemCopyWithImpl<$Res, SubscribeShareItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    @JsonKey(name: 'subscribe_id', fromJson: _intFromJson) int? subscribeId,
    @JsonKey(name: 'share_title') String? shareTitle,
    @JsonKey(name: 'share_comment') String? shareComment,
    @JsonKey(name: 'share_user') String? shareUser,
    @JsonKey(name: 'share_uid') String? shareUid,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) int? bangumiid,
    @JsonKey(fromJson: _intFromJson) int? season,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    String? include,
    String? exclude,
    String? quality,
    String? resolution,
    String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    String? date,
    @JsonKey(name: 'custom_words') String? customWords,
    @JsonKey(name: 'media_category') String? mediaCategory,
    @JsonKey(name: 'episode_group') dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) int? count,
  });
}

/// @nodoc
class _$SubscribeShareItemCopyWithImpl<$Res, $Val extends SubscribeShareItem>
    implements $SubscribeShareItemCopyWith<$Res> {
  _$SubscribeShareItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeShareItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subscribeId = freezed,
    Object? shareTitle = freezed,
    Object? shareComment = freezed,
    Object? shareUser = freezed,
    Object? shareUid = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? type = freezed,
    Object? keyword = freezed,
    Object? tmdbid = freezed,
    Object? doubanid = freezed,
    Object? bangumiid = freezed,
    Object? season = freezed,
    Object? poster = freezed,
    Object? backdrop = freezed,
    Object? vote = freezed,
    Object? description = freezed,
    Object? include = freezed,
    Object? exclude = freezed,
    Object? quality = freezed,
    Object? resolution = freezed,
    Object? effect = freezed,
    Object? totalEpisode = freezed,
    Object? date = freezed,
    Object? customWords = freezed,
    Object? mediaCategory = freezed,
    Object? episodeGroup = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            subscribeId: freezed == subscribeId
                ? _value.subscribeId
                : subscribeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            shareTitle: freezed == shareTitle
                ? _value.shareTitle
                : shareTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            shareComment: freezed == shareComment
                ? _value.shareComment
                : shareComment // ignore: cast_nullable_to_non_nullable
                      as String?,
            shareUser: freezed == shareUser
                ? _value.shareUser
                : shareUser // ignore: cast_nullable_to_non_nullable
                      as String?,
            shareUid: freezed == shareUid
                ? _value.shareUid
                : shareUid // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            keyword: freezed == keyword
                ? _value.keyword
                : keyword // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbid: freezed == tmdbid
                ? _value.tmdbid
                : tmdbid // ignore: cast_nullable_to_non_nullable
                      as int?,
            doubanid: freezed == doubanid
                ? _value.doubanid
                : doubanid // ignore: cast_nullable_to_non_nullable
                      as int?,
            bangumiid: freezed == bangumiid
                ? _value.bangumiid
                : bangumiid // ignore: cast_nullable_to_non_nullable
                      as int?,
            season: freezed == season
                ? _value.season
                : season // ignore: cast_nullable_to_non_nullable
                      as int?,
            poster: freezed == poster
                ? _value.poster
                : poster // ignore: cast_nullable_to_non_nullable
                      as String?,
            backdrop: freezed == backdrop
                ? _value.backdrop
                : backdrop // ignore: cast_nullable_to_non_nullable
                      as String?,
            vote: freezed == vote
                ? _value.vote
                : vote // ignore: cast_nullable_to_non_nullable
                      as double?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            include: freezed == include
                ? _value.include
                : include // ignore: cast_nullable_to_non_nullable
                      as String?,
            exclude: freezed == exclude
                ? _value.exclude
                : exclude // ignore: cast_nullable_to_non_nullable
                      as String?,
            quality: freezed == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                      as String?,
            resolution: freezed == resolution
                ? _value.resolution
                : resolution // ignore: cast_nullable_to_non_nullable
                      as String?,
            effect: freezed == effect
                ? _value.effect
                : effect // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalEpisode: freezed == totalEpisode
                ? _value.totalEpisode
                : totalEpisode // ignore: cast_nullable_to_non_nullable
                      as int?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            customWords: freezed == customWords
                ? _value.customWords
                : customWords // ignore: cast_nullable_to_non_nullable
                      as String?,
            mediaCategory: freezed == mediaCategory
                ? _value.mediaCategory
                : mediaCategory // ignore: cast_nullable_to_non_nullable
                      as String?,
            episodeGroup: freezed == episodeGroup
                ? _value.episodeGroup
                : episodeGroup // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            count: freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscribeShareItemImplCopyWith<$Res>
    implements $SubscribeShareItemCopyWith<$Res> {
  factory _$$SubscribeShareItemImplCopyWith(
    _$SubscribeShareItemImpl value,
    $Res Function(_$SubscribeShareItemImpl) then,
  ) = __$$SubscribeShareItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    @JsonKey(name: 'subscribe_id', fromJson: _intFromJson) int? subscribeId,
    @JsonKey(name: 'share_title') String? shareTitle,
    @JsonKey(name: 'share_comment') String? shareComment,
    @JsonKey(name: 'share_user') String? shareUser,
    @JsonKey(name: 'share_uid') String? shareUid,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) int? bangumiid,
    @JsonKey(fromJson: _intFromJson) int? season,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    String? include,
    String? exclude,
    String? quality,
    String? resolution,
    String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    String? date,
    @JsonKey(name: 'custom_words') String? customWords,
    @JsonKey(name: 'media_category') String? mediaCategory,
    @JsonKey(name: 'episode_group') dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) int? count,
  });
}

/// @nodoc
class __$$SubscribeShareItemImplCopyWithImpl<$Res>
    extends _$SubscribeShareItemCopyWithImpl<$Res, _$SubscribeShareItemImpl>
    implements _$$SubscribeShareItemImplCopyWith<$Res> {
  __$$SubscribeShareItemImplCopyWithImpl(
    _$SubscribeShareItemImpl _value,
    $Res Function(_$SubscribeShareItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeShareItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subscribeId = freezed,
    Object? shareTitle = freezed,
    Object? shareComment = freezed,
    Object? shareUser = freezed,
    Object? shareUid = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? type = freezed,
    Object? keyword = freezed,
    Object? tmdbid = freezed,
    Object? doubanid = freezed,
    Object? bangumiid = freezed,
    Object? season = freezed,
    Object? poster = freezed,
    Object? backdrop = freezed,
    Object? vote = freezed,
    Object? description = freezed,
    Object? include = freezed,
    Object? exclude = freezed,
    Object? quality = freezed,
    Object? resolution = freezed,
    Object? effect = freezed,
    Object? totalEpisode = freezed,
    Object? date = freezed,
    Object? customWords = freezed,
    Object? mediaCategory = freezed,
    Object? episodeGroup = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _$SubscribeShareItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscribeId: freezed == subscribeId
            ? _value.subscribeId
            : subscribeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        shareTitle: freezed == shareTitle
            ? _value.shareTitle
            : shareTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        shareComment: freezed == shareComment
            ? _value.shareComment
            : shareComment // ignore: cast_nullable_to_non_nullable
                  as String?,
        shareUser: freezed == shareUser
            ? _value.shareUser
            : shareUser // ignore: cast_nullable_to_non_nullable
                  as String?,
        shareUid: freezed == shareUid
            ? _value.shareUid
            : shareUid // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        keyword: freezed == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbid: freezed == tmdbid
            ? _value.tmdbid
            : tmdbid // ignore: cast_nullable_to_non_nullable
                  as int?,
        doubanid: freezed == doubanid
            ? _value.doubanid
            : doubanid // ignore: cast_nullable_to_non_nullable
                  as int?,
        bangumiid: freezed == bangumiid
            ? _value.bangumiid
            : bangumiid // ignore: cast_nullable_to_non_nullable
                  as int?,
        season: freezed == season
            ? _value.season
            : season // ignore: cast_nullable_to_non_nullable
                  as int?,
        poster: freezed == poster
            ? _value.poster
            : poster // ignore: cast_nullable_to_non_nullable
                  as String?,
        backdrop: freezed == backdrop
            ? _value.backdrop
            : backdrop // ignore: cast_nullable_to_non_nullable
                  as String?,
        vote: freezed == vote
            ? _value.vote
            : vote // ignore: cast_nullable_to_non_nullable
                  as double?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        include: freezed == include
            ? _value.include
            : include // ignore: cast_nullable_to_non_nullable
                  as String?,
        exclude: freezed == exclude
            ? _value.exclude
            : exclude // ignore: cast_nullable_to_non_nullable
                  as String?,
        quality: freezed == quality
            ? _value.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String?,
        resolution: freezed == resolution
            ? _value.resolution
            : resolution // ignore: cast_nullable_to_non_nullable
                  as String?,
        effect: freezed == effect
            ? _value.effect
            : effect // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalEpisode: freezed == totalEpisode
            ? _value.totalEpisode
            : totalEpisode // ignore: cast_nullable_to_non_nullable
                  as int?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        customWords: freezed == customWords
            ? _value.customWords
            : customWords // ignore: cast_nullable_to_non_nullable
                  as String?,
        mediaCategory: freezed == mediaCategory
            ? _value.mediaCategory
            : mediaCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        episodeGroup: freezed == episodeGroup
            ? _value.episodeGroup
            : episodeGroup // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        count: freezed == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeShareItemImpl implements _SubscribeShareItem {
  const _$SubscribeShareItemImpl({
    @JsonKey(fromJson: _intFromJson) this.id,
    @JsonKey(name: 'subscribe_id', fromJson: _intFromJson) this.subscribeId,
    @JsonKey(name: 'share_title') this.shareTitle,
    @JsonKey(name: 'share_comment') this.shareComment,
    @JsonKey(name: 'share_user') this.shareUser,
    @JsonKey(name: 'share_uid') this.shareUid,
    this.name,
    this.year,
    this.type,
    this.keyword,
    @JsonKey(fromJson: _intFromJson) this.tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) this.doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) this.bangumiid,
    @JsonKey(fromJson: _intFromJson) this.season,
    this.poster,
    this.backdrop,
    @JsonKey(fromJson: _doubleFromJson) this.vote,
    this.description,
    this.include,
    this.exclude,
    this.quality,
    this.resolution,
    this.effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) this.totalEpisode,
    this.date,
    @JsonKey(name: 'custom_words') this.customWords,
    @JsonKey(name: 'media_category') this.mediaCategory,
    @JsonKey(name: 'episode_group') this.episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) this.count,
  });

  factory _$SubscribeShareItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeShareItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? id;
  @override
  @JsonKey(name: 'subscribe_id', fromJson: _intFromJson)
  final int? subscribeId;
  @override
  @JsonKey(name: 'share_title')
  final String? shareTitle;
  @override
  @JsonKey(name: 'share_comment')
  final String? shareComment;
  @override
  @JsonKey(name: 'share_user')
  final String? shareUser;
  @override
  @JsonKey(name: 'share_uid')
  final String? shareUid;
  @override
  final String? name;
  @override
  final String? year;
  @override
  final String? type;
  @override
  final String? keyword;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? tmdbid;
  @override
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  final int? doubanid;
  @override
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  final int? bangumiid;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? season;
  @override
  final String? poster;
  @override
  final String? backdrop;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? vote;
  @override
  final String? description;
  @override
  final String? include;
  @override
  final String? exclude;
  @override
  final String? quality;
  @override
  final String? resolution;
  @override
  final String? effect;
  @override
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  final int? totalEpisode;
  @override
  final String? date;
  @override
  @JsonKey(name: 'custom_words')
  final String? customWords;
  @override
  @JsonKey(name: 'media_category')
  final String? mediaCategory;
  @override
  @JsonKey(name: 'episode_group')
  final dynamic episodeGroup;
  @override
  @JsonKey(name: 'count', fromJson: _intFromJson)
  final int? count;

  @override
  String toString() {
    return 'SubscribeShareItem(id: $id, subscribeId: $subscribeId, shareTitle: $shareTitle, shareComment: $shareComment, shareUser: $shareUser, shareUid: $shareUid, name: $name, year: $year, type: $type, keyword: $keyword, tmdbid: $tmdbid, doubanid: $doubanid, bangumiid: $bangumiid, season: $season, poster: $poster, backdrop: $backdrop, vote: $vote, description: $description, include: $include, exclude: $exclude, quality: $quality, resolution: $resolution, effect: $effect, totalEpisode: $totalEpisode, date: $date, customWords: $customWords, mediaCategory: $mediaCategory, episodeGroup: $episodeGroup, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeShareItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscribeId, subscribeId) ||
                other.subscribeId == subscribeId) &&
            (identical(other.shareTitle, shareTitle) ||
                other.shareTitle == shareTitle) &&
            (identical(other.shareComment, shareComment) ||
                other.shareComment == shareComment) &&
            (identical(other.shareUser, shareUser) ||
                other.shareUser == shareUser) &&
            (identical(other.shareUid, shareUid) ||
                other.shareUid == shareUid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.tmdbid, tmdbid) || other.tmdbid == tmdbid) &&
            (identical(other.doubanid, doubanid) ||
                other.doubanid == doubanid) &&
            (identical(other.bangumiid, bangumiid) ||
                other.bangumiid == bangumiid) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.backdrop, backdrop) ||
                other.backdrop == backdrop) &&
            (identical(other.vote, vote) || other.vote == vote) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.include, include) || other.include == include) &&
            (identical(other.exclude, exclude) || other.exclude == exclude) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.totalEpisode, totalEpisode) ||
                other.totalEpisode == totalEpisode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.customWords, customWords) ||
                other.customWords == customWords) &&
            (identical(other.mediaCategory, mediaCategory) ||
                other.mediaCategory == mediaCategory) &&
            const DeepCollectionEquality().equals(
              other.episodeGroup,
              episodeGroup,
            ) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    subscribeId,
    shareTitle,
    shareComment,
    shareUser,
    shareUid,
    name,
    year,
    type,
    keyword,
    tmdbid,
    doubanid,
    bangumiid,
    season,
    poster,
    backdrop,
    vote,
    description,
    include,
    exclude,
    quality,
    resolution,
    effect,
    totalEpisode,
    date,
    customWords,
    mediaCategory,
    const DeepCollectionEquality().hash(episodeGroup),
    count,
  ]);

  /// Create a copy of SubscribeShareItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeShareItemImplCopyWith<_$SubscribeShareItemImpl> get copyWith =>
      __$$SubscribeShareItemImplCopyWithImpl<_$SubscribeShareItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeShareItemImplToJson(this);
  }
}

abstract class _SubscribeShareItem implements SubscribeShareItem {
  const factory _SubscribeShareItem({
    @JsonKey(fromJson: _intFromJson) final int? id,
    @JsonKey(name: 'subscribe_id', fromJson: _intFromJson)
    final int? subscribeId,
    @JsonKey(name: 'share_title') final String? shareTitle,
    @JsonKey(name: 'share_comment') final String? shareComment,
    @JsonKey(name: 'share_user') final String? shareUser,
    @JsonKey(name: 'share_uid') final String? shareUid,
    final String? name,
    final String? year,
    final String? type,
    final String? keyword,
    @JsonKey(fromJson: _intFromJson) final int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) final int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) final int? bangumiid,
    @JsonKey(fromJson: _intFromJson) final int? season,
    final String? poster,
    final String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) final double? vote,
    final String? description,
    final String? include,
    final String? exclude,
    final String? quality,
    final String? resolution,
    final String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson)
    final int? totalEpisode,
    final String? date,
    @JsonKey(name: 'custom_words') final String? customWords,
    @JsonKey(name: 'media_category') final String? mediaCategory,
    @JsonKey(name: 'episode_group') final dynamic episodeGroup,
    @JsonKey(name: 'count', fromJson: _intFromJson) final int? count,
  }) = _$SubscribeShareItemImpl;

  factory _SubscribeShareItem.fromJson(Map<String, dynamic> json) =
      _$SubscribeShareItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get id;
  @override
  @JsonKey(name: 'subscribe_id', fromJson: _intFromJson)
  int? get subscribeId;
  @override
  @JsonKey(name: 'share_title')
  String? get shareTitle;
  @override
  @JsonKey(name: 'share_comment')
  String? get shareComment;
  @override
  @JsonKey(name: 'share_user')
  String? get shareUser;
  @override
  @JsonKey(name: 'share_uid')
  String? get shareUid;
  @override
  String? get name;
  @override
  String? get year;
  @override
  String? get type;
  @override
  String? get keyword;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid;
  @override
  @JsonKey(name: 'doubanid', fromJson: _intFromJson)
  int? get doubanid;
  @override
  @JsonKey(name: 'bangumiid', fromJson: _intFromJson)
  int? get bangumiid;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get season;
  @override
  String? get poster;
  @override
  String? get backdrop;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote;
  @override
  String? get description;
  @override
  String? get include;
  @override
  String? get exclude;
  @override
  String? get quality;
  @override
  String? get resolution;
  @override
  String? get effect;
  @override
  @JsonKey(name: 'total_episode', fromJson: _intFromJson)
  int? get totalEpisode;
  @override
  String? get date;
  @override
  @JsonKey(name: 'custom_words')
  String? get customWords;
  @override
  @JsonKey(name: 'media_category')
  String? get mediaCategory;
  @override
  @JsonKey(name: 'episode_group')
  dynamic get episodeGroup;
  @override
  @JsonKey(name: 'count', fromJson: _intFromJson)
  int? get count;

  /// Create a copy of SubscribeShareItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeShareItemImplCopyWith<_$SubscribeShareItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
