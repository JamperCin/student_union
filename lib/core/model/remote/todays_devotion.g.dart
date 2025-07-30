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
      referenceText: json['reference_text'] as String?,
      isPrayer: json['is_prayer'] as bool? ?? false,
      isThought: json['is_thought'] as bool? ?? false,
      isQuestion: json['is_question'] as bool? ?? false,
      isSoWhat: json['is_so_what'] as bool? ?? false,
      prayer: json['prayer'] as String? ?? '',
      thought: json['thought'] as String? ?? '',
      question: json['question'] as String? ?? '',
      soWhat: json['sowhat'] as String? ?? '',
    );

Map<String, dynamic> _$$TodaysDevotionImplToJson(
        _$TodaysDevotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'reference': instance.reference,
      'display_date': instance.displayDate,
      'reference_text': instance.referenceText,
      'is_prayer': instance.isPrayer,
      'is_thought': instance.isThought,
      'is_question': instance.isQuestion,
      'is_so_what': instance.isSoWhat,
      'prayer': instance.prayer,
      'thought': instance.thought,
      'question': instance.question,
      'sowhat': instance.soWhat,
    };
