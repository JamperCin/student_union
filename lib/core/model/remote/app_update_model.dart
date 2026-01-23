import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_model.freezed.dart';
part 'app_update_model.g.dart';

@freezed
abstract class AppUpdateModel extends BaseObject with _$AppUpdateModel {
  factory AppUpdateModel({
    @JsonKey(name: 'version_number') @Default("") String versionName,
    @JsonKey(name: 'version') @Default("") String versionCode,
    String? description,
    @Default("A new update is available") String title,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
  }) = _AppUpdateModel;

  factory AppUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateModelFromJson(json);
  //Map<String, dynamic> toJson() => _$AppUpdateModelToJson(this);
}
