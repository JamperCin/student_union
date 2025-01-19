import 'dart:collection';

import 'package:core_module/core/model/remote/base_response_model.dart';


abstract class AuthApiInterface {

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<BaseResponseModel> login(HashMap<String, Object> params);


  ///Sign up user onto the Prime platform
  ///@param [params]
  ///[params] is a body
  Future<BaseResponseModel> signUp(HashMap<String, Object> params);

  ///Sign up a guest user with limited info onto the Prime platform
  ///@param [params]
  ///[params] is a body
  Future<BaseResponseModel> signUpGuestUser(HashMap<String, Object> params);



  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<BaseResponseModel> guestUserLogin(HashMap<String, Object> params);

  ///Sign out of prime
  ///@param [params]
  ///[params] should have user type
  Future<BaseResponseModel> signOut(HashMap<String, Object> params);
}
