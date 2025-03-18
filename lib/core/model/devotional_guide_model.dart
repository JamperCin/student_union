import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devotional_guide_model.g.dart';

part 'devotional_guide_model.freezed.dart';
///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class DevotionalGuideModel extends BaseObject with _$DevotionalGuideModel {
  const factory DevotionalGuideModel({
    @Default("") String image,
    @Default("") String description,
    @Default("") String title,
    @Default("GHS") String currency,
    @Default(0.0) double amount,
}) = _DevotionalGuideModel;

  factory DevotionalGuideModel.fromJson(Map<String, dynamic> json) =>
      _$DevotionalGuideModelFromJson(json);
}
