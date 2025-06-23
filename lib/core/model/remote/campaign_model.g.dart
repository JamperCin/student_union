// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CampaignModelImpl _$$CampaignModelImplFromJson(Map<String, dynamic> json) =>
    _$CampaignModelImpl(
      image: json['image_url'] as String? ?? "",
      description: json['description'] as String? ?? "",
      id: (json['id'] as num?)?.toInt() ?? 0,
      goalAmount: json['goal_amount'] as String? ?? "",
      campaignType: json['campaign_type'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
    );

Map<String, dynamic> _$$CampaignModelImplToJson(_$CampaignModelImpl instance) =>
    <String, dynamic>{
      'image_url': instance.image,
      'description': instance.description,
      'id': instance.id,
      'goal_amount': instance.goalAmount,
      'campaign_type': instance.campaignType,
      'created_at': instance.createdAt,
      'account_id': instance.accountId,
      'title': instance.title,
    };
