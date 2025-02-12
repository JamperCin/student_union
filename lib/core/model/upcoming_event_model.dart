import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_event_model.freezed.dart';
part 'upcoming_event_model.g.dart';


@freezed
class UpcomingEventModel with _$UpcomingEventModel {
  const factory UpcomingEventModel({
    @Default("") String image,
    @Default("") String description,
    @Default("") String title,
    @Default("") String date,
  }) = _UpcomingEventModel;

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventModelFromJson(json);
}
