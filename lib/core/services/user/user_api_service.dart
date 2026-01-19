import 'package:core_module/core_module.dart';

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
    final results =
        await _apiService?.getRequest<CustomerModel>(
          api: 'customer/v1/profile?',
          parser: (json) =>
              json.containsKey('errors') &&
                  json['errors'] == "Unauthorized User Access"
              ? const CustomerModel(status: "401")
              : CustomerModel.fromJson(json),
        ) ??
        const CustomerModel();

    return results;
  }

  @override
  Future<CustomerModel> updateUserDetails(Map<String, Object> params) async {
    final results =
        await _apiService?.putRequest<CustomerModel>(
          api: 'customer/v1/profile?',
          param: params,
          parser: (json) => CustomerModel.fromJson(json),
        ) ??
        const CustomerModel();

    return results;
  }

  @override
  Future<BaseResponseModel> deleteUserDetails() async {
    final results =
        await _apiService?.deleteRequest<BaseResponseModel>(
          api: 'customer/v1/profile?',
          parser: (json) => handleBaseResponse(json),
        ) ??
        const BaseResponseModel();

    return results;
  }


  @override
  Future<BaseResponseModel> sendResetPasswordLink(
    Map<String, Object> params,
  ) async {
    final results =
        await _apiService?.postRequest<BaseResponseModel>(
          api: 'customer/v1/password/forgot',
          param: params,
          parser: (json) => handleBaseResponse(json),
        ) ??
        const BaseResponseModel();

    return results;
  }



  //Handle BaseResponse well tracking or forms orf errors depending on keys of BaseResponse
  BaseResponseModel handleBaseResponse(Map<String, dynamic> json) {
    if (json.containsKey('errors') && json['errors'] is List<dynamic>) {
      return BaseResponseModel(
        success: false,
        error: (json['errors'] as List<dynamic>).first.toString(),
      );
    } else if (json.containsKey('error') && json['error'] is String) {
      return BaseResponseModel(success: false, error: json['error'] as String);
    } else if (json.containsKey('errorMsg') && json['errorMsg'] is String) {
      return BaseResponseModel(
        success: false,
        errorMsg: json['errorMsg'] as String,
      );
    } else if (json.containsKey('message') &&
        json['message'] is String &&
        json.containsKey('success') &&
        json['success'] == false) {
      return BaseResponseModel(
        success: false,
        data: {'message': json['message'] as String},
      );
    } else {
      return BaseResponseModel(success: true, data: json);
    }
  }
}
