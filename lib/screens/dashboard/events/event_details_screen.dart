import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/confirm_transaction_layout.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/model/remote/upcoming_event_model.dart';

class EventDetailsScreen extends BaseScreenStandard {
  final UpcomingEventModel event;

  EventDetailsScreen(this.event);

  @override
  Widget body(BuildContext context) {
    return ConfirmTransactionLayout(
      title: event.name,
      buttonTitle: 'Close',
      displayCancelButton: false,
      child: Column(
        children: [
          NetworkImageWidget(
            height: 200.dp(),
            width: appDimen.screenWidth,
            url: event.image,
            fit: BoxFit.fitWidth,
            placeHolderWidget: ContainerWidget(
              height: 200.dp(),
              width: appDimen.screenWidth,
            ),
          ),
          Gap(40.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(event.description, style: textTheme.bodySmall),
          ),
          Gap(20.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(text: 'Start Date: ', style: textTheme.bodyMedium),
                  TextSpan(
                      text: DateTimeUtils()
                          .formatDate(event.startDate, format: "dd MMM, yyyy"),
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700))
                ])),
          ),
          Gap(20.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(text: 'End Date: ', style: textTheme.bodyMedium),
                  TextSpan(
                      text: DateTimeUtils()
                          .formatDate(event.endDate, format: "dd MMM, yyyy"),
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700))
                ])),
          )
        ],
      ),
    );
  }
}
