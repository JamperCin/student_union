// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devotional_guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevotionalGuideModelImpl _$$DevotionalGuideModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DevotionalGuideModelImpl(
      thumbnail: json['thumbnail'] as String? ?? "",
      url: json['url'] as String? ?? "",
      description: json['description'] as String? ?? "",
      title: json['title'] as String? ?? "",
      name: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      year: json['year'] as String? ?? "",
      currency: json['currency'] as String? ?? "GHS",
      amount: json['amount'] as String? ?? "0.00",
    );

Map<String, dynamic> _$$DevotionalGuideModelImplToJson(
        _$DevotionalGuideModelImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'url': instance.url,
      'description': instance.description,
      'title': instance.title,
      'name': instance.name,
      'author': instance.author,
      'year': instance.year,
      'currency': instance.currency,
      'amount': instance.amount,
    };
