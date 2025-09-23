
import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/notification_model.dart';
import 'package:student_union/core/services/notifications/notification_api_interface.dart';

import '../../model/remote/customer_model.dart';

class NotificationApiService extends BaseApiService
    implements NotificationApiInterface {
  static NotificationApiService? _instance;

  NotificationApiService._internal();

  factory NotificationApiService() {
    return _instance ??= NotificationApiService._internal();
  }

  @override
  Future<List<NotificationModel>> fetchNotifications({Map<String,dynamic>? param}) async{
    final results = await _instance?.getListRequest<NotificationModel>(
      api: "customer/v1/notifications",
      key: "notifications",
      param: param,
      parser: (json) => NotificationModel.fromJson(json),
    );

    return results ?? [];
  }

  @override
  Future<NotificationModel> fetchNotificationDetails(String id) async{
    final results = await _instance?.getRequest<NotificationModel>(
      api: "customer/v1/notifications$id",
      parser: (json) => NotificationModel.fromJson(json),
    ) ?? const NotificationModel();

    return results;
  }

  @override
  Future<CustomerModel> registerFcmToken(Map<String, dynamic> param) async{
    final results = await _instance?.putRequest<CustomerModel>(
      api: 'customer/v1/profile?',
      param: param,
      showToast: true,
      parser: (json) => CustomerModel.fromJson(json),
    ) ??
        const CustomerModel();

    return results;
  }

}
