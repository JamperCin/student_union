

import 'package:student_union/core/model/customer_model.dart';

abstract class UserApiInterface{
  ///Get the details of the current user
  Future<CustomerModel> fetchUserDetails();
}