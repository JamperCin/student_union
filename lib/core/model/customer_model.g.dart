// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      profilePic: json['profilePic'] as String? ?? "",
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profilePic': instance.profilePic,
    };
