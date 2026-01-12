import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/notification_model.dart';
import 'package:student_union/screens/dashboard/more/notifications/notification_detail_layout.dart';

class NotificationController extends BaseController {
  int page = 1;

  Future<List<NotificationModel>> onLoadMore() async {
    page++;
    Map<String, dynamic> param = {"page": page.toString()};
    return await notificationApiService.fetchNotifications(param: param);
  }

  Future<List<NotificationModel>> onRefresh() async {
    page = 0;
    return await onLoadMore();
  }

  void onNotificationTap(BuildContext context, NotificationModel model) {
    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.4,
      title: model.title ?? "",
      subChild: NotificationDetailLayout(
        title: model.title ?? "",
        date: model.createdAt ?? "",
        description: model.body ?? "",
      ),
    );
  }
}
