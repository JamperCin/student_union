// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsUpdateModelImpl _$$NewsUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsUpdateModelImpl(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$NewsUpdateModelImplToJson(
        _$NewsUpdateModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
