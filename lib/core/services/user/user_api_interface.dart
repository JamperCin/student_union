import 'package:core_module/core_module.dart';

import '../../model/remote/customer_model.dart';

abstract class UserApiInterface{
  ///Get the details of the current user
  Future<CustomerModel> fetchUserDetails();
  Future<CustomerModel> updateUserDetails(Map<String, Object> params);
  Future<BaseResponseModel> deleteUserDetails();
  Future<BaseResponseModel> sendResetPasswordLink(Map<String, Object> params);
  Future<BaseResponseModel> verifyOtpCode(Map<String, Object> params);
}