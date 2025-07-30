import 'package:core_module/core/model/remote/base_response_model.dart';
import 'package:core_module/core/services/base_api_service.dart';
import 'package:get/get.dart';
import 'package:student_union/core/model/remote/customer_model.dart';
import 'package:student_union/core/services/user/user_api_interface.dart';

class UserApiService extends BaseApiService implements UserApiInterface {
  static UserApiService? _apiService;
  RxString profilePic = ''.obs;

  UserApiService._();

  factory UserApiService() {
    return _apiService ??= UserApiService._();
  }

  @override
  Future<CustomerModel> fetchUserDetails() async {
    final results = await _apiService?.getRequest<CustomerModel>(
          api: 'customer/v1/profile?',
          print: true,
          parser: (json) => CustomerModel.fromJson(json),
        ) ??
        const CustomerModel();
    return results;
  }

  @override
  Future<CustomerModel> updateUserDetails(Map<String, Object> params) async {
    final results = await _apiService?.putRequest<CustomerModel>(
          api: 'customer/v1/profile?',
          param: params,
          showToast: true,
          parser: (json) => CustomerModel.fromJson(json),
        ) ??
        const CustomerModel();

    return results;
  }

  @override
  Future<BaseResponseModel> deleteUserDetails() async {
    final results = await _apiService?.deleteRequest<BaseResponseModel>(
          api: 'customer/v1/profile?',
          showToast: true,
          parser: (json) => const BaseResponseModel(success: true),
        ) ??
        const BaseResponseModel();

    return results;
  }

  @override
  Future<BaseResponseModel> sendResetPasswordLink(
      Map<String, Object> params) async {
    final results = await _apiService?.postRequest<BaseResponseModel>(
          api: 'customer/v1/password/reset',
          param: params,
          parser: (json) => BaseResponseModel.fromJson(json),
        ) ??
        const BaseResponseModel();

    return results;
  }

  @override
  Future<BaseResponseModel> verifyOtpCode(Map<String, Object> params) async {
    final results = await _apiService?.postRequest<BaseResponseModel>(
          api: 'customer/v1/verify/code',
          param: params,
          parser: (json) => BaseResponseModel.fromJson(json),
        ) ??
        const BaseResponseModel();

    return results;
  }
}
