import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/notification_model.dart';

class NotificationController extends BaseController{
  int page = 1;

  Future<List<NotificationModel>> onLoadMore() async {
    page++;
    Map<String, dynamic> param = {
      "page": page.toString()
    };
    return await notificationApiService.fetchNotifications(param: param);
  }

  Future<List<NotificationModel>> onRefresh() async {
    page = 0;
   return await onLoadMore();
  }
}