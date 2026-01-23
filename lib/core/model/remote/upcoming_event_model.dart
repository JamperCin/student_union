import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_event_model.freezed.dart';
part 'upcoming_event_model.g.dart';


@freezed
class UpcomingEventModel extends BaseObject with _$UpcomingEventModel {

  const factory UpcomingEventModel({
    @JsonKey(name: 'image_url')@Default("") String image,
    @Default(0) int id,
    @Default("") String description,
    @Default("") String name,
    @Default("") String location,
    @JsonKey(name: 'event_status')@Default("") String status,
    @JsonKey(name: 'current_state')@Default("") String state,
    @JsonKey(name: 'start_datetime')@Default("") String startDate,
    @JsonKey(name: 'end_datetime')@Default("") String endDate,
    @JsonKey(name: 'created_at')@Default("") String createdAt,
  }) = _UpcomingEventModel;

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventModelFromJson(json);
}
