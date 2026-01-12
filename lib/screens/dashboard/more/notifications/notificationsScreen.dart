import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/notification_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/more/notifications/notification_controller.dart';

class NotificationsScreen extends BaseScreenStandard {
  final _controller = Get.put(NotificationController());

  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return 'Notifications';
  }

  @override
  Widget body(BuildContext context) {
    return FutureBuilder(
      future: notificationApiService.fetchNotifications(
        param: {"page": (_controller.page = 1).toString()},
      ),
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<NotificationModel>> snapshot,
          ) {
            return snapshot.hasData && snapshot.data != null
                ? _notificationList(context, snapshot.data!)
                : ShimmerWidget.withList();
          },
    );
  }

  Widget _notificationList(BuildContext context, List<NotificationModel> list) {
    if (list.isEmpty) {
      return const NoDataWidget(
        asset: icNotification,
        title: 'You have no Notifications.',
        description:
            'Notifications you receive will be displayed here. You have no notifications at the moment.',
      );
    }

    return ListViewWidget<NotificationModel>(
      list: list,
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 20.dp()),
      listItemWidget: (model) => _notificationItem(context, model),
      onLoadMore: _controller.onLoadMore,
      onRefresh: _controller.onRefresh,
    );
  }

  Widget _notificationItem(BuildContext context, NotificationModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => _controller.onNotificationTap(context, model),
      child: Column(
        children: [
          Row(
            children: [
              AssetImageWidget(
                asset: icNotification,
                height: 20.dp(),
                width: 20.dp(),
              ),
              Gap(10.dp()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? '',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: model.body ?? '',
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         model.body ?? '',
                    //         style: textTheme.bodySmall,
                    //       ),
                    //     ),
                    //     Gap(10.dp()),
                    //     Text(
                    //       DateTimeUtils().formatDate(model.createdAt ?? '', format: 'dd MMM yyyy, \nhh:mm a'),
                    //       style: textTheme.labelMedium?.copyWith(fontSize: 8.dp()),
                    //       textAlign: TextAlign.end,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Gap(10.dp()),
          const DividerWidget(),
          Gap(10.dp()),
        ],
      ),
    );
  }
}
