import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:core_module/core/services/base_api_service.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';
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
  Future<BaseResponseModel?> login(HashMap<String, Object> params) async {
    final results = await _apiService?.postRequest<BaseResponseModel>(
            api: 'login',
            param: params,
            tokenHeader: false,
            showToast: true,
            parser: (json) {
              return BaseResponseModel.fromJson(json);
            });

    return results;
  }

  @override
  Future<SignUpResponse?> signUp(HashMap<String, Object> params) async{
    final results = await _apiService?.postRequest<SignUpResponse>(
        api: 'signup',
        param: params,
        tokenHeader: false,
        showToast: true,
        parser: (json) {
          debugPrint("JSON ---> $json");
          return SignUpResponse.fromJson(json);
        });

    return results;
  }


  @override
  Future<BaseResponseModel?> signOut(HashMap<String, Object> params) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
