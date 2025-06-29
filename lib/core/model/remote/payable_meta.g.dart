// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payable_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayableMetaImpl _$$PayableMetaImplFromJson(Map<String, dynamic> json) =>
    _$PayableMetaImpl(
      id: (json['id'] as num?)?.toInt(),
      accountId: (json['account_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      archived: json['archived'] as bool?,
      imageUrl: json['image_url'] as String?,
      updateBy: json['update_by'],
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      campaignTypeId: (json['campaign_type_id'] as num?)?.toInt(),
      goalAmount: json['goal_amount'] as String?,
      raisedAmount: json['raised_amount'] as String?,
      donationAmount: json['donation_amount'] as String?,
    );

Map<String, dynamic> _$$PayableMetaImplToJson(_$PayableMetaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'title': instance.title,
      'description': instance.description,
      'archived': instance.archived,
      'image_url': instance.imageUrl,
      'update_by': instance.updateBy,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'campaign_type_id': instance.campaignTypeId,
      'goal_amount': instance.goalAmount,
      'raised_amount': instance.raisedAmount,
      'donation_amount': instance.donationAmount,
    };
