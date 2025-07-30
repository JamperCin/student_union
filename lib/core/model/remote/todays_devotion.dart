import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todays_devotion.freezed.dart';

part 'todays_devotion.g.dart';

@freezed
class TodaysDevotion extends BaseObject with _$TodaysDevotion {

  const factory TodaysDevotion({
    int? id,
    String? title,
    String? content,
    String? reference,
    @JsonKey(name: 'display_date') String? displayDate,
    @JsonKey(name: 'reference_text') String? referenceText,
    @JsonKey(name: 'is_prayer') @Default(false) bool isPrayer,
    @JsonKey(name: 'is_thought') @Default(false) bool isThought,
    @JsonKey(name: 'is_question') @Default(false) bool isQuestion,
    @JsonKey(name: 'is_so_what') @Default(false) bool isSoWhat,
    @Default('') String prayer,
    @Default('') String thought,
    @Default('') String question,
    @JsonKey(name: 'sowhat') @Default('') String soWhat,
  }) = _TodaysDevotion;

  factory TodaysDevotion.fromJson(Map<String, Object?> json) =>
      _$TodaysDevotionFromJson(json);
}
