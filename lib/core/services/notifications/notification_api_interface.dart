import 'dart:collection';

import 'package:student_union/core/model/remote/notification_model.dart';

abstract class NotificationApiInterface{

  Future<List<NotificationModel>> fetchNotifications({HashMap? map});
  Future<NotificationModel> fetchNotificationDetails(String id);
}