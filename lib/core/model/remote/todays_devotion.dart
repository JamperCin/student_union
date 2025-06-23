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
  }) = _TodaysDevotion;

  factory TodaysDevotion.fromJson(Map<String, Object?> json) =>
      _$TodaysDevotionFromJson(json);
}
