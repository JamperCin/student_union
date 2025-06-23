import 'package:core_module/core/services/base_api_service.dart';
import 'package:get/get.dart';
import 'package:student_union/core/model/remote/customer_model.dart';
import 'package:student_union/core/services/user/user_api_interface.dart';

class UserApiService extends BaseApiService implements UserApiInterface {
  static UserApiService? _apiService;

  Rx<CustomerModel> userDetails = const CustomerModel().obs;
  RxString profilePic = ''.obs;
      //'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'.obs;

  UserApiService._();

  factory UserApiService() {
    return _apiService ??= UserApiService._();
  }

  @override
  Future<CustomerModel> fetchUserDetails() async {
     userDetails.value = await _apiService?.getRequest<CustomerModel>(
          api: 'customer/v1/profile?',
           parser: (json) =>  CustomerModel.fromJson(json),
        ) ??
        const CustomerModel();
    return userDetails.value;
  }
}
