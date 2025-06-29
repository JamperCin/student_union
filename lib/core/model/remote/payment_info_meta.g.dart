// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentInfoMetaImpl _$$PaymentInfoMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentInfoMetaImpl(
      note: json['note'] as String?,
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      initResponse: json['init_response'] == null
          ? null
          : InitResponse.fromJson(
              json['init_response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentInfoMetaImplToJson(
        _$PaymentInfoMetaImpl instance) =>
    <String, dynamic>{
      'note': instance.note,
      'campaign_id': instance.campaignId,
      'init_response': instance.initResponse,
    };

_$InitResponseImpl _$$InitResponseImplFromJson(Map<String, dynamic> json) =>
    _$InitResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$InitResponseImplToJson(_$InitResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      reference: json['reference'] as String?,
      accessCode: json['access_code'] as String?,
      authorizationUrl: json['authorization_url'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'access_code': instance.accessCode,
      'authorization_url': instance.authorizationUrl,
    };
