import 'dart:collection';

import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/sign_up_response.dart';
import 'package:student_union/core/services/auth/auth_api_interface.dart';

class AuthApiService extends BaseApiService implements AuthApiInterface {
  static AuthApiService? _apiService;

  AuthApiService._();

  factory AuthApiService() {
    return _apiService ??= AuthApiService._();
  }

  ///-------------------- A P I    C A L L S --------------------------

  @override
  Future<SignUpResponse?> login(HashMap<String, Object> params) async {
    final results = await _apiService?.postRequest<SignUpResponse>(
      api: 'login',
      param: params,
      tokenHeader: false,
      showToast: true,
      parser: (json) => SignUpResponse.fromJson(json),
    );

    return results;
  }

  @override
  Future<SignUpResponse?> signUp(HashMap<String, Object> params) async {
    final results = await _apiService?.postRequest<SignUpResponse>(
      api: 'signup',
      param: params,
      tokenHeader: false,
      showToast: false,
      parser: (json) => SignUpResponse.fromJson(json),
    );

    return results;
  }

  @override
  Future<BaseResponseModel?> signOut(HashMap<String, Object> params) async{
    final results = await _apiService?.postRequest<BaseResponseModel>(
      api: 'signout',
      param: params,
      tokenHeader: false,
      parser: (json) => BaseResponseModel.fromJson(json),
    );

    return results;
  }
}
