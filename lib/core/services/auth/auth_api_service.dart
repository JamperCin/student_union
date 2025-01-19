import 'dart:collection';

import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/services/auth/auth_api_interface.dart';

class AuthApiService extends BaseApiService implements AuthApiInterface {
  static AuthApiService? _apiService;

  AuthApiService._();

  factory AuthApiService() {
    return _apiService ??= AuthApiService._();
  }

  ///Handle the response form LOGIN and Navigate based
  ///-- If SUCCESS then save the login details and Open the main dashboard of Gift cards
  ///--If ERROR then check the error message if
  ///                                         -- User account needs verification
  ///                                         -- User credentials are wrong or blocked
  Future<void> onSuccessLogin(
    BaseResponseModel response, {
    String? error,
    String? email,
    String? password,
  }) async {
    if (response.success) {
      isGuestUser.value = false;

      ///If this is a new user then clear everything on app
      appPreference.saveLoginDetails(
        response,
        foreName: email,
        password: password,
      );
      navUtils.fireTargetHome();
    } else {
      // if (AppString.USER_NOT_VERIFIED == response.error) {
      //   SnackBarApi.snackBarInfo(
      //       "Account has not been verified. Kindly complete the "
      //           "verification process to start using this account.");
      //   Utils.startTimer(4, () {
      //     NavApi.fireTarget(
      //       VerifyPhoneScreen(),
      //       model: CardModel(phoneNumber: map["forname"] ?? ""),
      //     );
      //   });
      // } else {
      //   SnackBarApi.snackBarInfo(
      //       error ?? response.error ?? "An error occurred");
      // }
    }
  }

  ///-------------------- A P I    C A L L S --------------------------

  @override
  Future<BaseResponseModel> login(HashMap<String, Object> params) async {
    final results = await _apiService?.postRequest<BaseResponseModel>(
            api: 'prime.sika/v1/users/login?',
            param: params,
            tokenHeader: false,
            showToast: false,
            parser: (json) {
              return BaseResponseModel.fromJson(json);
            }) ??
        BaseResponseModel();

    _apiService?.onSuccessLogin(
      results,
      email: params['email'] as String,
      password: params['password'] as String,
    );

    return results;
  }

  @override
  Future<BaseResponseModel> guestUserLogin(HashMap<String, Object> params) {
    // TODO: implement guestUserLogin
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel> signOut(HashMap<String, Object> params) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel> signUp(HashMap<String, Object> params) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel> signUpGuestUser(HashMap<String, Object> params) {
    // TODO: implement signUpGuestUser
    throw UnimplementedError();
  }
}
