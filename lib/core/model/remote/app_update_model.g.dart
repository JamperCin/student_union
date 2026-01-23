// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateModelImpl _$$AppUpdateModelImplFromJson(Map<String, dynamic> json) =>
    _$AppUpdateModelImpl(
      versionName: json['version_number'] as String? ?? "",
      versionCode: json['version'] as String? ?? "",
      description: json['description'] as String?,
      title: json['title'] as String? ?? "A new update is available",
      createdAt: json['created_at'] as String? ?? "",
    );

Map<String, dynamic> _$$AppUpdateModelImplToJson(
  _$AppUpdateModelImpl instance,
) => <String, dynamic>{
  'version_number': instance.versionName,
  'version': instance.versionCode,
  'description': instance.description,
  'title': instance.title,
  'created_at': instance.createdAt,
};
