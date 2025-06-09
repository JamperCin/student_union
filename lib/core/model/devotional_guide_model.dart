import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devotional_guide_model.g.dart';

part 'devotional_guide_model.freezed.dart';
///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class DevotionalGuideModel extends BaseObject with _$DevotionalGuideModel {
  const factory DevotionalGuideModel({
    @Default("") String thumbnail,
    @Default("") String url,
    @Default("") String description,
    @Default("") String title,
    @Default("") String name,
    @Default("") String author,
    @Default("") String year,
    @Default("GHS") String currency,
    @Default("0.00") String amount,
}) = _DevotionalGuideModel;

  factory DevotionalGuideModel.fromJson(Map<String, dynamic> json) =>
      _$DevotionalGuideModelFromJson(json);
}
