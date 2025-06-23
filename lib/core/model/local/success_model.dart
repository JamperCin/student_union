import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_model.g.dart';

part 'success_model.freezed.dart';

@freezed
class SuccessModel extends BaseObject with _$SuccessModel {
  const factory SuccessModel({
    @Default("") String title,
    @Default("") String message,
  }) = _SuccessModel;

  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessModelFromJson(json);
}
