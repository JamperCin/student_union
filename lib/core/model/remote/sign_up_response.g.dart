// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpResponseImpl _$$SignUpResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignUpResponseImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : CustomerModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$SignUpResponseImplToJson(
  _$SignUpResponseImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
  'status': instance.status,
  'errors': instance.errors,
  'error': instance.error,
};
