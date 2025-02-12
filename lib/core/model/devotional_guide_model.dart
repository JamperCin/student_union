import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devotional_guide_model.g.dart';

part 'devotional_guide_model.freezed.dart';

@freezed
class DevotionalGuideModel extends BaseObject with _$DevotionalGuideModel {
  const factory DevotionalGuideModel({
    @Default("") String image,
    @Default("") String description,
    @Default("") String title,
}) = _DevotionalGuideModel;

  factory DevotionalGuideModel.fromJson(Map<String, dynamic> json) =>
      _$DevotionalGuideModelFromJson(json);
}
