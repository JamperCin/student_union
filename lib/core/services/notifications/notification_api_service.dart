import 'dart:collection';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:student_union/core/model/remote/notification_model.dart';
import 'package:student_union/core/services/notifications/notification_api_interface.dart';

class NotificationApiService extends BaseApiService
    implements NotificationApiInterface {
  static NotificationApiService? _instance;

  NotificationApiService._internal();

  factory NotificationApiService() {
    return _instance ??= NotificationApiService._internal();
  }

  @override
  Future<List<NotificationModel>> fetchNotifications({HashMap? map}) async{
    final results = await _instance?.getListRequest<NotificationModel>(
      api: "customer/v1/notifications",
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


}
