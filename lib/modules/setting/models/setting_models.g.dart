// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectorySettingResponseImpl _$$DirectorySettingResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DirectorySettingResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DirectorySettingData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DirectorySettingResponseImplToJson(
  _$DirectorySettingResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$DirectorySettingDataImpl _$$DirectorySettingDataImplFromJson(
  Map<String, dynamic> json,
) => _$DirectorySettingDataImpl(
  value: json['value'] == null
      ? const []
      : _directoryListFromJson(json['value']),
);

Map<String, dynamic> _$$DirectorySettingDataImplToJson(
  _$DirectorySettingDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$DirectorySettingImpl _$$DirectorySettingImplFromJson(
  Map<String, dynamic> json,
) => _$DirectorySettingImpl(
  name: json['name'] == null ? '' : _stringFromJson(json['name']),
  storage: json['storage'] == null ? '' : _stringFromJson(json['storage']),
  downloadPath: json['download_path'] == null
      ? ''
      : _stringFromJson(json['download_path']),
  priority: json['priority'] == null ? 0 : _intFromJson(json['priority']),
  monitorType: json['monitor_type'] == null
      ? ''
      : _stringFromJson(json['monitor_type']),
  mediaType: json['media_type'] == null
      ? ''
      : _stringFromJson(json['media_type']),
  mediaCategory: json['media_category'] == null
      ? ''
      : _stringFromJson(json['media_category']),
  transferType: json['transfer_type'] == null
      ? ''
      : _stringFromJson(json['transfer_type']),
  libraryPath: json['library_path'] == null
      ? ''
      : _stringFromJson(json['library_path']),
  libraryTypeFolder: json['library_type_folder'] == null
      ? false
      : _boolFromJson(json['library_type_folder']),
  renaming: json['renaming'] == null ? false : _boolFromJson(json['renaming']),
  scraping: json['scraping'] == null ? false : _boolFromJson(json['scraping']),
  notify: json['notify'] == null ? false : _boolFromJson(json['notify']),
  overwriteMode: json['overwrite_mode'] == null
      ? ''
      : _stringFromJson(json['overwrite_mode']),
  downloadTypeFolder: json['download_type_folder'] == null
      ? false
      : _boolFromJson(json['download_type_folder']),
  libraryStorage: json['library_storage'] == null
      ? ''
      : _stringFromJson(json['library_storage']),
  libraryCategoryFolder: json['library_category_folder'] == null
      ? false
      : _boolFromJson(json['library_category_folder']),
  downloadCategoryFolder: json['download_category_folder'] == null
      ? false
      : _boolFromJson(json['download_category_folder']),
);

Map<String, dynamic> _$$DirectorySettingImplToJson(
  _$DirectorySettingImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'storage': instance.storage,
  'download_path': instance.downloadPath,
  'priority': instance.priority,
  'monitor_type': instance.monitorType,
  'media_type': instance.mediaType,
  'media_category': instance.mediaCategory,
  'transfer_type': instance.transferType,
  'library_path': instance.libraryPath,
  'library_type_folder': instance.libraryTypeFolder,
  'renaming': instance.renaming,
  'scraping': instance.scraping,
  'notify': instance.notify,
  'overwrite_mode': instance.overwriteMode,
  'download_type_folder': instance.downloadTypeFolder,
  'library_storage': instance.libraryStorage,
  'library_category_folder': instance.libraryCategoryFolder,
  'download_category_folder': instance.downloadCategoryFolder,
};

_$DownloadClientImpl _$$DownloadClientImplFromJson(Map<String, dynamic> json) =>
    _$DownloadClientImpl(
      name: json['name'] == null ? '' : _stringFromJson(json['name']),
      type: json['type'] == null ? '' : _stringFromJson(json['type']),
    );

Map<String, dynamic> _$$DownloadClientImplToJson(
  _$DownloadClientImpl instance,
) => <String, dynamic>{'name': instance.name, 'type': instance.type};
