import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_union/core/model/remote/devotional_type.dart';
import 'package:student_union/core/model/remote/todays_devotion.dart';

part 'devotional_book_model.freezed.dart';

part 'devotional_book_model.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class DevotionalBookModel extends BaseObject with _$DevotionalBookModel {
  const factory DevotionalBookModel({
    @Default(0) int id,
    @Default(0) int year,
    @Default(true) bool published,
    @Default(false) bool purchased,
    @JsonKey(name: "thumbnail_url") @Default("") String thumbnail,
    @JsonKey(name: "devotion_type") DevotionalType? devotionalType,
    @JsonKey(name: "devotion_year_id") @Default(0) int devotionalId,
    TodaysDevotion? devotion,
    @Default("") String description,
    @Default("") String title,
    @Default("") String name,
    @Default("") String author,
    @Default("") String page,
    @Default("GHS") String currency,
    @Default("0.00") String price,
  }) = _DevotionalBookModel;

  factory DevotionalBookModel.fromJson(Map<String, dynamic> json) =>
      _$DevotionalBookModelFromJson(json);
}
