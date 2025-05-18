import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.freezed.dart';
part 'sign_up_response.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'errors') List<String>? errors,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, Object?> json) => _$SignUpResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

