// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      amount: json['amount'] as String? ?? "0.0",
      status: json['status'] as String? ?? "",
      reference: json['reference'] as String? ?? "",
      paymentType: json['payment_type'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      currency: json['currency'] as String? ?? "GHS",
      authUrl: json['authorization_url'] as String? ?? "",
      payableMeta: json['payable_meta'] == null
          ? null
          : PayableMeta.fromJson(json['payable_meta'] as Map<String, dynamic>),
      paymentInfoMeta: json['metadata'] == null
          ? null
          : PaymentInfoMeta.fromJson(json['metadata'] as Map<String, dynamic>),
      campaignId: (json['campaign_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'reference': instance.reference,
      'payment_type': instance.paymentType,
      'created_at': instance.createdAt,
      'currency': instance.currency,
      'authorization_url': instance.authUrl,
      'payable_meta': instance.payableMeta,
      'metadata': instance.paymentInfoMeta,
      'campaign_id': instance.campaignId,
    };
