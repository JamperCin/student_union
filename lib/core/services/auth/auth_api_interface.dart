import 'dart:collection';

import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:student_union/core/model/remote/sign_up_response.dart';


abstract class AuthApiInterface {

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<BaseResponseModel?> login(HashMap<String, Object> params);


  ///Sign up user onto the Prime platform
  ///@param [params]
  ///[params] is a body
  Future<SignUpResponse?> signUp(HashMap<String, Object> params);


  ///Sign out of prime
  ///@param [params]
  ///[params] should have user type
  Future<BaseResponseModel?> signOut(HashMap<String, Object> params);
}
