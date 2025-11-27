import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/remote/upcoming_event_model.dart';

class EventDetailsScreen extends BaseSharedScreen {
  final UpcomingEventModel event;

  EventDetailsScreen(this.event);

  @override
  String appBarTitle() {
    return "Event Details";
  }

  @override
  Widget body(BuildContext context) {
    final url =
        RegExp(r'(https?://\S+)').firstMatch(event.description)?.group(0) ?? '';

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.dp()),
      child: Column(
        children: [
          Text(event.name, style: textTheme.titleLarge),
          Gap(10.dp()),
          NetworkImageWidget(
            height: appDimen.screenHeight * 0.55,
            width: appDimen.screenWidth,
            url: event.image,
            fit: BoxFit.fitWidth,
            placeHolderWidget: ContainerWidget(
              height: appDimen.screenHeight * 0.55,
              width: appDimen.screenWidth,
            ),
          ),
          Gap(10.dp()),
          //TODO Extract only the link from the description and bolden the text and underlined blue color
          Align(
            alignment: Alignment.centerLeft,
            child: event.description.contains('http')
                ? GestureDetector(
                    onTap: () => launchUrl(Uri.parse(url)),
                    child: Text(event.description, style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ))
                  )
                : Text(event.description, style: textTheme.bodySmall),
          ),
          Gap(20.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(text: 'Start Date: ', style: textTheme.bodyMedium),
                  TextSpan(
                    text: DateTimeUtils().formatDate(
                      event.startDate,
                      format: "dd MMM, yyyy",
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(text: 'End Date: ', style: textTheme.bodyMedium),
                  TextSpan(
                    text: DateTimeUtils().formatDate(
                      event.endDate,
                      format: "dd MMM, yyyy",
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
