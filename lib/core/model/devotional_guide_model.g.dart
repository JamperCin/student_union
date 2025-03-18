// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devotional_guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevotionalGuideModelImpl _$$DevotionalGuideModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DevotionalGuideModelImpl(
      image: json['image'] as String? ?? "",
      description: json['description'] as String? ?? "",
      title: json['title'] as String? ?? "",
      currency: json['currency'] as String? ?? "GHS",
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DevotionalGuideModelImplToJson(
        _$DevotionalGuideModelImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'description': instance.description,
      'title': instance.title,
      'currency': instance.currency,
      'amount': instance.amount,
    };
