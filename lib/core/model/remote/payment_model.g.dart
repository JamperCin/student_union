// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      transactionId: json['transactionId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      ref: json['ref'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      transactionType: json['transactionType'] as String?,
      authUrl: json['authorization_url'] as String?,
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      narration: json['narration'] as String?,
      bookId: (json['book_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'currency': instance.currency,
      'ref': instance.ref,
      'name': instance.name,
      'status': instance.status,
      'transactionType': instance.transactionType,
      'authorization_url': instance.authUrl,
      'campaign_id': instance.campaignId,
      'created_at': instance.createdAt,
      'narration': instance.narration,
      'book_id': instance.bookId,
    };
