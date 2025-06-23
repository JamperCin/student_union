// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      accountType: json['account_type'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      status: json['status'] as String? ?? "",
      profilePic: json['profilePic'] as String? ?? "",
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'account_type': instance.accountType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
      'profilePic': instance.profilePic,
    };
