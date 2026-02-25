// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_env_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemEnvResponse _$SystemEnvResponseFromJson(Map<String, dynamic> json) {
  return _SystemEnvResponse.fromJson(json);
}

/// @nodoc
mixin _$SystemEnvResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SystemEnvData? get data => throw _privateConstructorUsedError;

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemEnvResponseCopyWith<SystemEnvResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemEnvResponseCopyWith<$Res> {
  factory $SystemEnvResponseCopyWith(
    SystemEnvResponse value,
    $Res Function(SystemEnvResponse) then,
  ) = _$SystemEnvResponseCopyWithImpl<$Res, SystemEnvResponse>;
  @useResult
  $Res call({bool success, String? message, SystemEnvData? data});

  $SystemEnvDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SystemEnvResponseCopyWithImpl<$Res, $Val extends SystemEnvResponse>
    implements $SystemEnvResponseCopyWith<$Res> {
  _$SystemEnvResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as SystemEnvData?,
          )
          as $Val,
    );
  }

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SystemEnvDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SystemEnvDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SystemEnvResponseImplCopyWith<$Res>
    implements $SystemEnvResponseCopyWith<$Res> {
  factory _$$SystemEnvResponseImplCopyWith(
    _$SystemEnvResponseImpl value,
    $Res Function(_$SystemEnvResponseImpl) then,
  ) = __$$SystemEnvResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, SystemEnvData? data});

  @override
  $SystemEnvDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SystemEnvResponseImplCopyWithImpl<$Res>
    extends _$SystemEnvResponseCopyWithImpl<$Res, _$SystemEnvResponseImpl>
    implements _$$SystemEnvResponseImplCopyWith<$Res> {
  __$$SystemEnvResponseImplCopyWithImpl(
    _$SystemEnvResponseImpl _value,
    $Res Function(_$SystemEnvResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$SystemEnvResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as SystemEnvData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$SystemEnvResponseImpl implements _SystemEnvResponse {
  const _$SystemEnvResponseImpl({
    required this.success,
    this.message,
    this.data,
  });

  factory _$SystemEnvResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemEnvResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final SystemEnvData? data;

  @override
  String toString() {
    return 'SystemEnvResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemEnvResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemEnvResponseImplCopyWith<_$SystemEnvResponseImpl> get copyWith =>
      __$$SystemEnvResponseImplCopyWithImpl<_$SystemEnvResponseImpl>(
        this,
        _$identity,
      );
}

abstract class _SystemEnvResponse implements SystemEnvResponse {
  const factory _SystemEnvResponse({
    required final bool success,
    final String? message,
    final SystemEnvData? data,
  }) = _$SystemEnvResponseImpl;

  factory _SystemEnvResponse.fromJson(Map<String, dynamic> json) =
      _$SystemEnvResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  SystemEnvData? get data;

  /// Create a copy of SystemEnvResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemEnvResponseImplCopyWith<_$SystemEnvResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemEnvData _$SystemEnvDataFromJson(Map<String, dynamic> json) {
  return _SystemEnvData.fromJson(json);
}

/// @nodoc
mixin _$SystemEnvData {
  @JsonKey(name: 'CONFIG_DIR')
  String? get configDir => throw _privateConstructorUsedError;
  @JsonKey(name: 'DEBUG', fromJson: _boolFromJson)
  bool? get debug => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOG_LEVEL')
  String? get logLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
  int? get logMaxFileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
  int? get logBackupCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOG_CONSOLE_FORMAT')
  String? get logConsoleFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOG_FILE_FORMAT')
  String? get logFileFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
  int? get asyncFileQueueSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
  int? get asyncFileWorkers => throw _privateConstructorUsedError;
  @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
  int? get batchWriteSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
  double? get writeTimeout => throw _privateConstructorUsedError;
  @JsonKey(name: 'PROJECT_NAME')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'APP_DOMAIN')
  String? get appDomain => throw _privateConstructorUsedError;
  @JsonKey(name: 'API_V1_STR')
  String? get apiV1Str => throw _privateConstructorUsedError;
  @JsonKey(name: 'FRONTEND_PATH')
  String? get frontendPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'TZ')
  String? get tz => throw _privateConstructorUsedError;
  @JsonKey(name: 'HOST')
  String? get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'PORT', fromJson: _intFromJson)
  int? get port => throw _privateConstructorUsedError;
  @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson)
  int? get nginxPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'DEV', fromJson: _boolFromJson)
  bool? get dev => throw _privateConstructorUsedError;
  @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson)
  bool? get advancedMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
  List<String>? get allowedHosts => throw _privateConstructorUsedError;
  @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
  int? get accessTokenExpireMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS', fromJson: _intFromJson)
  int? get resourceAccessTokenExpireSeconds =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'SUPERUSER')
  String? get superuser => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUPERUSER_PASSWORD')
  String? get superuserPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
  bool? get auxiliaryAuthEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'API_TOKEN')
  String? get apiToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'AUTH_SITE')
  String? get authSite => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_TYPE')
  String? get dbType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson)
  bool? get dbEcho => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson)
  int? get dbTimeout => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson)
  bool? get dbWalEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POOL_TYPE')
  String? get dbPoolType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
  bool? get dbPoolPrePing => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
  int? get dbPoolRecycle => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
  int? get dbPoolTimeout => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
  int? get dbSqlitePoolSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
  int? get dbSqliteMaxOverflow => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_HOST')
  String? get dbPostgresqlHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
  int? get dbPostgresqlPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_DATABASE')
  String? get dbPostgresqlDatabase => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_USERNAME')
  String? get dbPostgresqlUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_PASSWORD')
  String? get dbPostgresqlPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
  int? get dbPostgresqlPoolSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
  int? get dbPostgresqlMaxOverflow => throw _privateConstructorUsedError;
  @JsonKey(name: 'CACHE_BACKEND_TYPE')
  String? get cacheBackendType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CACHE_BACKEND_URL')
  String? get cacheBackendUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
  int? get cacheRedisMaxmemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
  bool? get globalImageCache => throw _privateConstructorUsedError;
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
  int? get globalImageCacheDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson)
  int? get tempFileDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
  int? get metaCacheExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'PROXY_HOST')
  String? get proxyHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson)
  bool? get dohEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOH_DOMAINS')
  String? get dohDomains => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOH_RESOLVERS')
  String? get dohResolvers => throw _privateConstructorUsedError;
  @JsonKey(name: 'SEARCH_SOURCE')
  String? get searchSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  String? get recognizeSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'SCRAP_SOURCE')
  String? get scrapSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
  List<int>? get animeGenreIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'TMDB_IMAGE_DOMAIN')
  String? get tmdbImageDomain => throw _privateConstructorUsedError;
  @JsonKey(name: 'TMDB_API_DOMAIN')
  String? get tmdbApiDomain => throw _privateConstructorUsedError;
  @JsonKey(name: 'TMDB_LOCALE')
  String? get tmdbLocale => throw _privateConstructorUsedError;
  @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
  bool? get tmdbScrapOriginalImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'TMDB_API_KEY')
  String? get tmdbApiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'TVDB_V4_API_KEY')
  String? get tvdbV4ApiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'TVDB_V4_API_PIN')
  String? get tvdbV4ApiPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson)
  bool? get fanartEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'FANART_LANG')
  String? get fanartLang => throw _privateConstructorUsedError;
  @JsonKey(name: 'FANART_API_KEY')
  String? get fanartApiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'U115_APP_ID')
  String? get u115AppId => throw _privateConstructorUsedError;
  @JsonKey(name: 'U115_AUTH_SERVER')
  String? get u115AuthServer => throw _privateConstructorUsedError;
  @JsonKey(name: 'ALIPAN_APP_ID')
  String? get alipanAppId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE')
  String? get moviepilotAutoUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
  bool? get autoUpdateResource => throw _privateConstructorUsedError;
  @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
  List<String>? get rmtMediaext => throw _privateConstructorUsedError;
  @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
  List<String>? get rmtSubext => throw _privateConstructorUsedError;
  @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
  List<String>? get rmtAudioext => throw _privateConstructorUsedError;
  @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
  int? get mediaserverSyncInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_MODE')
  String? get subscribeMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
  int? get subscribeRssInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get subscribeStatisticShare => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
  bool? get subscribeSearch => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
  int? get subscribeSearchInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
  bool? get localExistsSearch => throw _privateConstructorUsedError;
  @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
  int? get sitedataRefreshInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson)
  bool? get siteMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'NO_CACHE_SITE_KEY')
  String? get noCacheSiteKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'OCR_HOST')
  String? get ocrHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'BROWSER_EMULATION')
  String? get browserEmulation => throw _privateConstructorUsedError;
  @JsonKey(name: 'FLARESOLVERR_URL')
  String? get flaresolverrUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
  bool? get searchMultipleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
  int? get maxSearchNameLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'TORRENT_TAG')
  String? get torrentTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
  bool? get downloadSubtitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'AUTO_DOWNLOAD_USER')
  String? get autoDownloadUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
  List<String>? get downloadTmpext => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
  bool? get cookiecloudEnableLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_HOST')
  String? get cookiecloudHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_KEY')
  String? get cookiecloudKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_PASSWORD')
  String? get cookiecloudPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
  int? get cookiecloudInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'COOKIECLOUD_BLACKLIST')
  String? get cookiecloudBlacklist => throw _privateConstructorUsedError;
  @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
  int? get transferThreads => throw _privateConstructorUsedError;
  @JsonKey(name: 'MOVIE_RENAME_FORMAT')
  String? get movieRenameFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'TV_RENAME_FORMAT')
  String? get tvRenameFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
  List<String>? get renameFormatS0Names => throw _privateConstructorUsedError;
  @JsonKey(name: 'DEFAULT_SUB')
  String? get defaultSub => throw _privateConstructorUsedError;
  @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
  bool? get scrapFollowTmdb => throw _privateConstructorUsedError;
  @JsonKey(name: 'MP_SERVER_HOST')
  String? get mpServerHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'WALLPAPER')
  String? get wallpaper => throw _privateConstructorUsedError;
  @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
  String? get customizeWallpaperApiUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'PLUGIN_MARKET')
  String? get pluginMarket => throw _privateConstructorUsedError;
  @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get pluginStatisticShare => throw _privateConstructorUsedError;
  @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
  bool? get pluginAutoReload => throw _privateConstructorUsedError;
  @JsonKey(name: 'GITHUB_TOKEN')
  String? get githubToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'GITHUB_PROXY')
  String? get githubProxy => throw _privateConstructorUsedError;
  @JsonKey(name: 'PIP_PROXY')
  String? get pipProxy => throw _privateConstructorUsedError;
  @JsonKey(name: 'REPO_GITHUB_TOKEN')
  String? get repoGithubToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
  bool? get bigMemoryMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ENCODING_DETECTION_PERFORMANCE_MODE', fromJson: _boolFromJson)
  bool? get encodingDetectionPerformanceMode =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ENCODING_DETECTION_MIN_CONFIDENCE', fromJson: _doubleFromJson)
  double? get encodingDetectionMinConfidence =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
  int? get memoryGcInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
  List<String>? get securityImageDomains => throw _privateConstructorUsedError;
  @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
  List<String>? get securityImageSuffixes => throw _privateConstructorUsedError;
  @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
  bool? get passkeyRequireUv => throw _privateConstructorUsedError;
  @JsonKey(name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP', fromJson: _boolFromJson)
  bool? get passkeyAllowRegisterWithoutOtp =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get workflowStatisticShare => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  bool? get rcloneSnapshotCheckFolderModtime =>
      throw _privateConstructorUsedError;
  @JsonKey(
    name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  bool? get openlistSnapshotCheckFolderModtime =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'DOCKER_CLIENT_API')
  String? get dockerClientApi => throw _privateConstructorUsedError;
  @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE')
  String? get playwrightBrowserType => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
  bool? get aiAgentEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
  bool? get aiAgentGlobal => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_PROVIDER')
  String? get llmProvider => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_MODEL')
  String? get llmModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_API_KEY')
  String? get llmApiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_BASE_URL')
  String? get llmBaseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
  int? get llmMaxContextTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
  double? get llmTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
  int? get llmMaxIterations => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
  int? get llmToolTimeout => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson)
  bool? get llmVerbose => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
  int? get llmMaxMemoryMessages => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  int? get llmMemoryRetentionDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  int? get llmRedisMemoryRetentionDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
  bool? get aiRecommendEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
  String? get aiRecommendUserPreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'TAVILY_API_KEY')
  String? get tavilyApiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
  int? get aiRecommendMaxItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'VERSION')
  String? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'AUTH_VERSION')
  String? get authVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'INDEXER_VERSION')
  String? get indexerVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'FRONTEND_VERSION')
  String? get frontendVersion => throw _privateConstructorUsedError;

  /// Create a copy of SystemEnvData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemEnvDataCopyWith<SystemEnvData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemEnvDataCopyWith<$Res> {
  factory $SystemEnvDataCopyWith(
    SystemEnvData value,
    $Res Function(SystemEnvData) then,
  ) = _$SystemEnvDataCopyWithImpl<$Res, SystemEnvData>;
  @useResult
  $Res call({
    @JsonKey(name: 'CONFIG_DIR') String? configDir,
    @JsonKey(name: 'DEBUG', fromJson: _boolFromJson) bool? debug,
    @JsonKey(name: 'LOG_LEVEL') String? logLevel,
    @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
    int? logMaxFileSize,
    @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
    int? logBackupCount,
    @JsonKey(name: 'LOG_CONSOLE_FORMAT') String? logConsoleFormat,
    @JsonKey(name: 'LOG_FILE_FORMAT') String? logFileFormat,
    @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
    int? asyncFileQueueSize,
    @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
    int? asyncFileWorkers,
    @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
    int? batchWriteSize,
    @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
    double? writeTimeout,
    @JsonKey(name: 'PROJECT_NAME') String? projectName,
    @JsonKey(name: 'APP_DOMAIN') String? appDomain,
    @JsonKey(name: 'API_V1_STR') String? apiV1Str,
    @JsonKey(name: 'FRONTEND_PATH') String? frontendPath,
    @JsonKey(name: 'TZ') String? tz,
    @JsonKey(name: 'HOST') String? host,
    @JsonKey(name: 'PORT', fromJson: _intFromJson) int? port,
    @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson) int? nginxPort,
    @JsonKey(name: 'DEV', fromJson: _boolFromJson) bool? dev,
    @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson) bool? advancedMode,
    @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
    List<String>? allowedHosts,
    @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
    int? accessTokenExpireMinutes,
    @JsonKey(
      name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS',
      fromJson: _intFromJson,
    )
    int? resourceAccessTokenExpireSeconds,
    @JsonKey(name: 'SUPERUSER') String? superuser,
    @JsonKey(name: 'SUPERUSER_PASSWORD') String? superuserPassword,
    @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
    bool? auxiliaryAuthEnable,
    @JsonKey(name: 'API_TOKEN') String? apiToken,
    @JsonKey(name: 'AUTH_SITE') String? authSite,
    @JsonKey(name: 'DB_TYPE') String? dbType,
    @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson) bool? dbEcho,
    @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson) int? dbTimeout,
    @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson) bool? dbWalEnable,
    @JsonKey(name: 'DB_POOL_TYPE') String? dbPoolType,
    @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
    bool? dbPoolPrePing,
    @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
    int? dbPoolRecycle,
    @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
    int? dbPoolTimeout,
    @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
    int? dbSqlitePoolSize,
    @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
    int? dbSqliteMaxOverflow,
    @JsonKey(name: 'DB_POSTGRESQL_HOST') String? dbPostgresqlHost,
    @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
    int? dbPostgresqlPort,
    @JsonKey(name: 'DB_POSTGRESQL_DATABASE') String? dbPostgresqlDatabase,
    @JsonKey(name: 'DB_POSTGRESQL_USERNAME') String? dbPostgresqlUsername,
    @JsonKey(name: 'DB_POSTGRESQL_PASSWORD') String? dbPostgresqlPassword,
    @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
    int? dbPostgresqlPoolSize,
    @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
    int? dbPostgresqlMaxOverflow,
    @JsonKey(name: 'CACHE_BACKEND_TYPE') String? cacheBackendType,
    @JsonKey(name: 'CACHE_BACKEND_URL') String? cacheBackendUrl,
    @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
    int? cacheRedisMaxmemory,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
    bool? globalImageCache,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
    int? globalImageCacheDays,
    @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson) int? tempFileDays,
    @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
    int? metaCacheExpire,
    @JsonKey(name: 'PROXY_HOST') String? proxyHost,
    @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson) bool? dohEnable,
    @JsonKey(name: 'DOH_DOMAINS') String? dohDomains,
    @JsonKey(name: 'DOH_RESOLVERS') String? dohResolvers,
    @JsonKey(name: 'SEARCH_SOURCE') String? searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') String? recognizeSource,
    @JsonKey(name: 'SCRAP_SOURCE') String? scrapSource,
    @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
    List<int>? animeGenreIds,
    @JsonKey(name: 'TMDB_IMAGE_DOMAIN') String? tmdbImageDomain,
    @JsonKey(name: 'TMDB_API_DOMAIN') String? tmdbApiDomain,
    @JsonKey(name: 'TMDB_LOCALE') String? tmdbLocale,
    @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
    bool? tmdbScrapOriginalImage,
    @JsonKey(name: 'TMDB_API_KEY') String? tmdbApiKey,
    @JsonKey(name: 'TVDB_V4_API_KEY') String? tvdbV4ApiKey,
    @JsonKey(name: 'TVDB_V4_API_PIN') String? tvdbV4ApiPin,
    @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson) bool? fanartEnable,
    @JsonKey(name: 'FANART_LANG') String? fanartLang,
    @JsonKey(name: 'FANART_API_KEY') String? fanartApiKey,
    @JsonKey(name: 'U115_APP_ID') String? u115AppId,
    @JsonKey(name: 'U115_AUTH_SERVER') String? u115AuthServer,
    @JsonKey(name: 'ALIPAN_APP_ID') String? alipanAppId,
    @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE') String? moviepilotAutoUpdate,
    @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
    bool? autoUpdateResource,
    @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
    List<String>? rmtMediaext,
    @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
    List<String>? rmtSubext,
    @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
    List<String>? rmtAudioext,
    @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
    int? mediaserverSyncInterval,
    @JsonKey(name: 'SUBSCRIBE_MODE') String? subscribeMode,
    @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
    int? subscribeRssInterval,
    @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? subscribeStatisticShare,
    @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
    bool? subscribeSearch,
    @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
    int? subscribeSearchInterval,
    @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
    bool? localExistsSearch,
    @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
    int? sitedataRefreshInterval,
    @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson) bool? siteMessage,
    @JsonKey(name: 'NO_CACHE_SITE_KEY') String? noCacheSiteKey,
    @JsonKey(name: 'OCR_HOST') String? ocrHost,
    @JsonKey(name: 'BROWSER_EMULATION') String? browserEmulation,
    @JsonKey(name: 'FLARESOLVERR_URL') String? flaresolverrUrl,
    @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
    bool? searchMultipleName,
    @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
    int? maxSearchNameLimit,
    @JsonKey(name: 'TORRENT_TAG') String? torrentTag,
    @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
    bool? downloadSubtitle,
    @JsonKey(name: 'AUTO_DOWNLOAD_USER') String? autoDownloadUser,
    @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
    List<String>? downloadTmpext,
    @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
    bool? cookiecloudEnableLocal,
    @JsonKey(name: 'COOKIECLOUD_HOST') String? cookiecloudHost,
    @JsonKey(name: 'COOKIECLOUD_KEY') String? cookiecloudKey,
    @JsonKey(name: 'COOKIECLOUD_PASSWORD') String? cookiecloudPassword,
    @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
    int? cookiecloudInterval,
    @JsonKey(name: 'COOKIECLOUD_BLACKLIST') String? cookiecloudBlacklist,
    @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
    int? transferThreads,
    @JsonKey(name: 'MOVIE_RENAME_FORMAT') String? movieRenameFormat,
    @JsonKey(name: 'TV_RENAME_FORMAT') String? tvRenameFormat,
    @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
    List<String>? renameFormatS0Names,
    @JsonKey(name: 'DEFAULT_SUB') String? defaultSub,
    @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
    bool? scrapFollowTmdb,
    @JsonKey(name: 'MP_SERVER_HOST') String? mpServerHost,
    @JsonKey(name: 'WALLPAPER') String? wallpaper,
    @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
    String? customizeWallpaperApiUrl,
    @JsonKey(name: 'PLUGIN_MARKET') String? pluginMarket,
    @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? pluginStatisticShare,
    @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
    bool? pluginAutoReload,
    @JsonKey(name: 'GITHUB_TOKEN') String? githubToken,
    @JsonKey(name: 'GITHUB_PROXY') String? githubProxy,
    @JsonKey(name: 'PIP_PROXY') String? pipProxy,
    @JsonKey(name: 'REPO_GITHUB_TOKEN') String? repoGithubToken,
    @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
    bool? bigMemoryMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_PERFORMANCE_MODE',
      fromJson: _boolFromJson,
    )
    bool? encodingDetectionPerformanceMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_MIN_CONFIDENCE',
      fromJson: _doubleFromJson,
    )
    double? encodingDetectionMinConfidence,
    @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
    int? memoryGcInterval,
    @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
    List<String>? securityImageDomains,
    @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
    List<String>? securityImageSuffixes,
    @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
    bool? passkeyRequireUv,
    @JsonKey(
      name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP',
      fromJson: _boolFromJson,
    )
    bool? passkeyAllowRegisterWithoutOtp,
    @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? workflowStatisticShare,
    @JsonKey(
      name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    bool? rcloneSnapshotCheckFolderModtime,
    @JsonKey(
      name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    bool? openlistSnapshotCheckFolderModtime,
    @JsonKey(name: 'DOCKER_CLIENT_API') String? dockerClientApi,
    @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE') String? playwrightBrowserType,
    @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
    bool? aiAgentEnable,
    @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
    bool? aiAgentGlobal,
    @JsonKey(name: 'LLM_PROVIDER') String? llmProvider,
    @JsonKey(name: 'LLM_MODEL') String? llmModel,
    @JsonKey(name: 'LLM_API_KEY') String? llmApiKey,
    @JsonKey(name: 'LLM_BASE_URL') String? llmBaseUrl,
    @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
    int? llmMaxContextTokens,
    @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
    double? llmTemperature,
    @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
    int? llmMaxIterations,
    @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
    int? llmToolTimeout,
    @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson) bool? llmVerbose,
    @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
    int? llmMaxMemoryMessages,
    @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    int? llmMemoryRetentionDays,
    @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    int? llmRedisMemoryRetentionDays,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
    bool? aiRecommendEnabled,
    @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
    String? aiRecommendUserPreference,
    @JsonKey(name: 'TAVILY_API_KEY') String? tavilyApiKey,
    @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
    int? aiRecommendMaxItems,
    @JsonKey(name: 'VERSION') String? version,
    @JsonKey(name: 'AUTH_VERSION') String? authVersion,
    @JsonKey(name: 'INDEXER_VERSION') String? indexerVersion,
    @JsonKey(name: 'FRONTEND_VERSION') String? frontendVersion,
  });
}

/// @nodoc
class _$SystemEnvDataCopyWithImpl<$Res, $Val extends SystemEnvData>
    implements $SystemEnvDataCopyWith<$Res> {
  _$SystemEnvDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemEnvData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configDir = freezed,
    Object? debug = freezed,
    Object? logLevel = freezed,
    Object? logMaxFileSize = freezed,
    Object? logBackupCount = freezed,
    Object? logConsoleFormat = freezed,
    Object? logFileFormat = freezed,
    Object? asyncFileQueueSize = freezed,
    Object? asyncFileWorkers = freezed,
    Object? batchWriteSize = freezed,
    Object? writeTimeout = freezed,
    Object? projectName = freezed,
    Object? appDomain = freezed,
    Object? apiV1Str = freezed,
    Object? frontendPath = freezed,
    Object? tz = freezed,
    Object? host = freezed,
    Object? port = freezed,
    Object? nginxPort = freezed,
    Object? dev = freezed,
    Object? advancedMode = freezed,
    Object? allowedHosts = freezed,
    Object? accessTokenExpireMinutes = freezed,
    Object? resourceAccessTokenExpireSeconds = freezed,
    Object? superuser = freezed,
    Object? superuserPassword = freezed,
    Object? auxiliaryAuthEnable = freezed,
    Object? apiToken = freezed,
    Object? authSite = freezed,
    Object? dbType = freezed,
    Object? dbEcho = freezed,
    Object? dbTimeout = freezed,
    Object? dbWalEnable = freezed,
    Object? dbPoolType = freezed,
    Object? dbPoolPrePing = freezed,
    Object? dbPoolRecycle = freezed,
    Object? dbPoolTimeout = freezed,
    Object? dbSqlitePoolSize = freezed,
    Object? dbSqliteMaxOverflow = freezed,
    Object? dbPostgresqlHost = freezed,
    Object? dbPostgresqlPort = freezed,
    Object? dbPostgresqlDatabase = freezed,
    Object? dbPostgresqlUsername = freezed,
    Object? dbPostgresqlPassword = freezed,
    Object? dbPostgresqlPoolSize = freezed,
    Object? dbPostgresqlMaxOverflow = freezed,
    Object? cacheBackendType = freezed,
    Object? cacheBackendUrl = freezed,
    Object? cacheRedisMaxmemory = freezed,
    Object? globalImageCache = freezed,
    Object? globalImageCacheDays = freezed,
    Object? tempFileDays = freezed,
    Object? metaCacheExpire = freezed,
    Object? proxyHost = freezed,
    Object? dohEnable = freezed,
    Object? dohDomains = freezed,
    Object? dohResolvers = freezed,
    Object? searchSource = freezed,
    Object? recognizeSource = freezed,
    Object? scrapSource = freezed,
    Object? animeGenreIds = freezed,
    Object? tmdbImageDomain = freezed,
    Object? tmdbApiDomain = freezed,
    Object? tmdbLocale = freezed,
    Object? tmdbScrapOriginalImage = freezed,
    Object? tmdbApiKey = freezed,
    Object? tvdbV4ApiKey = freezed,
    Object? tvdbV4ApiPin = freezed,
    Object? fanartEnable = freezed,
    Object? fanartLang = freezed,
    Object? fanartApiKey = freezed,
    Object? u115AppId = freezed,
    Object? u115AuthServer = freezed,
    Object? alipanAppId = freezed,
    Object? moviepilotAutoUpdate = freezed,
    Object? autoUpdateResource = freezed,
    Object? rmtMediaext = freezed,
    Object? rmtSubext = freezed,
    Object? rmtAudioext = freezed,
    Object? mediaserverSyncInterval = freezed,
    Object? subscribeMode = freezed,
    Object? subscribeRssInterval = freezed,
    Object? subscribeStatisticShare = freezed,
    Object? subscribeSearch = freezed,
    Object? subscribeSearchInterval = freezed,
    Object? localExistsSearch = freezed,
    Object? sitedataRefreshInterval = freezed,
    Object? siteMessage = freezed,
    Object? noCacheSiteKey = freezed,
    Object? ocrHost = freezed,
    Object? browserEmulation = freezed,
    Object? flaresolverrUrl = freezed,
    Object? searchMultipleName = freezed,
    Object? maxSearchNameLimit = freezed,
    Object? torrentTag = freezed,
    Object? downloadSubtitle = freezed,
    Object? autoDownloadUser = freezed,
    Object? downloadTmpext = freezed,
    Object? cookiecloudEnableLocal = freezed,
    Object? cookiecloudHost = freezed,
    Object? cookiecloudKey = freezed,
    Object? cookiecloudPassword = freezed,
    Object? cookiecloudInterval = freezed,
    Object? cookiecloudBlacklist = freezed,
    Object? transferThreads = freezed,
    Object? movieRenameFormat = freezed,
    Object? tvRenameFormat = freezed,
    Object? renameFormatS0Names = freezed,
    Object? defaultSub = freezed,
    Object? scrapFollowTmdb = freezed,
    Object? mpServerHost = freezed,
    Object? wallpaper = freezed,
    Object? customizeWallpaperApiUrl = freezed,
    Object? pluginMarket = freezed,
    Object? pluginStatisticShare = freezed,
    Object? pluginAutoReload = freezed,
    Object? githubToken = freezed,
    Object? githubProxy = freezed,
    Object? pipProxy = freezed,
    Object? repoGithubToken = freezed,
    Object? bigMemoryMode = freezed,
    Object? encodingDetectionPerformanceMode = freezed,
    Object? encodingDetectionMinConfidence = freezed,
    Object? memoryGcInterval = freezed,
    Object? securityImageDomains = freezed,
    Object? securityImageSuffixes = freezed,
    Object? passkeyRequireUv = freezed,
    Object? passkeyAllowRegisterWithoutOtp = freezed,
    Object? workflowStatisticShare = freezed,
    Object? rcloneSnapshotCheckFolderModtime = freezed,
    Object? openlistSnapshotCheckFolderModtime = freezed,
    Object? dockerClientApi = freezed,
    Object? playwrightBrowserType = freezed,
    Object? aiAgentEnable = freezed,
    Object? aiAgentGlobal = freezed,
    Object? llmProvider = freezed,
    Object? llmModel = freezed,
    Object? llmApiKey = freezed,
    Object? llmBaseUrl = freezed,
    Object? llmMaxContextTokens = freezed,
    Object? llmTemperature = freezed,
    Object? llmMaxIterations = freezed,
    Object? llmToolTimeout = freezed,
    Object? llmVerbose = freezed,
    Object? llmMaxMemoryMessages = freezed,
    Object? llmMemoryRetentionDays = freezed,
    Object? llmRedisMemoryRetentionDays = freezed,
    Object? aiRecommendEnabled = freezed,
    Object? aiRecommendUserPreference = freezed,
    Object? tavilyApiKey = freezed,
    Object? aiRecommendMaxItems = freezed,
    Object? version = freezed,
    Object? authVersion = freezed,
    Object? indexerVersion = freezed,
    Object? frontendVersion = freezed,
  }) {
    return _then(
      _value.copyWith(
            configDir: freezed == configDir
                ? _value.configDir
                : configDir // ignore: cast_nullable_to_non_nullable
                      as String?,
            debug: freezed == debug
                ? _value.debug
                : debug // ignore: cast_nullable_to_non_nullable
                      as bool?,
            logLevel: freezed == logLevel
                ? _value.logLevel
                : logLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            logMaxFileSize: freezed == logMaxFileSize
                ? _value.logMaxFileSize
                : logMaxFileSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            logBackupCount: freezed == logBackupCount
                ? _value.logBackupCount
                : logBackupCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            logConsoleFormat: freezed == logConsoleFormat
                ? _value.logConsoleFormat
                : logConsoleFormat // ignore: cast_nullable_to_non_nullable
                      as String?,
            logFileFormat: freezed == logFileFormat
                ? _value.logFileFormat
                : logFileFormat // ignore: cast_nullable_to_non_nullable
                      as String?,
            asyncFileQueueSize: freezed == asyncFileQueueSize
                ? _value.asyncFileQueueSize
                : asyncFileQueueSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            asyncFileWorkers: freezed == asyncFileWorkers
                ? _value.asyncFileWorkers
                : asyncFileWorkers // ignore: cast_nullable_to_non_nullable
                      as int?,
            batchWriteSize: freezed == batchWriteSize
                ? _value.batchWriteSize
                : batchWriteSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            writeTimeout: freezed == writeTimeout
                ? _value.writeTimeout
                : writeTimeout // ignore: cast_nullable_to_non_nullable
                      as double?,
            projectName: freezed == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                      as String?,
            appDomain: freezed == appDomain
                ? _value.appDomain
                : appDomain // ignore: cast_nullable_to_non_nullable
                      as String?,
            apiV1Str: freezed == apiV1Str
                ? _value.apiV1Str
                : apiV1Str // ignore: cast_nullable_to_non_nullable
                      as String?,
            frontendPath: freezed == frontendPath
                ? _value.frontendPath
                : frontendPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            tz: freezed == tz
                ? _value.tz
                : tz // ignore: cast_nullable_to_non_nullable
                      as String?,
            host: freezed == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as String?,
            port: freezed == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int?,
            nginxPort: freezed == nginxPort
                ? _value.nginxPort
                : nginxPort // ignore: cast_nullable_to_non_nullable
                      as int?,
            dev: freezed == dev
                ? _value.dev
                : dev // ignore: cast_nullable_to_non_nullable
                      as bool?,
            advancedMode: freezed == advancedMode
                ? _value.advancedMode
                : advancedMode // ignore: cast_nullable_to_non_nullable
                      as bool?,
            allowedHosts: freezed == allowedHosts
                ? _value.allowedHosts
                : allowedHosts // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            accessTokenExpireMinutes: freezed == accessTokenExpireMinutes
                ? _value.accessTokenExpireMinutes
                : accessTokenExpireMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            resourceAccessTokenExpireSeconds:
                freezed == resourceAccessTokenExpireSeconds
                ? _value.resourceAccessTokenExpireSeconds
                : resourceAccessTokenExpireSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            superuser: freezed == superuser
                ? _value.superuser
                : superuser // ignore: cast_nullable_to_non_nullable
                      as String?,
            superuserPassword: freezed == superuserPassword
                ? _value.superuserPassword
                : superuserPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
            auxiliaryAuthEnable: freezed == auxiliaryAuthEnable
                ? _value.auxiliaryAuthEnable
                : auxiliaryAuthEnable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            apiToken: freezed == apiToken
                ? _value.apiToken
                : apiToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            authSite: freezed == authSite
                ? _value.authSite
                : authSite // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbType: freezed == dbType
                ? _value.dbType
                : dbType // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbEcho: freezed == dbEcho
                ? _value.dbEcho
                : dbEcho // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dbTimeout: freezed == dbTimeout
                ? _value.dbTimeout
                : dbTimeout // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbWalEnable: freezed == dbWalEnable
                ? _value.dbWalEnable
                : dbWalEnable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dbPoolType: freezed == dbPoolType
                ? _value.dbPoolType
                : dbPoolType // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbPoolPrePing: freezed == dbPoolPrePing
                ? _value.dbPoolPrePing
                : dbPoolPrePing // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dbPoolRecycle: freezed == dbPoolRecycle
                ? _value.dbPoolRecycle
                : dbPoolRecycle // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbPoolTimeout: freezed == dbPoolTimeout
                ? _value.dbPoolTimeout
                : dbPoolTimeout // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbSqlitePoolSize: freezed == dbSqlitePoolSize
                ? _value.dbSqlitePoolSize
                : dbSqlitePoolSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbSqliteMaxOverflow: freezed == dbSqliteMaxOverflow
                ? _value.dbSqliteMaxOverflow
                : dbSqliteMaxOverflow // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbPostgresqlHost: freezed == dbPostgresqlHost
                ? _value.dbPostgresqlHost
                : dbPostgresqlHost // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbPostgresqlPort: freezed == dbPostgresqlPort
                ? _value.dbPostgresqlPort
                : dbPostgresqlPort // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbPostgresqlDatabase: freezed == dbPostgresqlDatabase
                ? _value.dbPostgresqlDatabase
                : dbPostgresqlDatabase // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbPostgresqlUsername: freezed == dbPostgresqlUsername
                ? _value.dbPostgresqlUsername
                : dbPostgresqlUsername // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbPostgresqlPassword: freezed == dbPostgresqlPassword
                ? _value.dbPostgresqlPassword
                : dbPostgresqlPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
            dbPostgresqlPoolSize: freezed == dbPostgresqlPoolSize
                ? _value.dbPostgresqlPoolSize
                : dbPostgresqlPoolSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            dbPostgresqlMaxOverflow: freezed == dbPostgresqlMaxOverflow
                ? _value.dbPostgresqlMaxOverflow
                : dbPostgresqlMaxOverflow // ignore: cast_nullable_to_non_nullable
                      as int?,
            cacheBackendType: freezed == cacheBackendType
                ? _value.cacheBackendType
                : cacheBackendType // ignore: cast_nullable_to_non_nullable
                      as String?,
            cacheBackendUrl: freezed == cacheBackendUrl
                ? _value.cacheBackendUrl
                : cacheBackendUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            cacheRedisMaxmemory: freezed == cacheRedisMaxmemory
                ? _value.cacheRedisMaxmemory
                : cacheRedisMaxmemory // ignore: cast_nullable_to_non_nullable
                      as int?,
            globalImageCache: freezed == globalImageCache
                ? _value.globalImageCache
                : globalImageCache // ignore: cast_nullable_to_non_nullable
                      as bool?,
            globalImageCacheDays: freezed == globalImageCacheDays
                ? _value.globalImageCacheDays
                : globalImageCacheDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            tempFileDays: freezed == tempFileDays
                ? _value.tempFileDays
                : tempFileDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            metaCacheExpire: freezed == metaCacheExpire
                ? _value.metaCacheExpire
                : metaCacheExpire // ignore: cast_nullable_to_non_nullable
                      as int?,
            proxyHost: freezed == proxyHost
                ? _value.proxyHost
                : proxyHost // ignore: cast_nullable_to_non_nullable
                      as String?,
            dohEnable: freezed == dohEnable
                ? _value.dohEnable
                : dohEnable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dohDomains: freezed == dohDomains
                ? _value.dohDomains
                : dohDomains // ignore: cast_nullable_to_non_nullable
                      as String?,
            dohResolvers: freezed == dohResolvers
                ? _value.dohResolvers
                : dohResolvers // ignore: cast_nullable_to_non_nullable
                      as String?,
            searchSource: freezed == searchSource
                ? _value.searchSource
                : searchSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            recognizeSource: freezed == recognizeSource
                ? _value.recognizeSource
                : recognizeSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            scrapSource: freezed == scrapSource
                ? _value.scrapSource
                : scrapSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            animeGenreIds: freezed == animeGenreIds
                ? _value.animeGenreIds
                : animeGenreIds // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            tmdbImageDomain: freezed == tmdbImageDomain
                ? _value.tmdbImageDomain
                : tmdbImageDomain // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbApiDomain: freezed == tmdbApiDomain
                ? _value.tmdbApiDomain
                : tmdbApiDomain // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbLocale: freezed == tmdbLocale
                ? _value.tmdbLocale
                : tmdbLocale // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbScrapOriginalImage: freezed == tmdbScrapOriginalImage
                ? _value.tmdbScrapOriginalImage
                : tmdbScrapOriginalImage // ignore: cast_nullable_to_non_nullable
                      as bool?,
            tmdbApiKey: freezed == tmdbApiKey
                ? _value.tmdbApiKey
                : tmdbApiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            tvdbV4ApiKey: freezed == tvdbV4ApiKey
                ? _value.tvdbV4ApiKey
                : tvdbV4ApiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            tvdbV4ApiPin: freezed == tvdbV4ApiPin
                ? _value.tvdbV4ApiPin
                : tvdbV4ApiPin // ignore: cast_nullable_to_non_nullable
                      as String?,
            fanartEnable: freezed == fanartEnable
                ? _value.fanartEnable
                : fanartEnable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            fanartLang: freezed == fanartLang
                ? _value.fanartLang
                : fanartLang // ignore: cast_nullable_to_non_nullable
                      as String?,
            fanartApiKey: freezed == fanartApiKey
                ? _value.fanartApiKey
                : fanartApiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            u115AppId: freezed == u115AppId
                ? _value.u115AppId
                : u115AppId // ignore: cast_nullable_to_non_nullable
                      as String?,
            u115AuthServer: freezed == u115AuthServer
                ? _value.u115AuthServer
                : u115AuthServer // ignore: cast_nullable_to_non_nullable
                      as String?,
            alipanAppId: freezed == alipanAppId
                ? _value.alipanAppId
                : alipanAppId // ignore: cast_nullable_to_non_nullable
                      as String?,
            moviepilotAutoUpdate: freezed == moviepilotAutoUpdate
                ? _value.moviepilotAutoUpdate
                : moviepilotAutoUpdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            autoUpdateResource: freezed == autoUpdateResource
                ? _value.autoUpdateResource
                : autoUpdateResource // ignore: cast_nullable_to_non_nullable
                      as bool?,
            rmtMediaext: freezed == rmtMediaext
                ? _value.rmtMediaext
                : rmtMediaext // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            rmtSubext: freezed == rmtSubext
                ? _value.rmtSubext
                : rmtSubext // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            rmtAudioext: freezed == rmtAudioext
                ? _value.rmtAudioext
                : rmtAudioext // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            mediaserverSyncInterval: freezed == mediaserverSyncInterval
                ? _value.mediaserverSyncInterval
                : mediaserverSyncInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            subscribeMode: freezed == subscribeMode
                ? _value.subscribeMode
                : subscribeMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            subscribeRssInterval: freezed == subscribeRssInterval
                ? _value.subscribeRssInterval
                : subscribeRssInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            subscribeStatisticShare: freezed == subscribeStatisticShare
                ? _value.subscribeStatisticShare
                : subscribeStatisticShare // ignore: cast_nullable_to_non_nullable
                      as bool?,
            subscribeSearch: freezed == subscribeSearch
                ? _value.subscribeSearch
                : subscribeSearch // ignore: cast_nullable_to_non_nullable
                      as bool?,
            subscribeSearchInterval: freezed == subscribeSearchInterval
                ? _value.subscribeSearchInterval
                : subscribeSearchInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            localExistsSearch: freezed == localExistsSearch
                ? _value.localExistsSearch
                : localExistsSearch // ignore: cast_nullable_to_non_nullable
                      as bool?,
            sitedataRefreshInterval: freezed == sitedataRefreshInterval
                ? _value.sitedataRefreshInterval
                : sitedataRefreshInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            siteMessage: freezed == siteMessage
                ? _value.siteMessage
                : siteMessage // ignore: cast_nullable_to_non_nullable
                      as bool?,
            noCacheSiteKey: freezed == noCacheSiteKey
                ? _value.noCacheSiteKey
                : noCacheSiteKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            ocrHost: freezed == ocrHost
                ? _value.ocrHost
                : ocrHost // ignore: cast_nullable_to_non_nullable
                      as String?,
            browserEmulation: freezed == browserEmulation
                ? _value.browserEmulation
                : browserEmulation // ignore: cast_nullable_to_non_nullable
                      as String?,
            flaresolverrUrl: freezed == flaresolverrUrl
                ? _value.flaresolverrUrl
                : flaresolverrUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            searchMultipleName: freezed == searchMultipleName
                ? _value.searchMultipleName
                : searchMultipleName // ignore: cast_nullable_to_non_nullable
                      as bool?,
            maxSearchNameLimit: freezed == maxSearchNameLimit
                ? _value.maxSearchNameLimit
                : maxSearchNameLimit // ignore: cast_nullable_to_non_nullable
                      as int?,
            torrentTag: freezed == torrentTag
                ? _value.torrentTag
                : torrentTag // ignore: cast_nullable_to_non_nullable
                      as String?,
            downloadSubtitle: freezed == downloadSubtitle
                ? _value.downloadSubtitle
                : downloadSubtitle // ignore: cast_nullable_to_non_nullable
                      as bool?,
            autoDownloadUser: freezed == autoDownloadUser
                ? _value.autoDownloadUser
                : autoDownloadUser // ignore: cast_nullable_to_non_nullable
                      as String?,
            downloadTmpext: freezed == downloadTmpext
                ? _value.downloadTmpext
                : downloadTmpext // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            cookiecloudEnableLocal: freezed == cookiecloudEnableLocal
                ? _value.cookiecloudEnableLocal
                : cookiecloudEnableLocal // ignore: cast_nullable_to_non_nullable
                      as bool?,
            cookiecloudHost: freezed == cookiecloudHost
                ? _value.cookiecloudHost
                : cookiecloudHost // ignore: cast_nullable_to_non_nullable
                      as String?,
            cookiecloudKey: freezed == cookiecloudKey
                ? _value.cookiecloudKey
                : cookiecloudKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            cookiecloudPassword: freezed == cookiecloudPassword
                ? _value.cookiecloudPassword
                : cookiecloudPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
            cookiecloudInterval: freezed == cookiecloudInterval
                ? _value.cookiecloudInterval
                : cookiecloudInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            cookiecloudBlacklist: freezed == cookiecloudBlacklist
                ? _value.cookiecloudBlacklist
                : cookiecloudBlacklist // ignore: cast_nullable_to_non_nullable
                      as String?,
            transferThreads: freezed == transferThreads
                ? _value.transferThreads
                : transferThreads // ignore: cast_nullable_to_non_nullable
                      as int?,
            movieRenameFormat: freezed == movieRenameFormat
                ? _value.movieRenameFormat
                : movieRenameFormat // ignore: cast_nullable_to_non_nullable
                      as String?,
            tvRenameFormat: freezed == tvRenameFormat
                ? _value.tvRenameFormat
                : tvRenameFormat // ignore: cast_nullable_to_non_nullable
                      as String?,
            renameFormatS0Names: freezed == renameFormatS0Names
                ? _value.renameFormatS0Names
                : renameFormatS0Names // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            defaultSub: freezed == defaultSub
                ? _value.defaultSub
                : defaultSub // ignore: cast_nullable_to_non_nullable
                      as String?,
            scrapFollowTmdb: freezed == scrapFollowTmdb
                ? _value.scrapFollowTmdb
                : scrapFollowTmdb // ignore: cast_nullable_to_non_nullable
                      as bool?,
            mpServerHost: freezed == mpServerHost
                ? _value.mpServerHost
                : mpServerHost // ignore: cast_nullable_to_non_nullable
                      as String?,
            wallpaper: freezed == wallpaper
                ? _value.wallpaper
                : wallpaper // ignore: cast_nullable_to_non_nullable
                      as String?,
            customizeWallpaperApiUrl: freezed == customizeWallpaperApiUrl
                ? _value.customizeWallpaperApiUrl
                : customizeWallpaperApiUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginMarket: freezed == pluginMarket
                ? _value.pluginMarket
                : pluginMarket // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginStatisticShare: freezed == pluginStatisticShare
                ? _value.pluginStatisticShare
                : pluginStatisticShare // ignore: cast_nullable_to_non_nullable
                      as bool?,
            pluginAutoReload: freezed == pluginAutoReload
                ? _value.pluginAutoReload
                : pluginAutoReload // ignore: cast_nullable_to_non_nullable
                      as bool?,
            githubToken: freezed == githubToken
                ? _value.githubToken
                : githubToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            githubProxy: freezed == githubProxy
                ? _value.githubProxy
                : githubProxy // ignore: cast_nullable_to_non_nullable
                      as String?,
            pipProxy: freezed == pipProxy
                ? _value.pipProxy
                : pipProxy // ignore: cast_nullable_to_non_nullable
                      as String?,
            repoGithubToken: freezed == repoGithubToken
                ? _value.repoGithubToken
                : repoGithubToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            bigMemoryMode: freezed == bigMemoryMode
                ? _value.bigMemoryMode
                : bigMemoryMode // ignore: cast_nullable_to_non_nullable
                      as bool?,
            encodingDetectionPerformanceMode:
                freezed == encodingDetectionPerformanceMode
                ? _value.encodingDetectionPerformanceMode
                : encodingDetectionPerformanceMode // ignore: cast_nullable_to_non_nullable
                      as bool?,
            encodingDetectionMinConfidence:
                freezed == encodingDetectionMinConfidence
                ? _value.encodingDetectionMinConfidence
                : encodingDetectionMinConfidence // ignore: cast_nullable_to_non_nullable
                      as double?,
            memoryGcInterval: freezed == memoryGcInterval
                ? _value.memoryGcInterval
                : memoryGcInterval // ignore: cast_nullable_to_non_nullable
                      as int?,
            securityImageDomains: freezed == securityImageDomains
                ? _value.securityImageDomains
                : securityImageDomains // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            securityImageSuffixes: freezed == securityImageSuffixes
                ? _value.securityImageSuffixes
                : securityImageSuffixes // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            passkeyRequireUv: freezed == passkeyRequireUv
                ? _value.passkeyRequireUv
                : passkeyRequireUv // ignore: cast_nullable_to_non_nullable
                      as bool?,
            passkeyAllowRegisterWithoutOtp:
                freezed == passkeyAllowRegisterWithoutOtp
                ? _value.passkeyAllowRegisterWithoutOtp
                : passkeyAllowRegisterWithoutOtp // ignore: cast_nullable_to_non_nullable
                      as bool?,
            workflowStatisticShare: freezed == workflowStatisticShare
                ? _value.workflowStatisticShare
                : workflowStatisticShare // ignore: cast_nullable_to_non_nullable
                      as bool?,
            rcloneSnapshotCheckFolderModtime:
                freezed == rcloneSnapshotCheckFolderModtime
                ? _value.rcloneSnapshotCheckFolderModtime
                : rcloneSnapshotCheckFolderModtime // ignore: cast_nullable_to_non_nullable
                      as bool?,
            openlistSnapshotCheckFolderModtime:
                freezed == openlistSnapshotCheckFolderModtime
                ? _value.openlistSnapshotCheckFolderModtime
                : openlistSnapshotCheckFolderModtime // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dockerClientApi: freezed == dockerClientApi
                ? _value.dockerClientApi
                : dockerClientApi // ignore: cast_nullable_to_non_nullable
                      as String?,
            playwrightBrowserType: freezed == playwrightBrowserType
                ? _value.playwrightBrowserType
                : playwrightBrowserType // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiAgentEnable: freezed == aiAgentEnable
                ? _value.aiAgentEnable
                : aiAgentEnable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            aiAgentGlobal: freezed == aiAgentGlobal
                ? _value.aiAgentGlobal
                : aiAgentGlobal // ignore: cast_nullable_to_non_nullable
                      as bool?,
            llmProvider: freezed == llmProvider
                ? _value.llmProvider
                : llmProvider // ignore: cast_nullable_to_non_nullable
                      as String?,
            llmModel: freezed == llmModel
                ? _value.llmModel
                : llmModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            llmApiKey: freezed == llmApiKey
                ? _value.llmApiKey
                : llmApiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            llmBaseUrl: freezed == llmBaseUrl
                ? _value.llmBaseUrl
                : llmBaseUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            llmMaxContextTokens: freezed == llmMaxContextTokens
                ? _value.llmMaxContextTokens
                : llmMaxContextTokens // ignore: cast_nullable_to_non_nullable
                      as int?,
            llmTemperature: freezed == llmTemperature
                ? _value.llmTemperature
                : llmTemperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            llmMaxIterations: freezed == llmMaxIterations
                ? _value.llmMaxIterations
                : llmMaxIterations // ignore: cast_nullable_to_non_nullable
                      as int?,
            llmToolTimeout: freezed == llmToolTimeout
                ? _value.llmToolTimeout
                : llmToolTimeout // ignore: cast_nullable_to_non_nullable
                      as int?,
            llmVerbose: freezed == llmVerbose
                ? _value.llmVerbose
                : llmVerbose // ignore: cast_nullable_to_non_nullable
                      as bool?,
            llmMaxMemoryMessages: freezed == llmMaxMemoryMessages
                ? _value.llmMaxMemoryMessages
                : llmMaxMemoryMessages // ignore: cast_nullable_to_non_nullable
                      as int?,
            llmMemoryRetentionDays: freezed == llmMemoryRetentionDays
                ? _value.llmMemoryRetentionDays
                : llmMemoryRetentionDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            llmRedisMemoryRetentionDays: freezed == llmRedisMemoryRetentionDays
                ? _value.llmRedisMemoryRetentionDays
                : llmRedisMemoryRetentionDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            aiRecommendEnabled: freezed == aiRecommendEnabled
                ? _value.aiRecommendEnabled
                : aiRecommendEnabled // ignore: cast_nullable_to_non_nullable
                      as bool?,
            aiRecommendUserPreference: freezed == aiRecommendUserPreference
                ? _value.aiRecommendUserPreference
                : aiRecommendUserPreference // ignore: cast_nullable_to_non_nullable
                      as String?,
            tavilyApiKey: freezed == tavilyApiKey
                ? _value.tavilyApiKey
                : tavilyApiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiRecommendMaxItems: freezed == aiRecommendMaxItems
                ? _value.aiRecommendMaxItems
                : aiRecommendMaxItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            version: freezed == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String?,
            authVersion: freezed == authVersion
                ? _value.authVersion
                : authVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            indexerVersion: freezed == indexerVersion
                ? _value.indexerVersion
                : indexerVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            frontendVersion: freezed == frontendVersion
                ? _value.frontendVersion
                : frontendVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemEnvDataImplCopyWith<$Res>
    implements $SystemEnvDataCopyWith<$Res> {
  factory _$$SystemEnvDataImplCopyWith(
    _$SystemEnvDataImpl value,
    $Res Function(_$SystemEnvDataImpl) then,
  ) = __$$SystemEnvDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'CONFIG_DIR') String? configDir,
    @JsonKey(name: 'DEBUG', fromJson: _boolFromJson) bool? debug,
    @JsonKey(name: 'LOG_LEVEL') String? logLevel,
    @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
    int? logMaxFileSize,
    @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
    int? logBackupCount,
    @JsonKey(name: 'LOG_CONSOLE_FORMAT') String? logConsoleFormat,
    @JsonKey(name: 'LOG_FILE_FORMAT') String? logFileFormat,
    @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
    int? asyncFileQueueSize,
    @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
    int? asyncFileWorkers,
    @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
    int? batchWriteSize,
    @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
    double? writeTimeout,
    @JsonKey(name: 'PROJECT_NAME') String? projectName,
    @JsonKey(name: 'APP_DOMAIN') String? appDomain,
    @JsonKey(name: 'API_V1_STR') String? apiV1Str,
    @JsonKey(name: 'FRONTEND_PATH') String? frontendPath,
    @JsonKey(name: 'TZ') String? tz,
    @JsonKey(name: 'HOST') String? host,
    @JsonKey(name: 'PORT', fromJson: _intFromJson) int? port,
    @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson) int? nginxPort,
    @JsonKey(name: 'DEV', fromJson: _boolFromJson) bool? dev,
    @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson) bool? advancedMode,
    @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
    List<String>? allowedHosts,
    @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
    int? accessTokenExpireMinutes,
    @JsonKey(
      name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS',
      fromJson: _intFromJson,
    )
    int? resourceAccessTokenExpireSeconds,
    @JsonKey(name: 'SUPERUSER') String? superuser,
    @JsonKey(name: 'SUPERUSER_PASSWORD') String? superuserPassword,
    @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
    bool? auxiliaryAuthEnable,
    @JsonKey(name: 'API_TOKEN') String? apiToken,
    @JsonKey(name: 'AUTH_SITE') String? authSite,
    @JsonKey(name: 'DB_TYPE') String? dbType,
    @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson) bool? dbEcho,
    @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson) int? dbTimeout,
    @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson) bool? dbWalEnable,
    @JsonKey(name: 'DB_POOL_TYPE') String? dbPoolType,
    @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
    bool? dbPoolPrePing,
    @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
    int? dbPoolRecycle,
    @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
    int? dbPoolTimeout,
    @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
    int? dbSqlitePoolSize,
    @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
    int? dbSqliteMaxOverflow,
    @JsonKey(name: 'DB_POSTGRESQL_HOST') String? dbPostgresqlHost,
    @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
    int? dbPostgresqlPort,
    @JsonKey(name: 'DB_POSTGRESQL_DATABASE') String? dbPostgresqlDatabase,
    @JsonKey(name: 'DB_POSTGRESQL_USERNAME') String? dbPostgresqlUsername,
    @JsonKey(name: 'DB_POSTGRESQL_PASSWORD') String? dbPostgresqlPassword,
    @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
    int? dbPostgresqlPoolSize,
    @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
    int? dbPostgresqlMaxOverflow,
    @JsonKey(name: 'CACHE_BACKEND_TYPE') String? cacheBackendType,
    @JsonKey(name: 'CACHE_BACKEND_URL') String? cacheBackendUrl,
    @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
    int? cacheRedisMaxmemory,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
    bool? globalImageCache,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
    int? globalImageCacheDays,
    @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson) int? tempFileDays,
    @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
    int? metaCacheExpire,
    @JsonKey(name: 'PROXY_HOST') String? proxyHost,
    @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson) bool? dohEnable,
    @JsonKey(name: 'DOH_DOMAINS') String? dohDomains,
    @JsonKey(name: 'DOH_RESOLVERS') String? dohResolvers,
    @JsonKey(name: 'SEARCH_SOURCE') String? searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') String? recognizeSource,
    @JsonKey(name: 'SCRAP_SOURCE') String? scrapSource,
    @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
    List<int>? animeGenreIds,
    @JsonKey(name: 'TMDB_IMAGE_DOMAIN') String? tmdbImageDomain,
    @JsonKey(name: 'TMDB_API_DOMAIN') String? tmdbApiDomain,
    @JsonKey(name: 'TMDB_LOCALE') String? tmdbLocale,
    @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
    bool? tmdbScrapOriginalImage,
    @JsonKey(name: 'TMDB_API_KEY') String? tmdbApiKey,
    @JsonKey(name: 'TVDB_V4_API_KEY') String? tvdbV4ApiKey,
    @JsonKey(name: 'TVDB_V4_API_PIN') String? tvdbV4ApiPin,
    @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson) bool? fanartEnable,
    @JsonKey(name: 'FANART_LANG') String? fanartLang,
    @JsonKey(name: 'FANART_API_KEY') String? fanartApiKey,
    @JsonKey(name: 'U115_APP_ID') String? u115AppId,
    @JsonKey(name: 'U115_AUTH_SERVER') String? u115AuthServer,
    @JsonKey(name: 'ALIPAN_APP_ID') String? alipanAppId,
    @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE') String? moviepilotAutoUpdate,
    @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
    bool? autoUpdateResource,
    @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
    List<String>? rmtMediaext,
    @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
    List<String>? rmtSubext,
    @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
    List<String>? rmtAudioext,
    @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
    int? mediaserverSyncInterval,
    @JsonKey(name: 'SUBSCRIBE_MODE') String? subscribeMode,
    @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
    int? subscribeRssInterval,
    @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? subscribeStatisticShare,
    @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
    bool? subscribeSearch,
    @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
    int? subscribeSearchInterval,
    @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
    bool? localExistsSearch,
    @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
    int? sitedataRefreshInterval,
    @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson) bool? siteMessage,
    @JsonKey(name: 'NO_CACHE_SITE_KEY') String? noCacheSiteKey,
    @JsonKey(name: 'OCR_HOST') String? ocrHost,
    @JsonKey(name: 'BROWSER_EMULATION') String? browserEmulation,
    @JsonKey(name: 'FLARESOLVERR_URL') String? flaresolverrUrl,
    @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
    bool? searchMultipleName,
    @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
    int? maxSearchNameLimit,
    @JsonKey(name: 'TORRENT_TAG') String? torrentTag,
    @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
    bool? downloadSubtitle,
    @JsonKey(name: 'AUTO_DOWNLOAD_USER') String? autoDownloadUser,
    @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
    List<String>? downloadTmpext,
    @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
    bool? cookiecloudEnableLocal,
    @JsonKey(name: 'COOKIECLOUD_HOST') String? cookiecloudHost,
    @JsonKey(name: 'COOKIECLOUD_KEY') String? cookiecloudKey,
    @JsonKey(name: 'COOKIECLOUD_PASSWORD') String? cookiecloudPassword,
    @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
    int? cookiecloudInterval,
    @JsonKey(name: 'COOKIECLOUD_BLACKLIST') String? cookiecloudBlacklist,
    @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
    int? transferThreads,
    @JsonKey(name: 'MOVIE_RENAME_FORMAT') String? movieRenameFormat,
    @JsonKey(name: 'TV_RENAME_FORMAT') String? tvRenameFormat,
    @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
    List<String>? renameFormatS0Names,
    @JsonKey(name: 'DEFAULT_SUB') String? defaultSub,
    @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
    bool? scrapFollowTmdb,
    @JsonKey(name: 'MP_SERVER_HOST') String? mpServerHost,
    @JsonKey(name: 'WALLPAPER') String? wallpaper,
    @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
    String? customizeWallpaperApiUrl,
    @JsonKey(name: 'PLUGIN_MARKET') String? pluginMarket,
    @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? pluginStatisticShare,
    @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
    bool? pluginAutoReload,
    @JsonKey(name: 'GITHUB_TOKEN') String? githubToken,
    @JsonKey(name: 'GITHUB_PROXY') String? githubProxy,
    @JsonKey(name: 'PIP_PROXY') String? pipProxy,
    @JsonKey(name: 'REPO_GITHUB_TOKEN') String? repoGithubToken,
    @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
    bool? bigMemoryMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_PERFORMANCE_MODE',
      fromJson: _boolFromJson,
    )
    bool? encodingDetectionPerformanceMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_MIN_CONFIDENCE',
      fromJson: _doubleFromJson,
    )
    double? encodingDetectionMinConfidence,
    @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
    int? memoryGcInterval,
    @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
    List<String>? securityImageDomains,
    @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
    List<String>? securityImageSuffixes,
    @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
    bool? passkeyRequireUv,
    @JsonKey(
      name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP',
      fromJson: _boolFromJson,
    )
    bool? passkeyAllowRegisterWithoutOtp,
    @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
    bool? workflowStatisticShare,
    @JsonKey(
      name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    bool? rcloneSnapshotCheckFolderModtime,
    @JsonKey(
      name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    bool? openlistSnapshotCheckFolderModtime,
    @JsonKey(name: 'DOCKER_CLIENT_API') String? dockerClientApi,
    @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE') String? playwrightBrowserType,
    @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
    bool? aiAgentEnable,
    @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
    bool? aiAgentGlobal,
    @JsonKey(name: 'LLM_PROVIDER') String? llmProvider,
    @JsonKey(name: 'LLM_MODEL') String? llmModel,
    @JsonKey(name: 'LLM_API_KEY') String? llmApiKey,
    @JsonKey(name: 'LLM_BASE_URL') String? llmBaseUrl,
    @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
    int? llmMaxContextTokens,
    @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
    double? llmTemperature,
    @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
    int? llmMaxIterations,
    @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
    int? llmToolTimeout,
    @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson) bool? llmVerbose,
    @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
    int? llmMaxMemoryMessages,
    @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    int? llmMemoryRetentionDays,
    @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    int? llmRedisMemoryRetentionDays,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
    bool? aiRecommendEnabled,
    @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
    String? aiRecommendUserPreference,
    @JsonKey(name: 'TAVILY_API_KEY') String? tavilyApiKey,
    @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
    int? aiRecommendMaxItems,
    @JsonKey(name: 'VERSION') String? version,
    @JsonKey(name: 'AUTH_VERSION') String? authVersion,
    @JsonKey(name: 'INDEXER_VERSION') String? indexerVersion,
    @JsonKey(name: 'FRONTEND_VERSION') String? frontendVersion,
  });
}

/// @nodoc
class __$$SystemEnvDataImplCopyWithImpl<$Res>
    extends _$SystemEnvDataCopyWithImpl<$Res, _$SystemEnvDataImpl>
    implements _$$SystemEnvDataImplCopyWith<$Res> {
  __$$SystemEnvDataImplCopyWithImpl(
    _$SystemEnvDataImpl _value,
    $Res Function(_$SystemEnvDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemEnvData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configDir = freezed,
    Object? debug = freezed,
    Object? logLevel = freezed,
    Object? logMaxFileSize = freezed,
    Object? logBackupCount = freezed,
    Object? logConsoleFormat = freezed,
    Object? logFileFormat = freezed,
    Object? asyncFileQueueSize = freezed,
    Object? asyncFileWorkers = freezed,
    Object? batchWriteSize = freezed,
    Object? writeTimeout = freezed,
    Object? projectName = freezed,
    Object? appDomain = freezed,
    Object? apiV1Str = freezed,
    Object? frontendPath = freezed,
    Object? tz = freezed,
    Object? host = freezed,
    Object? port = freezed,
    Object? nginxPort = freezed,
    Object? dev = freezed,
    Object? advancedMode = freezed,
    Object? allowedHosts = freezed,
    Object? accessTokenExpireMinutes = freezed,
    Object? resourceAccessTokenExpireSeconds = freezed,
    Object? superuser = freezed,
    Object? superuserPassword = freezed,
    Object? auxiliaryAuthEnable = freezed,
    Object? apiToken = freezed,
    Object? authSite = freezed,
    Object? dbType = freezed,
    Object? dbEcho = freezed,
    Object? dbTimeout = freezed,
    Object? dbWalEnable = freezed,
    Object? dbPoolType = freezed,
    Object? dbPoolPrePing = freezed,
    Object? dbPoolRecycle = freezed,
    Object? dbPoolTimeout = freezed,
    Object? dbSqlitePoolSize = freezed,
    Object? dbSqliteMaxOverflow = freezed,
    Object? dbPostgresqlHost = freezed,
    Object? dbPostgresqlPort = freezed,
    Object? dbPostgresqlDatabase = freezed,
    Object? dbPostgresqlUsername = freezed,
    Object? dbPostgresqlPassword = freezed,
    Object? dbPostgresqlPoolSize = freezed,
    Object? dbPostgresqlMaxOverflow = freezed,
    Object? cacheBackendType = freezed,
    Object? cacheBackendUrl = freezed,
    Object? cacheRedisMaxmemory = freezed,
    Object? globalImageCache = freezed,
    Object? globalImageCacheDays = freezed,
    Object? tempFileDays = freezed,
    Object? metaCacheExpire = freezed,
    Object? proxyHost = freezed,
    Object? dohEnable = freezed,
    Object? dohDomains = freezed,
    Object? dohResolvers = freezed,
    Object? searchSource = freezed,
    Object? recognizeSource = freezed,
    Object? scrapSource = freezed,
    Object? animeGenreIds = freezed,
    Object? tmdbImageDomain = freezed,
    Object? tmdbApiDomain = freezed,
    Object? tmdbLocale = freezed,
    Object? tmdbScrapOriginalImage = freezed,
    Object? tmdbApiKey = freezed,
    Object? tvdbV4ApiKey = freezed,
    Object? tvdbV4ApiPin = freezed,
    Object? fanartEnable = freezed,
    Object? fanartLang = freezed,
    Object? fanartApiKey = freezed,
    Object? u115AppId = freezed,
    Object? u115AuthServer = freezed,
    Object? alipanAppId = freezed,
    Object? moviepilotAutoUpdate = freezed,
    Object? autoUpdateResource = freezed,
    Object? rmtMediaext = freezed,
    Object? rmtSubext = freezed,
    Object? rmtAudioext = freezed,
    Object? mediaserverSyncInterval = freezed,
    Object? subscribeMode = freezed,
    Object? subscribeRssInterval = freezed,
    Object? subscribeStatisticShare = freezed,
    Object? subscribeSearch = freezed,
    Object? subscribeSearchInterval = freezed,
    Object? localExistsSearch = freezed,
    Object? sitedataRefreshInterval = freezed,
    Object? siteMessage = freezed,
    Object? noCacheSiteKey = freezed,
    Object? ocrHost = freezed,
    Object? browserEmulation = freezed,
    Object? flaresolverrUrl = freezed,
    Object? searchMultipleName = freezed,
    Object? maxSearchNameLimit = freezed,
    Object? torrentTag = freezed,
    Object? downloadSubtitle = freezed,
    Object? autoDownloadUser = freezed,
    Object? downloadTmpext = freezed,
    Object? cookiecloudEnableLocal = freezed,
    Object? cookiecloudHost = freezed,
    Object? cookiecloudKey = freezed,
    Object? cookiecloudPassword = freezed,
    Object? cookiecloudInterval = freezed,
    Object? cookiecloudBlacklist = freezed,
    Object? transferThreads = freezed,
    Object? movieRenameFormat = freezed,
    Object? tvRenameFormat = freezed,
    Object? renameFormatS0Names = freezed,
    Object? defaultSub = freezed,
    Object? scrapFollowTmdb = freezed,
    Object? mpServerHost = freezed,
    Object? wallpaper = freezed,
    Object? customizeWallpaperApiUrl = freezed,
    Object? pluginMarket = freezed,
    Object? pluginStatisticShare = freezed,
    Object? pluginAutoReload = freezed,
    Object? githubToken = freezed,
    Object? githubProxy = freezed,
    Object? pipProxy = freezed,
    Object? repoGithubToken = freezed,
    Object? bigMemoryMode = freezed,
    Object? encodingDetectionPerformanceMode = freezed,
    Object? encodingDetectionMinConfidence = freezed,
    Object? memoryGcInterval = freezed,
    Object? securityImageDomains = freezed,
    Object? securityImageSuffixes = freezed,
    Object? passkeyRequireUv = freezed,
    Object? passkeyAllowRegisterWithoutOtp = freezed,
    Object? workflowStatisticShare = freezed,
    Object? rcloneSnapshotCheckFolderModtime = freezed,
    Object? openlistSnapshotCheckFolderModtime = freezed,
    Object? dockerClientApi = freezed,
    Object? playwrightBrowserType = freezed,
    Object? aiAgentEnable = freezed,
    Object? aiAgentGlobal = freezed,
    Object? llmProvider = freezed,
    Object? llmModel = freezed,
    Object? llmApiKey = freezed,
    Object? llmBaseUrl = freezed,
    Object? llmMaxContextTokens = freezed,
    Object? llmTemperature = freezed,
    Object? llmMaxIterations = freezed,
    Object? llmToolTimeout = freezed,
    Object? llmVerbose = freezed,
    Object? llmMaxMemoryMessages = freezed,
    Object? llmMemoryRetentionDays = freezed,
    Object? llmRedisMemoryRetentionDays = freezed,
    Object? aiRecommendEnabled = freezed,
    Object? aiRecommendUserPreference = freezed,
    Object? tavilyApiKey = freezed,
    Object? aiRecommendMaxItems = freezed,
    Object? version = freezed,
    Object? authVersion = freezed,
    Object? indexerVersion = freezed,
    Object? frontendVersion = freezed,
  }) {
    return _then(
      _$SystemEnvDataImpl(
        configDir: freezed == configDir
            ? _value.configDir
            : configDir // ignore: cast_nullable_to_non_nullable
                  as String?,
        debug: freezed == debug
            ? _value.debug
            : debug // ignore: cast_nullable_to_non_nullable
                  as bool?,
        logLevel: freezed == logLevel
            ? _value.logLevel
            : logLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        logMaxFileSize: freezed == logMaxFileSize
            ? _value.logMaxFileSize
            : logMaxFileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        logBackupCount: freezed == logBackupCount
            ? _value.logBackupCount
            : logBackupCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        logConsoleFormat: freezed == logConsoleFormat
            ? _value.logConsoleFormat
            : logConsoleFormat // ignore: cast_nullable_to_non_nullable
                  as String?,
        logFileFormat: freezed == logFileFormat
            ? _value.logFileFormat
            : logFileFormat // ignore: cast_nullable_to_non_nullable
                  as String?,
        asyncFileQueueSize: freezed == asyncFileQueueSize
            ? _value.asyncFileQueueSize
            : asyncFileQueueSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        asyncFileWorkers: freezed == asyncFileWorkers
            ? _value.asyncFileWorkers
            : asyncFileWorkers // ignore: cast_nullable_to_non_nullable
                  as int?,
        batchWriteSize: freezed == batchWriteSize
            ? _value.batchWriteSize
            : batchWriteSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        writeTimeout: freezed == writeTimeout
            ? _value.writeTimeout
            : writeTimeout // ignore: cast_nullable_to_non_nullable
                  as double?,
        projectName: freezed == projectName
            ? _value.projectName
            : projectName // ignore: cast_nullable_to_non_nullable
                  as String?,
        appDomain: freezed == appDomain
            ? _value.appDomain
            : appDomain // ignore: cast_nullable_to_non_nullable
                  as String?,
        apiV1Str: freezed == apiV1Str
            ? _value.apiV1Str
            : apiV1Str // ignore: cast_nullable_to_non_nullable
                  as String?,
        frontendPath: freezed == frontendPath
            ? _value.frontendPath
            : frontendPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        tz: freezed == tz
            ? _value.tz
            : tz // ignore: cast_nullable_to_non_nullable
                  as String?,
        host: freezed == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as String?,
        port: freezed == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int?,
        nginxPort: freezed == nginxPort
            ? _value.nginxPort
            : nginxPort // ignore: cast_nullable_to_non_nullable
                  as int?,
        dev: freezed == dev
            ? _value.dev
            : dev // ignore: cast_nullable_to_non_nullable
                  as bool?,
        advancedMode: freezed == advancedMode
            ? _value.advancedMode
            : advancedMode // ignore: cast_nullable_to_non_nullable
                  as bool?,
        allowedHosts: freezed == allowedHosts
            ? _value._allowedHosts
            : allowedHosts // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        accessTokenExpireMinutes: freezed == accessTokenExpireMinutes
            ? _value.accessTokenExpireMinutes
            : accessTokenExpireMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        resourceAccessTokenExpireSeconds:
            freezed == resourceAccessTokenExpireSeconds
            ? _value.resourceAccessTokenExpireSeconds
            : resourceAccessTokenExpireSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        superuser: freezed == superuser
            ? _value.superuser
            : superuser // ignore: cast_nullable_to_non_nullable
                  as String?,
        superuserPassword: freezed == superuserPassword
            ? _value.superuserPassword
            : superuserPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
        auxiliaryAuthEnable: freezed == auxiliaryAuthEnable
            ? _value.auxiliaryAuthEnable
            : auxiliaryAuthEnable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        apiToken: freezed == apiToken
            ? _value.apiToken
            : apiToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        authSite: freezed == authSite
            ? _value.authSite
            : authSite // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbType: freezed == dbType
            ? _value.dbType
            : dbType // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbEcho: freezed == dbEcho
            ? _value.dbEcho
            : dbEcho // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dbTimeout: freezed == dbTimeout
            ? _value.dbTimeout
            : dbTimeout // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbWalEnable: freezed == dbWalEnable
            ? _value.dbWalEnable
            : dbWalEnable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dbPoolType: freezed == dbPoolType
            ? _value.dbPoolType
            : dbPoolType // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbPoolPrePing: freezed == dbPoolPrePing
            ? _value.dbPoolPrePing
            : dbPoolPrePing // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dbPoolRecycle: freezed == dbPoolRecycle
            ? _value.dbPoolRecycle
            : dbPoolRecycle // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbPoolTimeout: freezed == dbPoolTimeout
            ? _value.dbPoolTimeout
            : dbPoolTimeout // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbSqlitePoolSize: freezed == dbSqlitePoolSize
            ? _value.dbSqlitePoolSize
            : dbSqlitePoolSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbSqliteMaxOverflow: freezed == dbSqliteMaxOverflow
            ? _value.dbSqliteMaxOverflow
            : dbSqliteMaxOverflow // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbPostgresqlHost: freezed == dbPostgresqlHost
            ? _value.dbPostgresqlHost
            : dbPostgresqlHost // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbPostgresqlPort: freezed == dbPostgresqlPort
            ? _value.dbPostgresqlPort
            : dbPostgresqlPort // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbPostgresqlDatabase: freezed == dbPostgresqlDatabase
            ? _value.dbPostgresqlDatabase
            : dbPostgresqlDatabase // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbPostgresqlUsername: freezed == dbPostgresqlUsername
            ? _value.dbPostgresqlUsername
            : dbPostgresqlUsername // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbPostgresqlPassword: freezed == dbPostgresqlPassword
            ? _value.dbPostgresqlPassword
            : dbPostgresqlPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
        dbPostgresqlPoolSize: freezed == dbPostgresqlPoolSize
            ? _value.dbPostgresqlPoolSize
            : dbPostgresqlPoolSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        dbPostgresqlMaxOverflow: freezed == dbPostgresqlMaxOverflow
            ? _value.dbPostgresqlMaxOverflow
            : dbPostgresqlMaxOverflow // ignore: cast_nullable_to_non_nullable
                  as int?,
        cacheBackendType: freezed == cacheBackendType
            ? _value.cacheBackendType
            : cacheBackendType // ignore: cast_nullable_to_non_nullable
                  as String?,
        cacheBackendUrl: freezed == cacheBackendUrl
            ? _value.cacheBackendUrl
            : cacheBackendUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        cacheRedisMaxmemory: freezed == cacheRedisMaxmemory
            ? _value.cacheRedisMaxmemory
            : cacheRedisMaxmemory // ignore: cast_nullable_to_non_nullable
                  as int?,
        globalImageCache: freezed == globalImageCache
            ? _value.globalImageCache
            : globalImageCache // ignore: cast_nullable_to_non_nullable
                  as bool?,
        globalImageCacheDays: freezed == globalImageCacheDays
            ? _value.globalImageCacheDays
            : globalImageCacheDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        tempFileDays: freezed == tempFileDays
            ? _value.tempFileDays
            : tempFileDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        metaCacheExpire: freezed == metaCacheExpire
            ? _value.metaCacheExpire
            : metaCacheExpire // ignore: cast_nullable_to_non_nullable
                  as int?,
        proxyHost: freezed == proxyHost
            ? _value.proxyHost
            : proxyHost // ignore: cast_nullable_to_non_nullable
                  as String?,
        dohEnable: freezed == dohEnable
            ? _value.dohEnable
            : dohEnable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dohDomains: freezed == dohDomains
            ? _value.dohDomains
            : dohDomains // ignore: cast_nullable_to_non_nullable
                  as String?,
        dohResolvers: freezed == dohResolvers
            ? _value.dohResolvers
            : dohResolvers // ignore: cast_nullable_to_non_nullable
                  as String?,
        searchSource: freezed == searchSource
            ? _value.searchSource
            : searchSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        recognizeSource: freezed == recognizeSource
            ? _value.recognizeSource
            : recognizeSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        scrapSource: freezed == scrapSource
            ? _value.scrapSource
            : scrapSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        animeGenreIds: freezed == animeGenreIds
            ? _value._animeGenreIds
            : animeGenreIds // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        tmdbImageDomain: freezed == tmdbImageDomain
            ? _value.tmdbImageDomain
            : tmdbImageDomain // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbApiDomain: freezed == tmdbApiDomain
            ? _value.tmdbApiDomain
            : tmdbApiDomain // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbLocale: freezed == tmdbLocale
            ? _value.tmdbLocale
            : tmdbLocale // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbScrapOriginalImage: freezed == tmdbScrapOriginalImage
            ? _value.tmdbScrapOriginalImage
            : tmdbScrapOriginalImage // ignore: cast_nullable_to_non_nullable
                  as bool?,
        tmdbApiKey: freezed == tmdbApiKey
            ? _value.tmdbApiKey
            : tmdbApiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        tvdbV4ApiKey: freezed == tvdbV4ApiKey
            ? _value.tvdbV4ApiKey
            : tvdbV4ApiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        tvdbV4ApiPin: freezed == tvdbV4ApiPin
            ? _value.tvdbV4ApiPin
            : tvdbV4ApiPin // ignore: cast_nullable_to_non_nullable
                  as String?,
        fanartEnable: freezed == fanartEnable
            ? _value.fanartEnable
            : fanartEnable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        fanartLang: freezed == fanartLang
            ? _value.fanartLang
            : fanartLang // ignore: cast_nullable_to_non_nullable
                  as String?,
        fanartApiKey: freezed == fanartApiKey
            ? _value.fanartApiKey
            : fanartApiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        u115AppId: freezed == u115AppId
            ? _value.u115AppId
            : u115AppId // ignore: cast_nullable_to_non_nullable
                  as String?,
        u115AuthServer: freezed == u115AuthServer
            ? _value.u115AuthServer
            : u115AuthServer // ignore: cast_nullable_to_non_nullable
                  as String?,
        alipanAppId: freezed == alipanAppId
            ? _value.alipanAppId
            : alipanAppId // ignore: cast_nullable_to_non_nullable
                  as String?,
        moviepilotAutoUpdate: freezed == moviepilotAutoUpdate
            ? _value.moviepilotAutoUpdate
            : moviepilotAutoUpdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        autoUpdateResource: freezed == autoUpdateResource
            ? _value.autoUpdateResource
            : autoUpdateResource // ignore: cast_nullable_to_non_nullable
                  as bool?,
        rmtMediaext: freezed == rmtMediaext
            ? _value._rmtMediaext
            : rmtMediaext // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        rmtSubext: freezed == rmtSubext
            ? _value._rmtSubext
            : rmtSubext // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        rmtAudioext: freezed == rmtAudioext
            ? _value._rmtAudioext
            : rmtAudioext // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        mediaserverSyncInterval: freezed == mediaserverSyncInterval
            ? _value.mediaserverSyncInterval
            : mediaserverSyncInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscribeMode: freezed == subscribeMode
            ? _value.subscribeMode
            : subscribeMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        subscribeRssInterval: freezed == subscribeRssInterval
            ? _value.subscribeRssInterval
            : subscribeRssInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscribeStatisticShare: freezed == subscribeStatisticShare
            ? _value.subscribeStatisticShare
            : subscribeStatisticShare // ignore: cast_nullable_to_non_nullable
                  as bool?,
        subscribeSearch: freezed == subscribeSearch
            ? _value.subscribeSearch
            : subscribeSearch // ignore: cast_nullable_to_non_nullable
                  as bool?,
        subscribeSearchInterval: freezed == subscribeSearchInterval
            ? _value.subscribeSearchInterval
            : subscribeSearchInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        localExistsSearch: freezed == localExistsSearch
            ? _value.localExistsSearch
            : localExistsSearch // ignore: cast_nullable_to_non_nullable
                  as bool?,
        sitedataRefreshInterval: freezed == sitedataRefreshInterval
            ? _value.sitedataRefreshInterval
            : sitedataRefreshInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        siteMessage: freezed == siteMessage
            ? _value.siteMessage
            : siteMessage // ignore: cast_nullable_to_non_nullable
                  as bool?,
        noCacheSiteKey: freezed == noCacheSiteKey
            ? _value.noCacheSiteKey
            : noCacheSiteKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        ocrHost: freezed == ocrHost
            ? _value.ocrHost
            : ocrHost // ignore: cast_nullable_to_non_nullable
                  as String?,
        browserEmulation: freezed == browserEmulation
            ? _value.browserEmulation
            : browserEmulation // ignore: cast_nullable_to_non_nullable
                  as String?,
        flaresolverrUrl: freezed == flaresolverrUrl
            ? _value.flaresolverrUrl
            : flaresolverrUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        searchMultipleName: freezed == searchMultipleName
            ? _value.searchMultipleName
            : searchMultipleName // ignore: cast_nullable_to_non_nullable
                  as bool?,
        maxSearchNameLimit: freezed == maxSearchNameLimit
            ? _value.maxSearchNameLimit
            : maxSearchNameLimit // ignore: cast_nullable_to_non_nullable
                  as int?,
        torrentTag: freezed == torrentTag
            ? _value.torrentTag
            : torrentTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        downloadSubtitle: freezed == downloadSubtitle
            ? _value.downloadSubtitle
            : downloadSubtitle // ignore: cast_nullable_to_non_nullable
                  as bool?,
        autoDownloadUser: freezed == autoDownloadUser
            ? _value.autoDownloadUser
            : autoDownloadUser // ignore: cast_nullable_to_non_nullable
                  as String?,
        downloadTmpext: freezed == downloadTmpext
            ? _value._downloadTmpext
            : downloadTmpext // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        cookiecloudEnableLocal: freezed == cookiecloudEnableLocal
            ? _value.cookiecloudEnableLocal
            : cookiecloudEnableLocal // ignore: cast_nullable_to_non_nullable
                  as bool?,
        cookiecloudHost: freezed == cookiecloudHost
            ? _value.cookiecloudHost
            : cookiecloudHost // ignore: cast_nullable_to_non_nullable
                  as String?,
        cookiecloudKey: freezed == cookiecloudKey
            ? _value.cookiecloudKey
            : cookiecloudKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        cookiecloudPassword: freezed == cookiecloudPassword
            ? _value.cookiecloudPassword
            : cookiecloudPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
        cookiecloudInterval: freezed == cookiecloudInterval
            ? _value.cookiecloudInterval
            : cookiecloudInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        cookiecloudBlacklist: freezed == cookiecloudBlacklist
            ? _value.cookiecloudBlacklist
            : cookiecloudBlacklist // ignore: cast_nullable_to_non_nullable
                  as String?,
        transferThreads: freezed == transferThreads
            ? _value.transferThreads
            : transferThreads // ignore: cast_nullable_to_non_nullable
                  as int?,
        movieRenameFormat: freezed == movieRenameFormat
            ? _value.movieRenameFormat
            : movieRenameFormat // ignore: cast_nullable_to_non_nullable
                  as String?,
        tvRenameFormat: freezed == tvRenameFormat
            ? _value.tvRenameFormat
            : tvRenameFormat // ignore: cast_nullable_to_non_nullable
                  as String?,
        renameFormatS0Names: freezed == renameFormatS0Names
            ? _value._renameFormatS0Names
            : renameFormatS0Names // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        defaultSub: freezed == defaultSub
            ? _value.defaultSub
            : defaultSub // ignore: cast_nullable_to_non_nullable
                  as String?,
        scrapFollowTmdb: freezed == scrapFollowTmdb
            ? _value.scrapFollowTmdb
            : scrapFollowTmdb // ignore: cast_nullable_to_non_nullable
                  as bool?,
        mpServerHost: freezed == mpServerHost
            ? _value.mpServerHost
            : mpServerHost // ignore: cast_nullable_to_non_nullable
                  as String?,
        wallpaper: freezed == wallpaper
            ? _value.wallpaper
            : wallpaper // ignore: cast_nullable_to_non_nullable
                  as String?,
        customizeWallpaperApiUrl: freezed == customizeWallpaperApiUrl
            ? _value.customizeWallpaperApiUrl
            : customizeWallpaperApiUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginMarket: freezed == pluginMarket
            ? _value.pluginMarket
            : pluginMarket // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginStatisticShare: freezed == pluginStatisticShare
            ? _value.pluginStatisticShare
            : pluginStatisticShare // ignore: cast_nullable_to_non_nullable
                  as bool?,
        pluginAutoReload: freezed == pluginAutoReload
            ? _value.pluginAutoReload
            : pluginAutoReload // ignore: cast_nullable_to_non_nullable
                  as bool?,
        githubToken: freezed == githubToken
            ? _value.githubToken
            : githubToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        githubProxy: freezed == githubProxy
            ? _value.githubProxy
            : githubProxy // ignore: cast_nullable_to_non_nullable
                  as String?,
        pipProxy: freezed == pipProxy
            ? _value.pipProxy
            : pipProxy // ignore: cast_nullable_to_non_nullable
                  as String?,
        repoGithubToken: freezed == repoGithubToken
            ? _value.repoGithubToken
            : repoGithubToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        bigMemoryMode: freezed == bigMemoryMode
            ? _value.bigMemoryMode
            : bigMemoryMode // ignore: cast_nullable_to_non_nullable
                  as bool?,
        encodingDetectionPerformanceMode:
            freezed == encodingDetectionPerformanceMode
            ? _value.encodingDetectionPerformanceMode
            : encodingDetectionPerformanceMode // ignore: cast_nullable_to_non_nullable
                  as bool?,
        encodingDetectionMinConfidence:
            freezed == encodingDetectionMinConfidence
            ? _value.encodingDetectionMinConfidence
            : encodingDetectionMinConfidence // ignore: cast_nullable_to_non_nullable
                  as double?,
        memoryGcInterval: freezed == memoryGcInterval
            ? _value.memoryGcInterval
            : memoryGcInterval // ignore: cast_nullable_to_non_nullable
                  as int?,
        securityImageDomains: freezed == securityImageDomains
            ? _value._securityImageDomains
            : securityImageDomains // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        securityImageSuffixes: freezed == securityImageSuffixes
            ? _value._securityImageSuffixes
            : securityImageSuffixes // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        passkeyRequireUv: freezed == passkeyRequireUv
            ? _value.passkeyRequireUv
            : passkeyRequireUv // ignore: cast_nullable_to_non_nullable
                  as bool?,
        passkeyAllowRegisterWithoutOtp:
            freezed == passkeyAllowRegisterWithoutOtp
            ? _value.passkeyAllowRegisterWithoutOtp
            : passkeyAllowRegisterWithoutOtp // ignore: cast_nullable_to_non_nullable
                  as bool?,
        workflowStatisticShare: freezed == workflowStatisticShare
            ? _value.workflowStatisticShare
            : workflowStatisticShare // ignore: cast_nullable_to_non_nullable
                  as bool?,
        rcloneSnapshotCheckFolderModtime:
            freezed == rcloneSnapshotCheckFolderModtime
            ? _value.rcloneSnapshotCheckFolderModtime
            : rcloneSnapshotCheckFolderModtime // ignore: cast_nullable_to_non_nullable
                  as bool?,
        openlistSnapshotCheckFolderModtime:
            freezed == openlistSnapshotCheckFolderModtime
            ? _value.openlistSnapshotCheckFolderModtime
            : openlistSnapshotCheckFolderModtime // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dockerClientApi: freezed == dockerClientApi
            ? _value.dockerClientApi
            : dockerClientApi // ignore: cast_nullable_to_non_nullable
                  as String?,
        playwrightBrowserType: freezed == playwrightBrowserType
            ? _value.playwrightBrowserType
            : playwrightBrowserType // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiAgentEnable: freezed == aiAgentEnable
            ? _value.aiAgentEnable
            : aiAgentEnable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        aiAgentGlobal: freezed == aiAgentGlobal
            ? _value.aiAgentGlobal
            : aiAgentGlobal // ignore: cast_nullable_to_non_nullable
                  as bool?,
        llmProvider: freezed == llmProvider
            ? _value.llmProvider
            : llmProvider // ignore: cast_nullable_to_non_nullable
                  as String?,
        llmModel: freezed == llmModel
            ? _value.llmModel
            : llmModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        llmApiKey: freezed == llmApiKey
            ? _value.llmApiKey
            : llmApiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        llmBaseUrl: freezed == llmBaseUrl
            ? _value.llmBaseUrl
            : llmBaseUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        llmMaxContextTokens: freezed == llmMaxContextTokens
            ? _value.llmMaxContextTokens
            : llmMaxContextTokens // ignore: cast_nullable_to_non_nullable
                  as int?,
        llmTemperature: freezed == llmTemperature
            ? _value.llmTemperature
            : llmTemperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        llmMaxIterations: freezed == llmMaxIterations
            ? _value.llmMaxIterations
            : llmMaxIterations // ignore: cast_nullable_to_non_nullable
                  as int?,
        llmToolTimeout: freezed == llmToolTimeout
            ? _value.llmToolTimeout
            : llmToolTimeout // ignore: cast_nullable_to_non_nullable
                  as int?,
        llmVerbose: freezed == llmVerbose
            ? _value.llmVerbose
            : llmVerbose // ignore: cast_nullable_to_non_nullable
                  as bool?,
        llmMaxMemoryMessages: freezed == llmMaxMemoryMessages
            ? _value.llmMaxMemoryMessages
            : llmMaxMemoryMessages // ignore: cast_nullable_to_non_nullable
                  as int?,
        llmMemoryRetentionDays: freezed == llmMemoryRetentionDays
            ? _value.llmMemoryRetentionDays
            : llmMemoryRetentionDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        llmRedisMemoryRetentionDays: freezed == llmRedisMemoryRetentionDays
            ? _value.llmRedisMemoryRetentionDays
            : llmRedisMemoryRetentionDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        aiRecommendEnabled: freezed == aiRecommendEnabled
            ? _value.aiRecommendEnabled
            : aiRecommendEnabled // ignore: cast_nullable_to_non_nullable
                  as bool?,
        aiRecommendUserPreference: freezed == aiRecommendUserPreference
            ? _value.aiRecommendUserPreference
            : aiRecommendUserPreference // ignore: cast_nullable_to_non_nullable
                  as String?,
        tavilyApiKey: freezed == tavilyApiKey
            ? _value.tavilyApiKey
            : tavilyApiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiRecommendMaxItems: freezed == aiRecommendMaxItems
            ? _value.aiRecommendMaxItems
            : aiRecommendMaxItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        version: freezed == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
        authVersion: freezed == authVersion
            ? _value.authVersion
            : authVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        indexerVersion: freezed == indexerVersion
            ? _value.indexerVersion
            : indexerVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        frontendVersion: freezed == frontendVersion
            ? _value.frontendVersion
            : frontendVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$SystemEnvDataImpl extends _SystemEnvData {
  const _$SystemEnvDataImpl({
    @JsonKey(name: 'CONFIG_DIR') this.configDir,
    @JsonKey(name: 'DEBUG', fromJson: _boolFromJson) this.debug,
    @JsonKey(name: 'LOG_LEVEL') this.logLevel,
    @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
    this.logMaxFileSize,
    @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
    this.logBackupCount,
    @JsonKey(name: 'LOG_CONSOLE_FORMAT') this.logConsoleFormat,
    @JsonKey(name: 'LOG_FILE_FORMAT') this.logFileFormat,
    @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
    this.asyncFileQueueSize,
    @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
    this.asyncFileWorkers,
    @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
    this.batchWriteSize,
    @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
    this.writeTimeout,
    @JsonKey(name: 'PROJECT_NAME') this.projectName,
    @JsonKey(name: 'APP_DOMAIN') this.appDomain,
    @JsonKey(name: 'API_V1_STR') this.apiV1Str,
    @JsonKey(name: 'FRONTEND_PATH') this.frontendPath,
    @JsonKey(name: 'TZ') this.tz,
    @JsonKey(name: 'HOST') this.host,
    @JsonKey(name: 'PORT', fromJson: _intFromJson) this.port,
    @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson) this.nginxPort,
    @JsonKey(name: 'DEV', fromJson: _boolFromJson) this.dev,
    @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson) this.advancedMode,
    @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
    final List<String>? allowedHosts,
    @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
    this.accessTokenExpireMinutes,
    @JsonKey(
      name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS',
      fromJson: _intFromJson,
    )
    this.resourceAccessTokenExpireSeconds,
    @JsonKey(name: 'SUPERUSER') this.superuser,
    @JsonKey(name: 'SUPERUSER_PASSWORD') this.superuserPassword,
    @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
    this.auxiliaryAuthEnable,
    @JsonKey(name: 'API_TOKEN') this.apiToken,
    @JsonKey(name: 'AUTH_SITE') this.authSite,
    @JsonKey(name: 'DB_TYPE') this.dbType,
    @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson) this.dbEcho,
    @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson) this.dbTimeout,
    @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson) this.dbWalEnable,
    @JsonKey(name: 'DB_POOL_TYPE') this.dbPoolType,
    @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
    this.dbPoolPrePing,
    @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
    this.dbPoolRecycle,
    @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
    this.dbPoolTimeout,
    @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
    this.dbSqlitePoolSize,
    @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
    this.dbSqliteMaxOverflow,
    @JsonKey(name: 'DB_POSTGRESQL_HOST') this.dbPostgresqlHost,
    @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
    this.dbPostgresqlPort,
    @JsonKey(name: 'DB_POSTGRESQL_DATABASE') this.dbPostgresqlDatabase,
    @JsonKey(name: 'DB_POSTGRESQL_USERNAME') this.dbPostgresqlUsername,
    @JsonKey(name: 'DB_POSTGRESQL_PASSWORD') this.dbPostgresqlPassword,
    @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
    this.dbPostgresqlPoolSize,
    @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
    this.dbPostgresqlMaxOverflow,
    @JsonKey(name: 'CACHE_BACKEND_TYPE') this.cacheBackendType,
    @JsonKey(name: 'CACHE_BACKEND_URL') this.cacheBackendUrl,
    @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
    this.cacheRedisMaxmemory,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
    this.globalImageCache,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
    this.globalImageCacheDays,
    @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson) this.tempFileDays,
    @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
    this.metaCacheExpire,
    @JsonKey(name: 'PROXY_HOST') this.proxyHost,
    @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson) this.dohEnable,
    @JsonKey(name: 'DOH_DOMAINS') this.dohDomains,
    @JsonKey(name: 'DOH_RESOLVERS') this.dohResolvers,
    @JsonKey(name: 'SEARCH_SOURCE') this.searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') this.recognizeSource,
    @JsonKey(name: 'SCRAP_SOURCE') this.scrapSource,
    @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
    final List<int>? animeGenreIds,
    @JsonKey(name: 'TMDB_IMAGE_DOMAIN') this.tmdbImageDomain,
    @JsonKey(name: 'TMDB_API_DOMAIN') this.tmdbApiDomain,
    @JsonKey(name: 'TMDB_LOCALE') this.tmdbLocale,
    @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
    this.tmdbScrapOriginalImage,
    @JsonKey(name: 'TMDB_API_KEY') this.tmdbApiKey,
    @JsonKey(name: 'TVDB_V4_API_KEY') this.tvdbV4ApiKey,
    @JsonKey(name: 'TVDB_V4_API_PIN') this.tvdbV4ApiPin,
    @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson) this.fanartEnable,
    @JsonKey(name: 'FANART_LANG') this.fanartLang,
    @JsonKey(name: 'FANART_API_KEY') this.fanartApiKey,
    @JsonKey(name: 'U115_APP_ID') this.u115AppId,
    @JsonKey(name: 'U115_AUTH_SERVER') this.u115AuthServer,
    @JsonKey(name: 'ALIPAN_APP_ID') this.alipanAppId,
    @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE') this.moviepilotAutoUpdate,
    @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
    this.autoUpdateResource,
    @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
    final List<String>? rmtMediaext,
    @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
    final List<String>? rmtSubext,
    @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
    final List<String>? rmtAudioext,
    @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
    this.mediaserverSyncInterval,
    @JsonKey(name: 'SUBSCRIBE_MODE') this.subscribeMode,
    @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
    this.subscribeRssInterval,
    @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
    this.subscribeStatisticShare,
    @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
    this.subscribeSearch,
    @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
    this.subscribeSearchInterval,
    @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
    this.localExistsSearch,
    @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
    this.sitedataRefreshInterval,
    @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson) this.siteMessage,
    @JsonKey(name: 'NO_CACHE_SITE_KEY') this.noCacheSiteKey,
    @JsonKey(name: 'OCR_HOST') this.ocrHost,
    @JsonKey(name: 'BROWSER_EMULATION') this.browserEmulation,
    @JsonKey(name: 'FLARESOLVERR_URL') this.flaresolverrUrl,
    @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
    this.searchMultipleName,
    @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
    this.maxSearchNameLimit,
    @JsonKey(name: 'TORRENT_TAG') this.torrentTag,
    @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
    this.downloadSubtitle,
    @JsonKey(name: 'AUTO_DOWNLOAD_USER') this.autoDownloadUser,
    @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
    final List<String>? downloadTmpext,
    @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
    this.cookiecloudEnableLocal,
    @JsonKey(name: 'COOKIECLOUD_HOST') this.cookiecloudHost,
    @JsonKey(name: 'COOKIECLOUD_KEY') this.cookiecloudKey,
    @JsonKey(name: 'COOKIECLOUD_PASSWORD') this.cookiecloudPassword,
    @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
    this.cookiecloudInterval,
    @JsonKey(name: 'COOKIECLOUD_BLACKLIST') this.cookiecloudBlacklist,
    @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
    this.transferThreads,
    @JsonKey(name: 'MOVIE_RENAME_FORMAT') this.movieRenameFormat,
    @JsonKey(name: 'TV_RENAME_FORMAT') this.tvRenameFormat,
    @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
    final List<String>? renameFormatS0Names,
    @JsonKey(name: 'DEFAULT_SUB') this.defaultSub,
    @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
    this.scrapFollowTmdb,
    @JsonKey(name: 'MP_SERVER_HOST') this.mpServerHost,
    @JsonKey(name: 'WALLPAPER') this.wallpaper,
    @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL') this.customizeWallpaperApiUrl,
    @JsonKey(name: 'PLUGIN_MARKET') this.pluginMarket,
    @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
    this.pluginStatisticShare,
    @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
    this.pluginAutoReload,
    @JsonKey(name: 'GITHUB_TOKEN') this.githubToken,
    @JsonKey(name: 'GITHUB_PROXY') this.githubProxy,
    @JsonKey(name: 'PIP_PROXY') this.pipProxy,
    @JsonKey(name: 'REPO_GITHUB_TOKEN') this.repoGithubToken,
    @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
    this.bigMemoryMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_PERFORMANCE_MODE',
      fromJson: _boolFromJson,
    )
    this.encodingDetectionPerformanceMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_MIN_CONFIDENCE',
      fromJson: _doubleFromJson,
    )
    this.encodingDetectionMinConfidence,
    @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
    this.memoryGcInterval,
    @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
    final List<String>? securityImageDomains,
    @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
    final List<String>? securityImageSuffixes,
    @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
    this.passkeyRequireUv,
    @JsonKey(
      name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP',
      fromJson: _boolFromJson,
    )
    this.passkeyAllowRegisterWithoutOtp,
    @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
    this.workflowStatisticShare,
    @JsonKey(
      name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    this.rcloneSnapshotCheckFolderModtime,
    @JsonKey(
      name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    this.openlistSnapshotCheckFolderModtime,
    @JsonKey(name: 'DOCKER_CLIENT_API') this.dockerClientApi,
    @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE') this.playwrightBrowserType,
    @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
    this.aiAgentEnable,
    @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
    this.aiAgentGlobal,
    @JsonKey(name: 'LLM_PROVIDER') this.llmProvider,
    @JsonKey(name: 'LLM_MODEL') this.llmModel,
    @JsonKey(name: 'LLM_API_KEY') this.llmApiKey,
    @JsonKey(name: 'LLM_BASE_URL') this.llmBaseUrl,
    @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
    this.llmMaxContextTokens,
    @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
    this.llmTemperature,
    @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
    this.llmMaxIterations,
    @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
    this.llmToolTimeout,
    @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson) this.llmVerbose,
    @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
    this.llmMaxMemoryMessages,
    @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    this.llmMemoryRetentionDays,
    @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    this.llmRedisMemoryRetentionDays,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
    this.aiRecommendEnabled,
    @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
    this.aiRecommendUserPreference,
    @JsonKey(name: 'TAVILY_API_KEY') this.tavilyApiKey,
    @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
    this.aiRecommendMaxItems,
    @JsonKey(name: 'VERSION') this.version,
    @JsonKey(name: 'AUTH_VERSION') this.authVersion,
    @JsonKey(name: 'INDEXER_VERSION') this.indexerVersion,
    @JsonKey(name: 'FRONTEND_VERSION') this.frontendVersion,
  }) : _allowedHosts = allowedHosts,
       _animeGenreIds = animeGenreIds,
       _rmtMediaext = rmtMediaext,
       _rmtSubext = rmtSubext,
       _rmtAudioext = rmtAudioext,
       _downloadTmpext = downloadTmpext,
       _renameFormatS0Names = renameFormatS0Names,
       _securityImageDomains = securityImageDomains,
       _securityImageSuffixes = securityImageSuffixes,
       super._();

  factory _$SystemEnvDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemEnvDataImplFromJson(json);

  @override
  @JsonKey(name: 'CONFIG_DIR')
  final String? configDir;
  @override
  @JsonKey(name: 'DEBUG', fromJson: _boolFromJson)
  final bool? debug;
  @override
  @JsonKey(name: 'LOG_LEVEL')
  final String? logLevel;
  @override
  @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
  final int? logMaxFileSize;
  @override
  @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
  final int? logBackupCount;
  @override
  @JsonKey(name: 'LOG_CONSOLE_FORMAT')
  final String? logConsoleFormat;
  @override
  @JsonKey(name: 'LOG_FILE_FORMAT')
  final String? logFileFormat;
  @override
  @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
  final int? asyncFileQueueSize;
  @override
  @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
  final int? asyncFileWorkers;
  @override
  @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
  final int? batchWriteSize;
  @override
  @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
  final double? writeTimeout;
  @override
  @JsonKey(name: 'PROJECT_NAME')
  final String? projectName;
  @override
  @JsonKey(name: 'APP_DOMAIN')
  final String? appDomain;
  @override
  @JsonKey(name: 'API_V1_STR')
  final String? apiV1Str;
  @override
  @JsonKey(name: 'FRONTEND_PATH')
  final String? frontendPath;
  @override
  @JsonKey(name: 'TZ')
  final String? tz;
  @override
  @JsonKey(name: 'HOST')
  final String? host;
  @override
  @JsonKey(name: 'PORT', fromJson: _intFromJson)
  final int? port;
  @override
  @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson)
  final int? nginxPort;
  @override
  @JsonKey(name: 'DEV', fromJson: _boolFromJson)
  final bool? dev;
  @override
  @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson)
  final bool? advancedMode;
  final List<String>? _allowedHosts;
  @override
  @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
  List<String>? get allowedHosts {
    final value = _allowedHosts;
    if (value == null) return null;
    if (_allowedHosts is EqualUnmodifiableListView) return _allowedHosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
  final int? accessTokenExpireMinutes;
  @override
  @JsonKey(name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS', fromJson: _intFromJson)
  final int? resourceAccessTokenExpireSeconds;
  @override
  @JsonKey(name: 'SUPERUSER')
  final String? superuser;
  @override
  @JsonKey(name: 'SUPERUSER_PASSWORD')
  final String? superuserPassword;
  @override
  @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
  final bool? auxiliaryAuthEnable;
  @override
  @JsonKey(name: 'API_TOKEN')
  final String? apiToken;
  @override
  @JsonKey(name: 'AUTH_SITE')
  final String? authSite;
  @override
  @JsonKey(name: 'DB_TYPE')
  final String? dbType;
  @override
  @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson)
  final bool? dbEcho;
  @override
  @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson)
  final int? dbTimeout;
  @override
  @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson)
  final bool? dbWalEnable;
  @override
  @JsonKey(name: 'DB_POOL_TYPE')
  final String? dbPoolType;
  @override
  @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
  final bool? dbPoolPrePing;
  @override
  @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
  final int? dbPoolRecycle;
  @override
  @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
  final int? dbPoolTimeout;
  @override
  @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
  final int? dbSqlitePoolSize;
  @override
  @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
  final int? dbSqliteMaxOverflow;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_HOST')
  final String? dbPostgresqlHost;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
  final int? dbPostgresqlPort;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_DATABASE')
  final String? dbPostgresqlDatabase;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_USERNAME')
  final String? dbPostgresqlUsername;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_PASSWORD')
  final String? dbPostgresqlPassword;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
  final int? dbPostgresqlPoolSize;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
  final int? dbPostgresqlMaxOverflow;
  @override
  @JsonKey(name: 'CACHE_BACKEND_TYPE')
  final String? cacheBackendType;
  @override
  @JsonKey(name: 'CACHE_BACKEND_URL')
  final String? cacheBackendUrl;
  @override
  @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
  final int? cacheRedisMaxmemory;
  @override
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
  final bool? globalImageCache;
  @override
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
  final int? globalImageCacheDays;
  @override
  @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson)
  final int? tempFileDays;
  @override
  @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
  final int? metaCacheExpire;
  @override
  @JsonKey(name: 'PROXY_HOST')
  final String? proxyHost;
  @override
  @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson)
  final bool? dohEnable;
  @override
  @JsonKey(name: 'DOH_DOMAINS')
  final String? dohDomains;
  @override
  @JsonKey(name: 'DOH_RESOLVERS')
  final String? dohResolvers;
  @override
  @JsonKey(name: 'SEARCH_SOURCE')
  final String? searchSource;
  @override
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  final String? recognizeSource;
  @override
  @JsonKey(name: 'SCRAP_SOURCE')
  final String? scrapSource;
  final List<int>? _animeGenreIds;
  @override
  @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
  List<int>? get animeGenreIds {
    final value = _animeGenreIds;
    if (value == null) return null;
    if (_animeGenreIds is EqualUnmodifiableListView) return _animeGenreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'TMDB_IMAGE_DOMAIN')
  final String? tmdbImageDomain;
  @override
  @JsonKey(name: 'TMDB_API_DOMAIN')
  final String? tmdbApiDomain;
  @override
  @JsonKey(name: 'TMDB_LOCALE')
  final String? tmdbLocale;
  @override
  @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
  final bool? tmdbScrapOriginalImage;
  @override
  @JsonKey(name: 'TMDB_API_KEY')
  final String? tmdbApiKey;
  @override
  @JsonKey(name: 'TVDB_V4_API_KEY')
  final String? tvdbV4ApiKey;
  @override
  @JsonKey(name: 'TVDB_V4_API_PIN')
  final String? tvdbV4ApiPin;
  @override
  @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson)
  final bool? fanartEnable;
  @override
  @JsonKey(name: 'FANART_LANG')
  final String? fanartLang;
  @override
  @JsonKey(name: 'FANART_API_KEY')
  final String? fanartApiKey;
  @override
  @JsonKey(name: 'U115_APP_ID')
  final String? u115AppId;
  @override
  @JsonKey(name: 'U115_AUTH_SERVER')
  final String? u115AuthServer;
  @override
  @JsonKey(name: 'ALIPAN_APP_ID')
  final String? alipanAppId;
  @override
  @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE')
  final String? moviepilotAutoUpdate;
  @override
  @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
  final bool? autoUpdateResource;
  final List<String>? _rmtMediaext;
  @override
  @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
  List<String>? get rmtMediaext {
    final value = _rmtMediaext;
    if (value == null) return null;
    if (_rmtMediaext is EqualUnmodifiableListView) return _rmtMediaext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _rmtSubext;
  @override
  @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
  List<String>? get rmtSubext {
    final value = _rmtSubext;
    if (value == null) return null;
    if (_rmtSubext is EqualUnmodifiableListView) return _rmtSubext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _rmtAudioext;
  @override
  @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
  List<String>? get rmtAudioext {
    final value = _rmtAudioext;
    if (value == null) return null;
    if (_rmtAudioext is EqualUnmodifiableListView) return _rmtAudioext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
  final int? mediaserverSyncInterval;
  @override
  @JsonKey(name: 'SUBSCRIBE_MODE')
  final String? subscribeMode;
  @override
  @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
  final int? subscribeRssInterval;
  @override
  @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
  final bool? subscribeStatisticShare;
  @override
  @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
  final bool? subscribeSearch;
  @override
  @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
  final int? subscribeSearchInterval;
  @override
  @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
  final bool? localExistsSearch;
  @override
  @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
  final int? sitedataRefreshInterval;
  @override
  @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson)
  final bool? siteMessage;
  @override
  @JsonKey(name: 'NO_CACHE_SITE_KEY')
  final String? noCacheSiteKey;
  @override
  @JsonKey(name: 'OCR_HOST')
  final String? ocrHost;
  @override
  @JsonKey(name: 'BROWSER_EMULATION')
  final String? browserEmulation;
  @override
  @JsonKey(name: 'FLARESOLVERR_URL')
  final String? flaresolverrUrl;
  @override
  @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
  final bool? searchMultipleName;
  @override
  @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
  final int? maxSearchNameLimit;
  @override
  @JsonKey(name: 'TORRENT_TAG')
  final String? torrentTag;
  @override
  @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
  final bool? downloadSubtitle;
  @override
  @JsonKey(name: 'AUTO_DOWNLOAD_USER')
  final String? autoDownloadUser;
  final List<String>? _downloadTmpext;
  @override
  @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
  List<String>? get downloadTmpext {
    final value = _downloadTmpext;
    if (value == null) return null;
    if (_downloadTmpext is EqualUnmodifiableListView) return _downloadTmpext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
  final bool? cookiecloudEnableLocal;
  @override
  @JsonKey(name: 'COOKIECLOUD_HOST')
  final String? cookiecloudHost;
  @override
  @JsonKey(name: 'COOKIECLOUD_KEY')
  final String? cookiecloudKey;
  @override
  @JsonKey(name: 'COOKIECLOUD_PASSWORD')
  final String? cookiecloudPassword;
  @override
  @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
  final int? cookiecloudInterval;
  @override
  @JsonKey(name: 'COOKIECLOUD_BLACKLIST')
  final String? cookiecloudBlacklist;
  @override
  @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
  final int? transferThreads;
  @override
  @JsonKey(name: 'MOVIE_RENAME_FORMAT')
  final String? movieRenameFormat;
  @override
  @JsonKey(name: 'TV_RENAME_FORMAT')
  final String? tvRenameFormat;
  final List<String>? _renameFormatS0Names;
  @override
  @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
  List<String>? get renameFormatS0Names {
    final value = _renameFormatS0Names;
    if (value == null) return null;
    if (_renameFormatS0Names is EqualUnmodifiableListView)
      return _renameFormatS0Names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'DEFAULT_SUB')
  final String? defaultSub;
  @override
  @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
  final bool? scrapFollowTmdb;
  @override
  @JsonKey(name: 'MP_SERVER_HOST')
  final String? mpServerHost;
  @override
  @JsonKey(name: 'WALLPAPER')
  final String? wallpaper;
  @override
  @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
  final String? customizeWallpaperApiUrl;
  @override
  @JsonKey(name: 'PLUGIN_MARKET')
  final String? pluginMarket;
  @override
  @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
  final bool? pluginStatisticShare;
  @override
  @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
  final bool? pluginAutoReload;
  @override
  @JsonKey(name: 'GITHUB_TOKEN')
  final String? githubToken;
  @override
  @JsonKey(name: 'GITHUB_PROXY')
  final String? githubProxy;
  @override
  @JsonKey(name: 'PIP_PROXY')
  final String? pipProxy;
  @override
  @JsonKey(name: 'REPO_GITHUB_TOKEN')
  final String? repoGithubToken;
  @override
  @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
  final bool? bigMemoryMode;
  @override
  @JsonKey(name: 'ENCODING_DETECTION_PERFORMANCE_MODE', fromJson: _boolFromJson)
  final bool? encodingDetectionPerformanceMode;
  @override
  @JsonKey(name: 'ENCODING_DETECTION_MIN_CONFIDENCE', fromJson: _doubleFromJson)
  final double? encodingDetectionMinConfidence;
  @override
  @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
  final int? memoryGcInterval;
  final List<String>? _securityImageDomains;
  @override
  @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
  List<String>? get securityImageDomains {
    final value = _securityImageDomains;
    if (value == null) return null;
    if (_securityImageDomains is EqualUnmodifiableListView)
      return _securityImageDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _securityImageSuffixes;
  @override
  @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
  List<String>? get securityImageSuffixes {
    final value = _securityImageSuffixes;
    if (value == null) return null;
    if (_securityImageSuffixes is EqualUnmodifiableListView)
      return _securityImageSuffixes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
  final bool? passkeyRequireUv;
  @override
  @JsonKey(name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP', fromJson: _boolFromJson)
  final bool? passkeyAllowRegisterWithoutOtp;
  @override
  @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
  final bool? workflowStatisticShare;
  @override
  @JsonKey(
    name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  final bool? rcloneSnapshotCheckFolderModtime;
  @override
  @JsonKey(
    name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  final bool? openlistSnapshotCheckFolderModtime;
  @override
  @JsonKey(name: 'DOCKER_CLIENT_API')
  final String? dockerClientApi;
  @override
  @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE')
  final String? playwrightBrowserType;
  @override
  @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
  final bool? aiAgentEnable;
  @override
  @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
  final bool? aiAgentGlobal;
  @override
  @JsonKey(name: 'LLM_PROVIDER')
  final String? llmProvider;
  @override
  @JsonKey(name: 'LLM_MODEL')
  final String? llmModel;
  @override
  @JsonKey(name: 'LLM_API_KEY')
  final String? llmApiKey;
  @override
  @JsonKey(name: 'LLM_BASE_URL')
  final String? llmBaseUrl;
  @override
  @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
  final int? llmMaxContextTokens;
  @override
  @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
  final double? llmTemperature;
  @override
  @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
  final int? llmMaxIterations;
  @override
  @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
  final int? llmToolTimeout;
  @override
  @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson)
  final bool? llmVerbose;
  @override
  @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
  final int? llmMaxMemoryMessages;
  @override
  @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  final int? llmMemoryRetentionDays;
  @override
  @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  final int? llmRedisMemoryRetentionDays;
  @override
  @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
  final bool? aiRecommendEnabled;
  @override
  @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
  final String? aiRecommendUserPreference;
  @override
  @JsonKey(name: 'TAVILY_API_KEY')
  final String? tavilyApiKey;
  @override
  @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
  final int? aiRecommendMaxItems;
  @override
  @JsonKey(name: 'VERSION')
  final String? version;
  @override
  @JsonKey(name: 'AUTH_VERSION')
  final String? authVersion;
  @override
  @JsonKey(name: 'INDEXER_VERSION')
  final String? indexerVersion;
  @override
  @JsonKey(name: 'FRONTEND_VERSION')
  final String? frontendVersion;

  @override
  String toString() {
    return 'SystemEnvData(configDir: $configDir, debug: $debug, logLevel: $logLevel, logMaxFileSize: $logMaxFileSize, logBackupCount: $logBackupCount, logConsoleFormat: $logConsoleFormat, logFileFormat: $logFileFormat, asyncFileQueueSize: $asyncFileQueueSize, asyncFileWorkers: $asyncFileWorkers, batchWriteSize: $batchWriteSize, writeTimeout: $writeTimeout, projectName: $projectName, appDomain: $appDomain, apiV1Str: $apiV1Str, frontendPath: $frontendPath, tz: $tz, host: $host, port: $port, nginxPort: $nginxPort, dev: $dev, advancedMode: $advancedMode, allowedHosts: $allowedHosts, accessTokenExpireMinutes: $accessTokenExpireMinutes, resourceAccessTokenExpireSeconds: $resourceAccessTokenExpireSeconds, superuser: $superuser, superuserPassword: $superuserPassword, auxiliaryAuthEnable: $auxiliaryAuthEnable, apiToken: $apiToken, authSite: $authSite, dbType: $dbType, dbEcho: $dbEcho, dbTimeout: $dbTimeout, dbWalEnable: $dbWalEnable, dbPoolType: $dbPoolType, dbPoolPrePing: $dbPoolPrePing, dbPoolRecycle: $dbPoolRecycle, dbPoolTimeout: $dbPoolTimeout, dbSqlitePoolSize: $dbSqlitePoolSize, dbSqliteMaxOverflow: $dbSqliteMaxOverflow, dbPostgresqlHost: $dbPostgresqlHost, dbPostgresqlPort: $dbPostgresqlPort, dbPostgresqlDatabase: $dbPostgresqlDatabase, dbPostgresqlUsername: $dbPostgresqlUsername, dbPostgresqlPassword: $dbPostgresqlPassword, dbPostgresqlPoolSize: $dbPostgresqlPoolSize, dbPostgresqlMaxOverflow: $dbPostgresqlMaxOverflow, cacheBackendType: $cacheBackendType, cacheBackendUrl: $cacheBackendUrl, cacheRedisMaxmemory: $cacheRedisMaxmemory, globalImageCache: $globalImageCache, globalImageCacheDays: $globalImageCacheDays, tempFileDays: $tempFileDays, metaCacheExpire: $metaCacheExpire, proxyHost: $proxyHost, dohEnable: $dohEnable, dohDomains: $dohDomains, dohResolvers: $dohResolvers, searchSource: $searchSource, recognizeSource: $recognizeSource, scrapSource: $scrapSource, animeGenreIds: $animeGenreIds, tmdbImageDomain: $tmdbImageDomain, tmdbApiDomain: $tmdbApiDomain, tmdbLocale: $tmdbLocale, tmdbScrapOriginalImage: $tmdbScrapOriginalImage, tmdbApiKey: $tmdbApiKey, tvdbV4ApiKey: $tvdbV4ApiKey, tvdbV4ApiPin: $tvdbV4ApiPin, fanartEnable: $fanartEnable, fanartLang: $fanartLang, fanartApiKey: $fanartApiKey, u115AppId: $u115AppId, u115AuthServer: $u115AuthServer, alipanAppId: $alipanAppId, moviepilotAutoUpdate: $moviepilotAutoUpdate, autoUpdateResource: $autoUpdateResource, rmtMediaext: $rmtMediaext, rmtSubext: $rmtSubext, rmtAudioext: $rmtAudioext, mediaserverSyncInterval: $mediaserverSyncInterval, subscribeMode: $subscribeMode, subscribeRssInterval: $subscribeRssInterval, subscribeStatisticShare: $subscribeStatisticShare, subscribeSearch: $subscribeSearch, subscribeSearchInterval: $subscribeSearchInterval, localExistsSearch: $localExistsSearch, sitedataRefreshInterval: $sitedataRefreshInterval, siteMessage: $siteMessage, noCacheSiteKey: $noCacheSiteKey, ocrHost: $ocrHost, browserEmulation: $browserEmulation, flaresolverrUrl: $flaresolverrUrl, searchMultipleName: $searchMultipleName, maxSearchNameLimit: $maxSearchNameLimit, torrentTag: $torrentTag, downloadSubtitle: $downloadSubtitle, autoDownloadUser: $autoDownloadUser, downloadTmpext: $downloadTmpext, cookiecloudEnableLocal: $cookiecloudEnableLocal, cookiecloudHost: $cookiecloudHost, cookiecloudKey: $cookiecloudKey, cookiecloudPassword: $cookiecloudPassword, cookiecloudInterval: $cookiecloudInterval, cookiecloudBlacklist: $cookiecloudBlacklist, transferThreads: $transferThreads, movieRenameFormat: $movieRenameFormat, tvRenameFormat: $tvRenameFormat, renameFormatS0Names: $renameFormatS0Names, defaultSub: $defaultSub, scrapFollowTmdb: $scrapFollowTmdb, mpServerHost: $mpServerHost, wallpaper: $wallpaper, customizeWallpaperApiUrl: $customizeWallpaperApiUrl, pluginMarket: $pluginMarket, pluginStatisticShare: $pluginStatisticShare, pluginAutoReload: $pluginAutoReload, githubToken: $githubToken, githubProxy: $githubProxy, pipProxy: $pipProxy, repoGithubToken: $repoGithubToken, bigMemoryMode: $bigMemoryMode, encodingDetectionPerformanceMode: $encodingDetectionPerformanceMode, encodingDetectionMinConfidence: $encodingDetectionMinConfidence, memoryGcInterval: $memoryGcInterval, securityImageDomains: $securityImageDomains, securityImageSuffixes: $securityImageSuffixes, passkeyRequireUv: $passkeyRequireUv, passkeyAllowRegisterWithoutOtp: $passkeyAllowRegisterWithoutOtp, workflowStatisticShare: $workflowStatisticShare, rcloneSnapshotCheckFolderModtime: $rcloneSnapshotCheckFolderModtime, openlistSnapshotCheckFolderModtime: $openlistSnapshotCheckFolderModtime, dockerClientApi: $dockerClientApi, playwrightBrowserType: $playwrightBrowserType, aiAgentEnable: $aiAgentEnable, aiAgentGlobal: $aiAgentGlobal, llmProvider: $llmProvider, llmModel: $llmModel, llmApiKey: $llmApiKey, llmBaseUrl: $llmBaseUrl, llmMaxContextTokens: $llmMaxContextTokens, llmTemperature: $llmTemperature, llmMaxIterations: $llmMaxIterations, llmToolTimeout: $llmToolTimeout, llmVerbose: $llmVerbose, llmMaxMemoryMessages: $llmMaxMemoryMessages, llmMemoryRetentionDays: $llmMemoryRetentionDays, llmRedisMemoryRetentionDays: $llmRedisMemoryRetentionDays, aiRecommendEnabled: $aiRecommendEnabled, aiRecommendUserPreference: $aiRecommendUserPreference, tavilyApiKey: $tavilyApiKey, aiRecommendMaxItems: $aiRecommendMaxItems, version: $version, authVersion: $authVersion, indexerVersion: $indexerVersion, frontendVersion: $frontendVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemEnvDataImpl &&
            (identical(other.configDir, configDir) ||
                other.configDir == configDir) &&
            (identical(other.debug, debug) || other.debug == debug) &&
            (identical(other.logLevel, logLevel) ||
                other.logLevel == logLevel) &&
            (identical(other.logMaxFileSize, logMaxFileSize) ||
                other.logMaxFileSize == logMaxFileSize) &&
            (identical(other.logBackupCount, logBackupCount) ||
                other.logBackupCount == logBackupCount) &&
            (identical(other.logConsoleFormat, logConsoleFormat) ||
                other.logConsoleFormat == logConsoleFormat) &&
            (identical(other.logFileFormat, logFileFormat) ||
                other.logFileFormat == logFileFormat) &&
            (identical(other.asyncFileQueueSize, asyncFileQueueSize) ||
                other.asyncFileQueueSize == asyncFileQueueSize) &&
            (identical(other.asyncFileWorkers, asyncFileWorkers) ||
                other.asyncFileWorkers == asyncFileWorkers) &&
            (identical(other.batchWriteSize, batchWriteSize) ||
                other.batchWriteSize == batchWriteSize) &&
            (identical(other.writeTimeout, writeTimeout) ||
                other.writeTimeout == writeTimeout) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.appDomain, appDomain) ||
                other.appDomain == appDomain) &&
            (identical(other.apiV1Str, apiV1Str) ||
                other.apiV1Str == apiV1Str) &&
            (identical(other.frontendPath, frontendPath) ||
                other.frontendPath == frontendPath) &&
            (identical(other.tz, tz) || other.tz == tz) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.nginxPort, nginxPort) ||
                other.nginxPort == nginxPort) &&
            (identical(other.dev, dev) || other.dev == dev) &&
            (identical(other.advancedMode, advancedMode) ||
                other.advancedMode == advancedMode) &&
            const DeepCollectionEquality().equals(
              other._allowedHosts,
              _allowedHosts,
            ) &&
            (identical(
                  other.accessTokenExpireMinutes,
                  accessTokenExpireMinutes,
                ) ||
                other.accessTokenExpireMinutes == accessTokenExpireMinutes) &&
            (identical(
                  other.resourceAccessTokenExpireSeconds,
                  resourceAccessTokenExpireSeconds,
                ) ||
                other.resourceAccessTokenExpireSeconds ==
                    resourceAccessTokenExpireSeconds) &&
            (identical(other.superuser, superuser) ||
                other.superuser == superuser) &&
            (identical(other.superuserPassword, superuserPassword) ||
                other.superuserPassword == superuserPassword) &&
            (identical(other.auxiliaryAuthEnable, auxiliaryAuthEnable) ||
                other.auxiliaryAuthEnable == auxiliaryAuthEnable) &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken) &&
            (identical(other.authSite, authSite) ||
                other.authSite == authSite) &&
            (identical(other.dbType, dbType) || other.dbType == dbType) &&
            (identical(other.dbEcho, dbEcho) || other.dbEcho == dbEcho) &&
            (identical(other.dbTimeout, dbTimeout) ||
                other.dbTimeout == dbTimeout) &&
            (identical(other.dbWalEnable, dbWalEnable) ||
                other.dbWalEnable == dbWalEnable) &&
            (identical(other.dbPoolType, dbPoolType) ||
                other.dbPoolType == dbPoolType) &&
            (identical(other.dbPoolPrePing, dbPoolPrePing) ||
                other.dbPoolPrePing == dbPoolPrePing) &&
            (identical(other.dbPoolRecycle, dbPoolRecycle) ||
                other.dbPoolRecycle == dbPoolRecycle) &&
            (identical(other.dbPoolTimeout, dbPoolTimeout) ||
                other.dbPoolTimeout == dbPoolTimeout) &&
            (identical(other.dbSqlitePoolSize, dbSqlitePoolSize) ||
                other.dbSqlitePoolSize == dbSqlitePoolSize) &&
            (identical(other.dbSqliteMaxOverflow, dbSqliteMaxOverflow) ||
                other.dbSqliteMaxOverflow == dbSqliteMaxOverflow) &&
            (identical(other.dbPostgresqlHost, dbPostgresqlHost) ||
                other.dbPostgresqlHost == dbPostgresqlHost) &&
            (identical(other.dbPostgresqlPort, dbPostgresqlPort) ||
                other.dbPostgresqlPort == dbPostgresqlPort) &&
            (identical(other.dbPostgresqlDatabase, dbPostgresqlDatabase) ||
                other.dbPostgresqlDatabase == dbPostgresqlDatabase) &&
            (identical(other.dbPostgresqlUsername, dbPostgresqlUsername) ||
                other.dbPostgresqlUsername == dbPostgresqlUsername) &&
            (identical(other.dbPostgresqlPassword, dbPostgresqlPassword) ||
                other.dbPostgresqlPassword == dbPostgresqlPassword) &&
            (identical(other.dbPostgresqlPoolSize, dbPostgresqlPoolSize) ||
                other.dbPostgresqlPoolSize == dbPostgresqlPoolSize) &&
            (identical(
                  other.dbPostgresqlMaxOverflow,
                  dbPostgresqlMaxOverflow,
                ) ||
                other.dbPostgresqlMaxOverflow == dbPostgresqlMaxOverflow) &&
            (identical(other.cacheBackendType, cacheBackendType) ||
                other.cacheBackendType == cacheBackendType) &&
            (identical(other.cacheBackendUrl, cacheBackendUrl) ||
                other.cacheBackendUrl == cacheBackendUrl) &&
            (identical(other.cacheRedisMaxmemory, cacheRedisMaxmemory) ||
                other.cacheRedisMaxmemory == cacheRedisMaxmemory) &&
            (identical(other.globalImageCache, globalImageCache) ||
                other.globalImageCache == globalImageCache) &&
            (identical(other.globalImageCacheDays, globalImageCacheDays) ||
                other.globalImageCacheDays == globalImageCacheDays) &&
            (identical(other.tempFileDays, tempFileDays) ||
                other.tempFileDays == tempFileDays) &&
            (identical(other.metaCacheExpire, metaCacheExpire) ||
                other.metaCacheExpire == metaCacheExpire) &&
            (identical(other.proxyHost, proxyHost) ||
                other.proxyHost == proxyHost) &&
            (identical(other.dohEnable, dohEnable) ||
                other.dohEnable == dohEnable) &&
            (identical(other.dohDomains, dohDomains) ||
                other.dohDomains == dohDomains) &&
            (identical(other.dohResolvers, dohResolvers) ||
                other.dohResolvers == dohResolvers) &&
            (identical(other.searchSource, searchSource) ||
                other.searchSource == searchSource) &&
            (identical(other.recognizeSource, recognizeSource) ||
                other.recognizeSource == recognizeSource) &&
            (identical(other.scrapSource, scrapSource) ||
                other.scrapSource == scrapSource) &&
            const DeepCollectionEquality().equals(
              other._animeGenreIds,
              _animeGenreIds,
            ) &&
            (identical(other.tmdbImageDomain, tmdbImageDomain) ||
                other.tmdbImageDomain == tmdbImageDomain) &&
            (identical(other.tmdbApiDomain, tmdbApiDomain) ||
                other.tmdbApiDomain == tmdbApiDomain) &&
            (identical(other.tmdbLocale, tmdbLocale) ||
                other.tmdbLocale == tmdbLocale) &&
            (identical(other.tmdbScrapOriginalImage, tmdbScrapOriginalImage) ||
                other.tmdbScrapOriginalImage == tmdbScrapOriginalImage) &&
            (identical(other.tmdbApiKey, tmdbApiKey) ||
                other.tmdbApiKey == tmdbApiKey) &&
            (identical(other.tvdbV4ApiKey, tvdbV4ApiKey) ||
                other.tvdbV4ApiKey == tvdbV4ApiKey) &&
            (identical(other.tvdbV4ApiPin, tvdbV4ApiPin) ||
                other.tvdbV4ApiPin == tvdbV4ApiPin) &&
            (identical(other.fanartEnable, fanartEnable) ||
                other.fanartEnable == fanartEnable) &&
            (identical(other.fanartLang, fanartLang) ||
                other.fanartLang == fanartLang) &&
            (identical(other.fanartApiKey, fanartApiKey) ||
                other.fanartApiKey == fanartApiKey) &&
            (identical(other.u115AppId, u115AppId) ||
                other.u115AppId == u115AppId) &&
            (identical(other.u115AuthServer, u115AuthServer) ||
                other.u115AuthServer == u115AuthServer) &&
            (identical(other.alipanAppId, alipanAppId) ||
                other.alipanAppId == alipanAppId) &&
            (identical(other.moviepilotAutoUpdate, moviepilotAutoUpdate) ||
                other.moviepilotAutoUpdate == moviepilotAutoUpdate) &&
            (identical(other.autoUpdateResource, autoUpdateResource) ||
                other.autoUpdateResource == autoUpdateResource) &&
            const DeepCollectionEquality().equals(
              other._rmtMediaext,
              _rmtMediaext,
            ) &&
            const DeepCollectionEquality().equals(
              other._rmtSubext,
              _rmtSubext,
            ) &&
            const DeepCollectionEquality().equals(
              other._rmtAudioext,
              _rmtAudioext,
            ) &&
            (identical(
                  other.mediaserverSyncInterval,
                  mediaserverSyncInterval,
                ) ||
                other.mediaserverSyncInterval == mediaserverSyncInterval) &&
            (identical(other.subscribeMode, subscribeMode) ||
                other.subscribeMode == subscribeMode) &&
            (identical(other.subscribeRssInterval, subscribeRssInterval) ||
                other.subscribeRssInterval == subscribeRssInterval) &&
            (identical(
                  other.subscribeStatisticShare,
                  subscribeStatisticShare,
                ) ||
                other.subscribeStatisticShare == subscribeStatisticShare) &&
            (identical(other.subscribeSearch, subscribeSearch) ||
                other.subscribeSearch == subscribeSearch) &&
            (identical(
                  other.subscribeSearchInterval,
                  subscribeSearchInterval,
                ) ||
                other.subscribeSearchInterval == subscribeSearchInterval) &&
            (identical(other.localExistsSearch, localExistsSearch) ||
                other.localExistsSearch == localExistsSearch) &&
            (identical(
                  other.sitedataRefreshInterval,
                  sitedataRefreshInterval,
                ) ||
                other.sitedataRefreshInterval == sitedataRefreshInterval) &&
            (identical(other.siteMessage, siteMessage) ||
                other.siteMessage == siteMessage) &&
            (identical(other.noCacheSiteKey, noCacheSiteKey) ||
                other.noCacheSiteKey == noCacheSiteKey) &&
            (identical(other.ocrHost, ocrHost) || other.ocrHost == ocrHost) &&
            (identical(other.browserEmulation, browserEmulation) ||
                other.browserEmulation == browserEmulation) &&
            (identical(other.flaresolverrUrl, flaresolverrUrl) ||
                other.flaresolverrUrl == flaresolverrUrl) &&
            (identical(other.searchMultipleName, searchMultipleName) ||
                other.searchMultipleName == searchMultipleName) &&
            (identical(other.maxSearchNameLimit, maxSearchNameLimit) ||
                other.maxSearchNameLimit == maxSearchNameLimit) &&
            (identical(other.torrentTag, torrentTag) ||
                other.torrentTag == torrentTag) &&
            (identical(other.downloadSubtitle, downloadSubtitle) ||
                other.downloadSubtitle == downloadSubtitle) &&
            (identical(other.autoDownloadUser, autoDownloadUser) ||
                other.autoDownloadUser == autoDownloadUser) &&
            const DeepCollectionEquality().equals(
              other._downloadTmpext,
              _downloadTmpext,
            ) &&
            (identical(other.cookiecloudEnableLocal, cookiecloudEnableLocal) ||
                other.cookiecloudEnableLocal == cookiecloudEnableLocal) &&
            (identical(other.cookiecloudHost, cookiecloudHost) ||
                other.cookiecloudHost == cookiecloudHost) &&
            (identical(other.cookiecloudKey, cookiecloudKey) ||
                other.cookiecloudKey == cookiecloudKey) &&
            (identical(other.cookiecloudPassword, cookiecloudPassword) ||
                other.cookiecloudPassword == cookiecloudPassword) &&
            (identical(other.cookiecloudInterval, cookiecloudInterval) ||
                other.cookiecloudInterval == cookiecloudInterval) &&
            (identical(other.cookiecloudBlacklist, cookiecloudBlacklist) ||
                other.cookiecloudBlacklist == cookiecloudBlacklist) &&
            (identical(other.transferThreads, transferThreads) ||
                other.transferThreads == transferThreads) &&
            (identical(other.movieRenameFormat, movieRenameFormat) ||
                other.movieRenameFormat == movieRenameFormat) &&
            (identical(other.tvRenameFormat, tvRenameFormat) ||
                other.tvRenameFormat == tvRenameFormat) &&
            const DeepCollectionEquality().equals(
              other._renameFormatS0Names,
              _renameFormatS0Names,
            ) &&
            (identical(other.defaultSub, defaultSub) ||
                other.defaultSub == defaultSub) &&
            (identical(other.scrapFollowTmdb, scrapFollowTmdb) ||
                other.scrapFollowTmdb == scrapFollowTmdb) &&
            (identical(other.mpServerHost, mpServerHost) ||
                other.mpServerHost == mpServerHost) &&
            (identical(other.wallpaper, wallpaper) ||
                other.wallpaper == wallpaper) &&
            (identical(
                  other.customizeWallpaperApiUrl,
                  customizeWallpaperApiUrl,
                ) ||
                other.customizeWallpaperApiUrl == customizeWallpaperApiUrl) &&
            (identical(other.pluginMarket, pluginMarket) ||
                other.pluginMarket == pluginMarket) &&
            (identical(other.pluginStatisticShare, pluginStatisticShare) ||
                other.pluginStatisticShare == pluginStatisticShare) &&
            (identical(other.pluginAutoReload, pluginAutoReload) ||
                other.pluginAutoReload == pluginAutoReload) &&
            (identical(other.githubToken, githubToken) ||
                other.githubToken == githubToken) &&
            (identical(other.githubProxy, githubProxy) ||
                other.githubProxy == githubProxy) &&
            (identical(other.pipProxy, pipProxy) ||
                other.pipProxy == pipProxy) &&
            (identical(other.repoGithubToken, repoGithubToken) ||
                other.repoGithubToken == repoGithubToken) &&
            (identical(other.bigMemoryMode, bigMemoryMode) ||
                other.bigMemoryMode == bigMemoryMode) &&
            (identical(
                  other.encodingDetectionPerformanceMode,
                  encodingDetectionPerformanceMode,
                ) ||
                other.encodingDetectionPerformanceMode ==
                    encodingDetectionPerformanceMode) &&
            (identical(
                  other.encodingDetectionMinConfidence,
                  encodingDetectionMinConfidence,
                ) ||
                other.encodingDetectionMinConfidence ==
                    encodingDetectionMinConfidence) &&
            (identical(other.memoryGcInterval, memoryGcInterval) ||
                other.memoryGcInterval == memoryGcInterval) &&
            const DeepCollectionEquality().equals(
              other._securityImageDomains,
              _securityImageDomains,
            ) &&
            const DeepCollectionEquality().equals(
              other._securityImageSuffixes,
              _securityImageSuffixes,
            ) &&
            (identical(other.passkeyRequireUv, passkeyRequireUv) ||
                other.passkeyRequireUv == passkeyRequireUv) &&
            (identical(
                  other.passkeyAllowRegisterWithoutOtp,
                  passkeyAllowRegisterWithoutOtp,
                ) ||
                other.passkeyAllowRegisterWithoutOtp ==
                    passkeyAllowRegisterWithoutOtp) &&
            (identical(other.workflowStatisticShare, workflowStatisticShare) ||
                other.workflowStatisticShare == workflowStatisticShare) &&
            (identical(
                  other.rcloneSnapshotCheckFolderModtime,
                  rcloneSnapshotCheckFolderModtime,
                ) ||
                other.rcloneSnapshotCheckFolderModtime ==
                    rcloneSnapshotCheckFolderModtime) &&
            (identical(
                  other.openlistSnapshotCheckFolderModtime,
                  openlistSnapshotCheckFolderModtime,
                ) ||
                other.openlistSnapshotCheckFolderModtime ==
                    openlistSnapshotCheckFolderModtime) &&
            (identical(other.dockerClientApi, dockerClientApi) ||
                other.dockerClientApi == dockerClientApi) &&
            (identical(other.playwrightBrowserType, playwrightBrowserType) ||
                other.playwrightBrowserType == playwrightBrowserType) &&
            (identical(other.aiAgentEnable, aiAgentEnable) ||
                other.aiAgentEnable == aiAgentEnable) &&
            (identical(other.aiAgentGlobal, aiAgentGlobal) ||
                other.aiAgentGlobal == aiAgentGlobal) &&
            (identical(other.llmProvider, llmProvider) ||
                other.llmProvider == llmProvider) &&
            (identical(other.llmModel, llmModel) ||
                other.llmModel == llmModel) &&
            (identical(other.llmApiKey, llmApiKey) ||
                other.llmApiKey == llmApiKey) &&
            (identical(other.llmBaseUrl, llmBaseUrl) ||
                other.llmBaseUrl == llmBaseUrl) &&
            (identical(other.llmMaxContextTokens, llmMaxContextTokens) ||
                other.llmMaxContextTokens == llmMaxContextTokens) &&
            (identical(other.llmTemperature, llmTemperature) ||
                other.llmTemperature == llmTemperature) &&
            (identical(other.llmMaxIterations, llmMaxIterations) ||
                other.llmMaxIterations == llmMaxIterations) &&
            (identical(other.llmToolTimeout, llmToolTimeout) ||
                other.llmToolTimeout == llmToolTimeout) &&
            (identical(other.llmVerbose, llmVerbose) ||
                other.llmVerbose == llmVerbose) &&
            (identical(other.llmMaxMemoryMessages, llmMaxMemoryMessages) ||
                other.llmMaxMemoryMessages == llmMaxMemoryMessages) &&
            (identical(other.llmMemoryRetentionDays, llmMemoryRetentionDays) ||
                other.llmMemoryRetentionDays == llmMemoryRetentionDays) &&
            (identical(
                  other.llmRedisMemoryRetentionDays,
                  llmRedisMemoryRetentionDays,
                ) ||
                other.llmRedisMemoryRetentionDays ==
                    llmRedisMemoryRetentionDays) &&
            (identical(other.aiRecommendEnabled, aiRecommendEnabled) ||
                other.aiRecommendEnabled == aiRecommendEnabled) &&
            (identical(
                  other.aiRecommendUserPreference,
                  aiRecommendUserPreference,
                ) ||
                other.aiRecommendUserPreference == aiRecommendUserPreference) &&
            (identical(other.tavilyApiKey, tavilyApiKey) ||
                other.tavilyApiKey == tavilyApiKey) &&
            (identical(other.aiRecommendMaxItems, aiRecommendMaxItems) ||
                other.aiRecommendMaxItems == aiRecommendMaxItems) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.authVersion, authVersion) ||
                other.authVersion == authVersion) &&
            (identical(other.indexerVersion, indexerVersion) ||
                other.indexerVersion == indexerVersion) &&
            (identical(other.frontendVersion, frontendVersion) ||
                other.frontendVersion == frontendVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    configDir,
    debug,
    logLevel,
    logMaxFileSize,
    logBackupCount,
    logConsoleFormat,
    logFileFormat,
    asyncFileQueueSize,
    asyncFileWorkers,
    batchWriteSize,
    writeTimeout,
    projectName,
    appDomain,
    apiV1Str,
    frontendPath,
    tz,
    host,
    port,
    nginxPort,
    dev,
    advancedMode,
    const DeepCollectionEquality().hash(_allowedHosts),
    accessTokenExpireMinutes,
    resourceAccessTokenExpireSeconds,
    superuser,
    superuserPassword,
    auxiliaryAuthEnable,
    apiToken,
    authSite,
    dbType,
    dbEcho,
    dbTimeout,
    dbWalEnable,
    dbPoolType,
    dbPoolPrePing,
    dbPoolRecycle,
    dbPoolTimeout,
    dbSqlitePoolSize,
    dbSqliteMaxOverflow,
    dbPostgresqlHost,
    dbPostgresqlPort,
    dbPostgresqlDatabase,
    dbPostgresqlUsername,
    dbPostgresqlPassword,
    dbPostgresqlPoolSize,
    dbPostgresqlMaxOverflow,
    cacheBackendType,
    cacheBackendUrl,
    cacheRedisMaxmemory,
    globalImageCache,
    globalImageCacheDays,
    tempFileDays,
    metaCacheExpire,
    proxyHost,
    dohEnable,
    dohDomains,
    dohResolvers,
    searchSource,
    recognizeSource,
    scrapSource,
    const DeepCollectionEquality().hash(_animeGenreIds),
    tmdbImageDomain,
    tmdbApiDomain,
    tmdbLocale,
    tmdbScrapOriginalImage,
    tmdbApiKey,
    tvdbV4ApiKey,
    tvdbV4ApiPin,
    fanartEnable,
    fanartLang,
    fanartApiKey,
    u115AppId,
    u115AuthServer,
    alipanAppId,
    moviepilotAutoUpdate,
    autoUpdateResource,
    const DeepCollectionEquality().hash(_rmtMediaext),
    const DeepCollectionEquality().hash(_rmtSubext),
    const DeepCollectionEquality().hash(_rmtAudioext),
    mediaserverSyncInterval,
    subscribeMode,
    subscribeRssInterval,
    subscribeStatisticShare,
    subscribeSearch,
    subscribeSearchInterval,
    localExistsSearch,
    sitedataRefreshInterval,
    siteMessage,
    noCacheSiteKey,
    ocrHost,
    browserEmulation,
    flaresolverrUrl,
    searchMultipleName,
    maxSearchNameLimit,
    torrentTag,
    downloadSubtitle,
    autoDownloadUser,
    const DeepCollectionEquality().hash(_downloadTmpext),
    cookiecloudEnableLocal,
    cookiecloudHost,
    cookiecloudKey,
    cookiecloudPassword,
    cookiecloudInterval,
    cookiecloudBlacklist,
    transferThreads,
    movieRenameFormat,
    tvRenameFormat,
    const DeepCollectionEquality().hash(_renameFormatS0Names),
    defaultSub,
    scrapFollowTmdb,
    mpServerHost,
    wallpaper,
    customizeWallpaperApiUrl,
    pluginMarket,
    pluginStatisticShare,
    pluginAutoReload,
    githubToken,
    githubProxy,
    pipProxy,
    repoGithubToken,
    bigMemoryMode,
    encodingDetectionPerformanceMode,
    encodingDetectionMinConfidence,
    memoryGcInterval,
    const DeepCollectionEquality().hash(_securityImageDomains),
    const DeepCollectionEquality().hash(_securityImageSuffixes),
    passkeyRequireUv,
    passkeyAllowRegisterWithoutOtp,
    workflowStatisticShare,
    rcloneSnapshotCheckFolderModtime,
    openlistSnapshotCheckFolderModtime,
    dockerClientApi,
    playwrightBrowserType,
    aiAgentEnable,
    aiAgentGlobal,
    llmProvider,
    llmModel,
    llmApiKey,
    llmBaseUrl,
    llmMaxContextTokens,
    llmTemperature,
    llmMaxIterations,
    llmToolTimeout,
    llmVerbose,
    llmMaxMemoryMessages,
    llmMemoryRetentionDays,
    llmRedisMemoryRetentionDays,
    aiRecommendEnabled,
    aiRecommendUserPreference,
    tavilyApiKey,
    aiRecommendMaxItems,
    version,
    authVersion,
    indexerVersion,
    frontendVersion,
  ]);

  /// Create a copy of SystemEnvData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemEnvDataImplCopyWith<_$SystemEnvDataImpl> get copyWith =>
      __$$SystemEnvDataImplCopyWithImpl<_$SystemEnvDataImpl>(this, _$identity);
}

abstract class _SystemEnvData extends SystemEnvData {
  const factory _SystemEnvData({
    @JsonKey(name: 'CONFIG_DIR') final String? configDir,
    @JsonKey(name: 'DEBUG', fromJson: _boolFromJson) final bool? debug,
    @JsonKey(name: 'LOG_LEVEL') final String? logLevel,
    @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
    final int? logMaxFileSize,
    @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
    final int? logBackupCount,
    @JsonKey(name: 'LOG_CONSOLE_FORMAT') final String? logConsoleFormat,
    @JsonKey(name: 'LOG_FILE_FORMAT') final String? logFileFormat,
    @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
    final int? asyncFileQueueSize,
    @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
    final int? asyncFileWorkers,
    @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
    final int? batchWriteSize,
    @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
    final double? writeTimeout,
    @JsonKey(name: 'PROJECT_NAME') final String? projectName,
    @JsonKey(name: 'APP_DOMAIN') final String? appDomain,
    @JsonKey(name: 'API_V1_STR') final String? apiV1Str,
    @JsonKey(name: 'FRONTEND_PATH') final String? frontendPath,
    @JsonKey(name: 'TZ') final String? tz,
    @JsonKey(name: 'HOST') final String? host,
    @JsonKey(name: 'PORT', fromJson: _intFromJson) final int? port,
    @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson) final int? nginxPort,
    @JsonKey(name: 'DEV', fromJson: _boolFromJson) final bool? dev,
    @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson)
    final bool? advancedMode,
    @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
    final List<String>? allowedHosts,
    @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
    final int? accessTokenExpireMinutes,
    @JsonKey(
      name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS',
      fromJson: _intFromJson,
    )
    final int? resourceAccessTokenExpireSeconds,
    @JsonKey(name: 'SUPERUSER') final String? superuser,
    @JsonKey(name: 'SUPERUSER_PASSWORD') final String? superuserPassword,
    @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
    final bool? auxiliaryAuthEnable,
    @JsonKey(name: 'API_TOKEN') final String? apiToken,
    @JsonKey(name: 'AUTH_SITE') final String? authSite,
    @JsonKey(name: 'DB_TYPE') final String? dbType,
    @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson) final bool? dbEcho,
    @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson) final int? dbTimeout,
    @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson)
    final bool? dbWalEnable,
    @JsonKey(name: 'DB_POOL_TYPE') final String? dbPoolType,
    @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
    final bool? dbPoolPrePing,
    @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
    final int? dbPoolRecycle,
    @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
    final int? dbPoolTimeout,
    @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
    final int? dbSqlitePoolSize,
    @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
    final int? dbSqliteMaxOverflow,
    @JsonKey(name: 'DB_POSTGRESQL_HOST') final String? dbPostgresqlHost,
    @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
    final int? dbPostgresqlPort,
    @JsonKey(name: 'DB_POSTGRESQL_DATABASE') final String? dbPostgresqlDatabase,
    @JsonKey(name: 'DB_POSTGRESQL_USERNAME') final String? dbPostgresqlUsername,
    @JsonKey(name: 'DB_POSTGRESQL_PASSWORD') final String? dbPostgresqlPassword,
    @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
    final int? dbPostgresqlPoolSize,
    @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
    final int? dbPostgresqlMaxOverflow,
    @JsonKey(name: 'CACHE_BACKEND_TYPE') final String? cacheBackendType,
    @JsonKey(name: 'CACHE_BACKEND_URL') final String? cacheBackendUrl,
    @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
    final int? cacheRedisMaxmemory,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
    final bool? globalImageCache,
    @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
    final int? globalImageCacheDays,
    @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson)
    final int? tempFileDays,
    @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
    final int? metaCacheExpire,
    @JsonKey(name: 'PROXY_HOST') final String? proxyHost,
    @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson) final bool? dohEnable,
    @JsonKey(name: 'DOH_DOMAINS') final String? dohDomains,
    @JsonKey(name: 'DOH_RESOLVERS') final String? dohResolvers,
    @JsonKey(name: 'SEARCH_SOURCE') final String? searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') final String? recognizeSource,
    @JsonKey(name: 'SCRAP_SOURCE') final String? scrapSource,
    @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
    final List<int>? animeGenreIds,
    @JsonKey(name: 'TMDB_IMAGE_DOMAIN') final String? tmdbImageDomain,
    @JsonKey(name: 'TMDB_API_DOMAIN') final String? tmdbApiDomain,
    @JsonKey(name: 'TMDB_LOCALE') final String? tmdbLocale,
    @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
    final bool? tmdbScrapOriginalImage,
    @JsonKey(name: 'TMDB_API_KEY') final String? tmdbApiKey,
    @JsonKey(name: 'TVDB_V4_API_KEY') final String? tvdbV4ApiKey,
    @JsonKey(name: 'TVDB_V4_API_PIN') final String? tvdbV4ApiPin,
    @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson)
    final bool? fanartEnable,
    @JsonKey(name: 'FANART_LANG') final String? fanartLang,
    @JsonKey(name: 'FANART_API_KEY') final String? fanartApiKey,
    @JsonKey(name: 'U115_APP_ID') final String? u115AppId,
    @JsonKey(name: 'U115_AUTH_SERVER') final String? u115AuthServer,
    @JsonKey(name: 'ALIPAN_APP_ID') final String? alipanAppId,
    @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE') final String? moviepilotAutoUpdate,
    @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
    final bool? autoUpdateResource,
    @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
    final List<String>? rmtMediaext,
    @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
    final List<String>? rmtSubext,
    @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
    final List<String>? rmtAudioext,
    @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
    final int? mediaserverSyncInterval,
    @JsonKey(name: 'SUBSCRIBE_MODE') final String? subscribeMode,
    @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
    final int? subscribeRssInterval,
    @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
    final bool? subscribeStatisticShare,
    @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
    final bool? subscribeSearch,
    @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
    final int? subscribeSearchInterval,
    @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
    final bool? localExistsSearch,
    @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
    final int? sitedataRefreshInterval,
    @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson)
    final bool? siteMessage,
    @JsonKey(name: 'NO_CACHE_SITE_KEY') final String? noCacheSiteKey,
    @JsonKey(name: 'OCR_HOST') final String? ocrHost,
    @JsonKey(name: 'BROWSER_EMULATION') final String? browserEmulation,
    @JsonKey(name: 'FLARESOLVERR_URL') final String? flaresolverrUrl,
    @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
    final bool? searchMultipleName,
    @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
    final int? maxSearchNameLimit,
    @JsonKey(name: 'TORRENT_TAG') final String? torrentTag,
    @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
    final bool? downloadSubtitle,
    @JsonKey(name: 'AUTO_DOWNLOAD_USER') final String? autoDownloadUser,
    @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
    final List<String>? downloadTmpext,
    @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
    final bool? cookiecloudEnableLocal,
    @JsonKey(name: 'COOKIECLOUD_HOST') final String? cookiecloudHost,
    @JsonKey(name: 'COOKIECLOUD_KEY') final String? cookiecloudKey,
    @JsonKey(name: 'COOKIECLOUD_PASSWORD') final String? cookiecloudPassword,
    @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
    final int? cookiecloudInterval,
    @JsonKey(name: 'COOKIECLOUD_BLACKLIST') final String? cookiecloudBlacklist,
    @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
    final int? transferThreads,
    @JsonKey(name: 'MOVIE_RENAME_FORMAT') final String? movieRenameFormat,
    @JsonKey(name: 'TV_RENAME_FORMAT') final String? tvRenameFormat,
    @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
    final List<String>? renameFormatS0Names,
    @JsonKey(name: 'DEFAULT_SUB') final String? defaultSub,
    @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
    final bool? scrapFollowTmdb,
    @JsonKey(name: 'MP_SERVER_HOST') final String? mpServerHost,
    @JsonKey(name: 'WALLPAPER') final String? wallpaper,
    @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
    final String? customizeWallpaperApiUrl,
    @JsonKey(name: 'PLUGIN_MARKET') final String? pluginMarket,
    @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
    final bool? pluginStatisticShare,
    @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
    final bool? pluginAutoReload,
    @JsonKey(name: 'GITHUB_TOKEN') final String? githubToken,
    @JsonKey(name: 'GITHUB_PROXY') final String? githubProxy,
    @JsonKey(name: 'PIP_PROXY') final String? pipProxy,
    @JsonKey(name: 'REPO_GITHUB_TOKEN') final String? repoGithubToken,
    @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
    final bool? bigMemoryMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_PERFORMANCE_MODE',
      fromJson: _boolFromJson,
    )
    final bool? encodingDetectionPerformanceMode,
    @JsonKey(
      name: 'ENCODING_DETECTION_MIN_CONFIDENCE',
      fromJson: _doubleFromJson,
    )
    final double? encodingDetectionMinConfidence,
    @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
    final int? memoryGcInterval,
    @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
    final List<String>? securityImageDomains,
    @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
    final List<String>? securityImageSuffixes,
    @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
    final bool? passkeyRequireUv,
    @JsonKey(
      name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP',
      fromJson: _boolFromJson,
    )
    final bool? passkeyAllowRegisterWithoutOtp,
    @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
    final bool? workflowStatisticShare,
    @JsonKey(
      name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    final bool? rcloneSnapshotCheckFolderModtime,
    @JsonKey(
      name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
      fromJson: _boolFromJson,
    )
    final bool? openlistSnapshotCheckFolderModtime,
    @JsonKey(name: 'DOCKER_CLIENT_API') final String? dockerClientApi,
    @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE')
    final String? playwrightBrowserType,
    @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
    final bool? aiAgentEnable,
    @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
    final bool? aiAgentGlobal,
    @JsonKey(name: 'LLM_PROVIDER') final String? llmProvider,
    @JsonKey(name: 'LLM_MODEL') final String? llmModel,
    @JsonKey(name: 'LLM_API_KEY') final String? llmApiKey,
    @JsonKey(name: 'LLM_BASE_URL') final String? llmBaseUrl,
    @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
    final int? llmMaxContextTokens,
    @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
    final double? llmTemperature,
    @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
    final int? llmMaxIterations,
    @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
    final int? llmToolTimeout,
    @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson)
    final bool? llmVerbose,
    @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
    final int? llmMaxMemoryMessages,
    @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    final int? llmMemoryRetentionDays,
    @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
    final int? llmRedisMemoryRetentionDays,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
    final bool? aiRecommendEnabled,
    @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
    final String? aiRecommendUserPreference,
    @JsonKey(name: 'TAVILY_API_KEY') final String? tavilyApiKey,
    @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
    final int? aiRecommendMaxItems,
    @JsonKey(name: 'VERSION') final String? version,
    @JsonKey(name: 'AUTH_VERSION') final String? authVersion,
    @JsonKey(name: 'INDEXER_VERSION') final String? indexerVersion,
    @JsonKey(name: 'FRONTEND_VERSION') final String? frontendVersion,
  }) = _$SystemEnvDataImpl;
  const _SystemEnvData._() : super._();

  factory _SystemEnvData.fromJson(Map<String, dynamic> json) =
      _$SystemEnvDataImpl.fromJson;

  @override
  @JsonKey(name: 'CONFIG_DIR')
  String? get configDir;
  @override
  @JsonKey(name: 'DEBUG', fromJson: _boolFromJson)
  bool? get debug;
  @override
  @JsonKey(name: 'LOG_LEVEL')
  String? get logLevel;
  @override
  @JsonKey(name: 'LOG_MAX_FILE_SIZE', fromJson: _intFromJson)
  int? get logMaxFileSize;
  @override
  @JsonKey(name: 'LOG_BACKUP_COUNT', fromJson: _intFromJson)
  int? get logBackupCount;
  @override
  @JsonKey(name: 'LOG_CONSOLE_FORMAT')
  String? get logConsoleFormat;
  @override
  @JsonKey(name: 'LOG_FILE_FORMAT')
  String? get logFileFormat;
  @override
  @JsonKey(name: 'ASYNC_FILE_QUEUE_SIZE', fromJson: _intFromJson)
  int? get asyncFileQueueSize;
  @override
  @JsonKey(name: 'ASYNC_FILE_WORKERS', fromJson: _intFromJson)
  int? get asyncFileWorkers;
  @override
  @JsonKey(name: 'BATCH_WRITE_SIZE', fromJson: _intFromJson)
  int? get batchWriteSize;
  @override
  @JsonKey(name: 'WRITE_TIMEOUT', fromJson: _doubleFromJson)
  double? get writeTimeout;
  @override
  @JsonKey(name: 'PROJECT_NAME')
  String? get projectName;
  @override
  @JsonKey(name: 'APP_DOMAIN')
  String? get appDomain;
  @override
  @JsonKey(name: 'API_V1_STR')
  String? get apiV1Str;
  @override
  @JsonKey(name: 'FRONTEND_PATH')
  String? get frontendPath;
  @override
  @JsonKey(name: 'TZ')
  String? get tz;
  @override
  @JsonKey(name: 'HOST')
  String? get host;
  @override
  @JsonKey(name: 'PORT', fromJson: _intFromJson)
  int? get port;
  @override
  @JsonKey(name: 'NGINX_PORT', fromJson: _intFromJson)
  int? get nginxPort;
  @override
  @JsonKey(name: 'DEV', fromJson: _boolFromJson)
  bool? get dev;
  @override
  @JsonKey(name: 'ADVANCED_MODE', fromJson: _boolFromJson)
  bool? get advancedMode;
  @override
  @JsonKey(name: 'ALLOWED_HOSTS', fromJson: _stringListFromJson)
  List<String>? get allowedHosts;
  @override
  @JsonKey(name: 'ACCESS_TOKEN_EXPIRE_MINUTES', fromJson: _intFromJson)
  int? get accessTokenExpireMinutes;
  @override
  @JsonKey(name: 'RESOURCE_ACCESS_TOKEN_EXPIRE_SECONDS', fromJson: _intFromJson)
  int? get resourceAccessTokenExpireSeconds;
  @override
  @JsonKey(name: 'SUPERUSER')
  String? get superuser;
  @override
  @JsonKey(name: 'SUPERUSER_PASSWORD')
  String? get superuserPassword;
  @override
  @JsonKey(name: 'AUXILIARY_AUTH_ENABLE', fromJson: _boolFromJson)
  bool? get auxiliaryAuthEnable;
  @override
  @JsonKey(name: 'API_TOKEN')
  String? get apiToken;
  @override
  @JsonKey(name: 'AUTH_SITE')
  String? get authSite;
  @override
  @JsonKey(name: 'DB_TYPE')
  String? get dbType;
  @override
  @JsonKey(name: 'DB_ECHO', fromJson: _boolFromJson)
  bool? get dbEcho;
  @override
  @JsonKey(name: 'DB_TIMEOUT', fromJson: _intFromJson)
  int? get dbTimeout;
  @override
  @JsonKey(name: 'DB_WAL_ENABLE', fromJson: _boolFromJson)
  bool? get dbWalEnable;
  @override
  @JsonKey(name: 'DB_POOL_TYPE')
  String? get dbPoolType;
  @override
  @JsonKey(name: 'DB_POOL_PRE_PING', fromJson: _boolFromJson)
  bool? get dbPoolPrePing;
  @override
  @JsonKey(name: 'DB_POOL_RECYCLE', fromJson: _intFromJson)
  int? get dbPoolRecycle;
  @override
  @JsonKey(name: 'DB_POOL_TIMEOUT', fromJson: _intFromJson)
  int? get dbPoolTimeout;
  @override
  @JsonKey(name: 'DB_SQLITE_POOL_SIZE', fromJson: _intFromJson)
  int? get dbSqlitePoolSize;
  @override
  @JsonKey(name: 'DB_SQLITE_MAX_OVERFLOW', fromJson: _intFromJson)
  int? get dbSqliteMaxOverflow;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_HOST')
  String? get dbPostgresqlHost;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_PORT', fromJson: _intFromJson)
  int? get dbPostgresqlPort;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_DATABASE')
  String? get dbPostgresqlDatabase;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_USERNAME')
  String? get dbPostgresqlUsername;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_PASSWORD')
  String? get dbPostgresqlPassword;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_POOL_SIZE', fromJson: _intFromJson)
  int? get dbPostgresqlPoolSize;
  @override
  @JsonKey(name: 'DB_POSTGRESQL_MAX_OVERFLOW', fromJson: _intFromJson)
  int? get dbPostgresqlMaxOverflow;
  @override
  @JsonKey(name: 'CACHE_BACKEND_TYPE')
  String? get cacheBackendType;
  @override
  @JsonKey(name: 'CACHE_BACKEND_URL')
  String? get cacheBackendUrl;
  @override
  @JsonKey(name: 'CACHE_REDIS_MAXMEMORY', fromJson: _intFromJson)
  int? get cacheRedisMaxmemory;
  @override
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE', fromJson: _boolFromJson)
  bool? get globalImageCache;
  @override
  @JsonKey(name: 'GLOBAL_IMAGE_CACHE_DAYS', fromJson: _intFromJson)
  int? get globalImageCacheDays;
  @override
  @JsonKey(name: 'TEMP_FILE_DAYS', fromJson: _intFromJson)
  int? get tempFileDays;
  @override
  @JsonKey(name: 'META_CACHE_EXPIRE', fromJson: _intFromJson)
  int? get metaCacheExpire;
  @override
  @JsonKey(name: 'PROXY_HOST')
  String? get proxyHost;
  @override
  @JsonKey(name: 'DOH_ENABLE', fromJson: _boolFromJson)
  bool? get dohEnable;
  @override
  @JsonKey(name: 'DOH_DOMAINS')
  String? get dohDomains;
  @override
  @JsonKey(name: 'DOH_RESOLVERS')
  String? get dohResolvers;
  @override
  @JsonKey(name: 'SEARCH_SOURCE')
  String? get searchSource;
  @override
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  String? get recognizeSource;
  @override
  @JsonKey(name: 'SCRAP_SOURCE')
  String? get scrapSource;
  @override
  @JsonKey(name: 'ANIME_GENREIDS', fromJson: _intListFromJson)
  List<int>? get animeGenreIds;
  @override
  @JsonKey(name: 'TMDB_IMAGE_DOMAIN')
  String? get tmdbImageDomain;
  @override
  @JsonKey(name: 'TMDB_API_DOMAIN')
  String? get tmdbApiDomain;
  @override
  @JsonKey(name: 'TMDB_LOCALE')
  String? get tmdbLocale;
  @override
  @JsonKey(name: 'TMDB_SCRAP_ORIGINAL_IMAGE', fromJson: _boolFromJson)
  bool? get tmdbScrapOriginalImage;
  @override
  @JsonKey(name: 'TMDB_API_KEY')
  String? get tmdbApiKey;
  @override
  @JsonKey(name: 'TVDB_V4_API_KEY')
  String? get tvdbV4ApiKey;
  @override
  @JsonKey(name: 'TVDB_V4_API_PIN')
  String? get tvdbV4ApiPin;
  @override
  @JsonKey(name: 'FANART_ENABLE', fromJson: _boolFromJson)
  bool? get fanartEnable;
  @override
  @JsonKey(name: 'FANART_LANG')
  String? get fanartLang;
  @override
  @JsonKey(name: 'FANART_API_KEY')
  String? get fanartApiKey;
  @override
  @JsonKey(name: 'U115_APP_ID')
  String? get u115AppId;
  @override
  @JsonKey(name: 'U115_AUTH_SERVER')
  String? get u115AuthServer;
  @override
  @JsonKey(name: 'ALIPAN_APP_ID')
  String? get alipanAppId;
  @override
  @JsonKey(name: 'MOVIEPILOT_AUTO_UPDATE')
  String? get moviepilotAutoUpdate;
  @override
  @JsonKey(name: 'AUTO_UPDATE_RESOURCE', fromJson: _boolFromJson)
  bool? get autoUpdateResource;
  @override
  @JsonKey(name: 'RMT_MEDIAEXT', fromJson: _stringListFromJson)
  List<String>? get rmtMediaext;
  @override
  @JsonKey(name: 'RMT_SUBEXT', fromJson: _stringListFromJson)
  List<String>? get rmtSubext;
  @override
  @JsonKey(name: 'RMT_AUDIOEXT', fromJson: _stringListFromJson)
  List<String>? get rmtAudioext;
  @override
  @JsonKey(name: 'MEDIASERVER_SYNC_INTERVAL', fromJson: _intFromJson)
  int? get mediaserverSyncInterval;
  @override
  @JsonKey(name: 'SUBSCRIBE_MODE')
  String? get subscribeMode;
  @override
  @JsonKey(name: 'SUBSCRIBE_RSS_INTERVAL', fromJson: _intFromJson)
  int? get subscribeRssInterval;
  @override
  @JsonKey(name: 'SUBSCRIBE_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get subscribeStatisticShare;
  @override
  @JsonKey(name: 'SUBSCRIBE_SEARCH', fromJson: _boolFromJson)
  bool? get subscribeSearch;
  @override
  @JsonKey(name: 'SUBSCRIBE_SEARCH_INTERVAL', fromJson: _intFromJson)
  int? get subscribeSearchInterval;
  @override
  @JsonKey(name: 'LOCAL_EXISTS_SEARCH', fromJson: _boolFromJson)
  bool? get localExistsSearch;
  @override
  @JsonKey(name: 'SITEDATA_REFRESH_INTERVAL', fromJson: _intFromJson)
  int? get sitedataRefreshInterval;
  @override
  @JsonKey(name: 'SITE_MESSAGE', fromJson: _boolFromJson)
  bool? get siteMessage;
  @override
  @JsonKey(name: 'NO_CACHE_SITE_KEY')
  String? get noCacheSiteKey;
  @override
  @JsonKey(name: 'OCR_HOST')
  String? get ocrHost;
  @override
  @JsonKey(name: 'BROWSER_EMULATION')
  String? get browserEmulation;
  @override
  @JsonKey(name: 'FLARESOLVERR_URL')
  String? get flaresolverrUrl;
  @override
  @JsonKey(name: 'SEARCH_MULTIPLE_NAME', fromJson: _boolFromJson)
  bool? get searchMultipleName;
  @override
  @JsonKey(name: 'MAX_SEARCH_NAME_LIMIT', fromJson: _intFromJson)
  int? get maxSearchNameLimit;
  @override
  @JsonKey(name: 'TORRENT_TAG')
  String? get torrentTag;
  @override
  @JsonKey(name: 'DOWNLOAD_SUBTITLE', fromJson: _boolFromJson)
  bool? get downloadSubtitle;
  @override
  @JsonKey(name: 'AUTO_DOWNLOAD_USER')
  String? get autoDownloadUser;
  @override
  @JsonKey(name: 'DOWNLOAD_TMPEXT', fromJson: _stringListFromJson)
  List<String>? get downloadTmpext;
  @override
  @JsonKey(name: 'COOKIECLOUD_ENABLE_LOCAL', fromJson: _boolFromJson)
  bool? get cookiecloudEnableLocal;
  @override
  @JsonKey(name: 'COOKIECLOUD_HOST')
  String? get cookiecloudHost;
  @override
  @JsonKey(name: 'COOKIECLOUD_KEY')
  String? get cookiecloudKey;
  @override
  @JsonKey(name: 'COOKIECLOUD_PASSWORD')
  String? get cookiecloudPassword;
  @override
  @JsonKey(name: 'COOKIECLOUD_INTERVAL', fromJson: _intFromJson)
  int? get cookiecloudInterval;
  @override
  @JsonKey(name: 'COOKIECLOUD_BLACKLIST')
  String? get cookiecloudBlacklist;
  @override
  @JsonKey(name: 'TRANSFER_THREADS', fromJson: _intFromJson)
  int? get transferThreads;
  @override
  @JsonKey(name: 'MOVIE_RENAME_FORMAT')
  String? get movieRenameFormat;
  @override
  @JsonKey(name: 'TV_RENAME_FORMAT')
  String? get tvRenameFormat;
  @override
  @JsonKey(name: 'RENAME_FORMAT_S0_NAMES', fromJson: _stringListFromJson)
  List<String>? get renameFormatS0Names;
  @override
  @JsonKey(name: 'DEFAULT_SUB')
  String? get defaultSub;
  @override
  @JsonKey(name: 'SCRAP_FOLLOW_TMDB', fromJson: _boolFromJson)
  bool? get scrapFollowTmdb;
  @override
  @JsonKey(name: 'MP_SERVER_HOST')
  String? get mpServerHost;
  @override
  @JsonKey(name: 'WALLPAPER')
  String? get wallpaper;
  @override
  @JsonKey(name: 'CUSTOMIZE_WALLPAPER_API_URL')
  String? get customizeWallpaperApiUrl;
  @override
  @JsonKey(name: 'PLUGIN_MARKET')
  String? get pluginMarket;
  @override
  @JsonKey(name: 'PLUGIN_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get pluginStatisticShare;
  @override
  @JsonKey(name: 'PLUGIN_AUTO_RELOAD', fromJson: _boolFromJson)
  bool? get pluginAutoReload;
  @override
  @JsonKey(name: 'GITHUB_TOKEN')
  String? get githubToken;
  @override
  @JsonKey(name: 'GITHUB_PROXY')
  String? get githubProxy;
  @override
  @JsonKey(name: 'PIP_PROXY')
  String? get pipProxy;
  @override
  @JsonKey(name: 'REPO_GITHUB_TOKEN')
  String? get repoGithubToken;
  @override
  @JsonKey(name: 'BIG_MEMORY_MODE', fromJson: _boolFromJson)
  bool? get bigMemoryMode;
  @override
  @JsonKey(name: 'ENCODING_DETECTION_PERFORMANCE_MODE', fromJson: _boolFromJson)
  bool? get encodingDetectionPerformanceMode;
  @override
  @JsonKey(name: 'ENCODING_DETECTION_MIN_CONFIDENCE', fromJson: _doubleFromJson)
  double? get encodingDetectionMinConfidence;
  @override
  @JsonKey(name: 'MEMORY_GC_INTERVAL', fromJson: _intFromJson)
  int? get memoryGcInterval;
  @override
  @JsonKey(name: 'SECURITY_IMAGE_DOMAINS', fromJson: _stringListFromJson)
  List<String>? get securityImageDomains;
  @override
  @JsonKey(name: 'SECURITY_IMAGE_SUFFIXES', fromJson: _stringListFromJson)
  List<String>? get securityImageSuffixes;
  @override
  @JsonKey(name: 'PASSKEY_REQUIRE_UV', fromJson: _boolFromJson)
  bool? get passkeyRequireUv;
  @override
  @JsonKey(name: 'PASSKEY_ALLOW_REGISTER_WITHOUT_OTP', fromJson: _boolFromJson)
  bool? get passkeyAllowRegisterWithoutOtp;
  @override
  @JsonKey(name: 'WORKFLOW_STATISTIC_SHARE', fromJson: _boolFromJson)
  bool? get workflowStatisticShare;
  @override
  @JsonKey(
    name: 'RCLONE_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  bool? get rcloneSnapshotCheckFolderModtime;
  @override
  @JsonKey(
    name: 'OPENLIST_SNAPSHOT_CHECK_FOLDER_MODTIME',
    fromJson: _boolFromJson,
  )
  bool? get openlistSnapshotCheckFolderModtime;
  @override
  @JsonKey(name: 'DOCKER_CLIENT_API')
  String? get dockerClientApi;
  @override
  @JsonKey(name: 'PLAYWRIGHT_BROWSER_TYPE')
  String? get playwrightBrowserType;
  @override
  @JsonKey(name: 'AI_AGENT_ENABLE', fromJson: _boolFromJson)
  bool? get aiAgentEnable;
  @override
  @JsonKey(name: 'AI_AGENT_GLOBAL', fromJson: _boolFromJson)
  bool? get aiAgentGlobal;
  @override
  @JsonKey(name: 'LLM_PROVIDER')
  String? get llmProvider;
  @override
  @JsonKey(name: 'LLM_MODEL')
  String? get llmModel;
  @override
  @JsonKey(name: 'LLM_API_KEY')
  String? get llmApiKey;
  @override
  @JsonKey(name: 'LLM_BASE_URL')
  String? get llmBaseUrl;
  @override
  @JsonKey(name: 'LLM_MAX_CONTEXT_TOKENS', fromJson: _intFromJson)
  int? get llmMaxContextTokens;
  @override
  @JsonKey(name: 'LLM_TEMPERATURE', fromJson: _doubleFromJson)
  double? get llmTemperature;
  @override
  @JsonKey(name: 'LLM_MAX_ITERATIONS', fromJson: _intFromJson)
  int? get llmMaxIterations;
  @override
  @JsonKey(name: 'LLM_TOOL_TIMEOUT', fromJson: _intFromJson)
  int? get llmToolTimeout;
  @override
  @JsonKey(name: 'LLM_VERBOSE', fromJson: _boolFromJson)
  bool? get llmVerbose;
  @override
  @JsonKey(name: 'LLM_MAX_MEMORY_MESSAGES', fromJson: _intFromJson)
  int? get llmMaxMemoryMessages;
  @override
  @JsonKey(name: 'LLM_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  int? get llmMemoryRetentionDays;
  @override
  @JsonKey(name: 'LLM_REDIS_MEMORY_RETENTION_DAYS', fromJson: _intFromJson)
  int? get llmRedisMemoryRetentionDays;
  @override
  @JsonKey(name: 'AI_RECOMMEND_ENABLED', fromJson: _boolFromJson)
  bool? get aiRecommendEnabled;
  @override
  @JsonKey(name: 'AI_RECOMMEND_USER_PREFERENCE')
  String? get aiRecommendUserPreference;
  @override
  @JsonKey(name: 'TAVILY_API_KEY')
  String? get tavilyApiKey;
  @override
  @JsonKey(name: 'AI_RECOMMEND_MAX_ITEMS', fromJson: _intFromJson)
  int? get aiRecommendMaxItems;
  @override
  @JsonKey(name: 'VERSION')
  String? get version;
  @override
  @JsonKey(name: 'AUTH_VERSION')
  String? get authVersion;
  @override
  @JsonKey(name: 'INDEXER_VERSION')
  String? get indexerVersion;
  @override
  @JsonKey(name: 'FRONTEND_VERSION')
  String? get frontendVersion;

  /// Create a copy of SystemEnvData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemEnvDataImplCopyWith<_$SystemEnvDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
