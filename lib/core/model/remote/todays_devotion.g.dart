// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_devotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodaysDevotionImpl _$$TodaysDevotionImplFromJson(Map<String, dynamic> json) =>
    _$TodaysDevotionImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      reference: json['reference'] as String?,
      displayDate: json['display_date'] as String?,
    );

Map<String, dynamic> _$$TodaysDevotionImplToJson(
        _$TodaysDevotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'reference': instance.reference,
      'display_date': instance.displayDate,
    };
