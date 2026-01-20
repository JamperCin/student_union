import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_union/core/model/remote/customer_model.dart';

part 'sign_up_response.freezed.dart';
part 'sign_up_response.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class SignUpResponse extends BaseObject with _$SignUpResponse {
  const factory SignUpResponse({
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'user') CustomerModel? user,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'errors') List<String>? errors,
    @JsonKey(name: 'error') String? error,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, Object?> json) =>
      _$SignUpResponseFromJson(json);
}
