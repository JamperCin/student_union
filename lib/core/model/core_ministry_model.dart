import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'core_ministry_model.g.dart';

part 'core_ministry_model.freezed.dart';


@freezed
class CoreMinistryModel extends BaseObject with _$CoreMinistryModel {
  
  const factory CoreMinistryModel({
    @Default("") String image,
    @Default("") String description,
    @Default("") String title,
}) = _CoreMinistryModel;
  
  factory CoreMinistryModel.fromJson(Map<String, dynamic> json) =>
      _$CoreMinistryModelFromJson(json);
}
