import 'package:core_module/core_module.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/event_text_segmentation_widget.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/utils/share_file_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/remote/upcoming_event_model.dart';

class EventDetailsScreen extends BaseSharedScreen {
  final UpcomingEventModel event;
  RxBool hasStartedSharing = false.obs;

  EventDetailsScreen(this.event);

  @override
  String appBarTitle() {
    return "Event Details";
  }

  Widget _buildDescriptionWithLinks() {
    final List<TextSpan> spans = [];
    final text = event.description;
    int lastIndex = 0;

    try {
      // Find all phone numbers
      final phoneRegex = RegExp(r'(\+233\s?\d{3}\s?\d{3}\s?\d{3})');
      final phoneMatches = phoneRegex.allMatches(text).toList();

      // Find all URLs
      final urlRegex = RegExp(r'(https?://\S+)');
      final urlMatches = urlRegex.allMatches(text).toList();

      // Combine and sort all matches by position
      final allMatches = [...phoneMatches, ...urlMatches].toList()
        ..sort((a, b) => a.start.compareTo(b.start));

      for (final match in allMatches) {
        // Add text before the match
        if (lastIndex < match.start) {
          spans.add(
            TextSpan(
              text: text.substring(lastIndex, match.start),
              style: textTheme.bodySmall,
            ),
          );
        }

        // Add the matched text (phone or URL) with styling
        if (phoneMatches.contains(match)) {
          spans.add(
            TextSpan(
              text: match.group(0),
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //Dial the phone number
                  var phoneNumber = match.group(0)?.replaceAll(' ', '') ?? '';
                  debugPrint("Dialing phone number: $phoneNumber");
                  launchUrl(Uri.parse("tel:$phoneNumber"));
                },
            ),
          );
        } else if (urlMatches.contains(match)) {
          spans.add(
            TextSpan(
              text: match.group(0),
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchUrl(Uri.parse(match.group(0) ?? '')),
            ),
          );
        }

        lastIndex = match.end;
      }

      // Add remaining text
      if (lastIndex < text.length) {
        spans.add(
          TextSpan(text: text.substring(lastIndex), style: textTheme.bodySmall),
        );
      }

      return spans.isEmpty
          ? Text(event.description, style: textTheme.bodySmall)
          : RichText(text: TextSpan(children: spans));
    } catch (e) {
      debugPrint("Error parsing description links: $e");
      return Text(event.description, style: textTheme.bodySmall);
    }
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.dp()),
      child: Column(
        children: [
          Text(event.name, style: textTheme.titleLarge),
          Gap(10.dp()),
          NetworkImageWidget(
            height: appDimen.screenHeight * 0.4,
            width: appDimen.screenWidth,
            url: event.image,
            fit: BoxFit.contain,
            heroTag: event.heroTag,
            placeHolderWidget: ContainerWidget(
              height: appDimen.screenHeight * 0.4,
              width: appDimen.screenWidth,
            ),
          ),
          Gap(10.dp()),

          //Display decription, if it contains a url or telephone number, make
          //only the url and phone clickable, underlined and blue.
          //The rest of text in black normal font eg: +233 243 303 679 | +233 556 711 969. or http link
          Align(
            alignment: Alignment.centerLeft,
            child: EventTextSegmentationWidget(event: event),
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
          Gap(15.dp()),
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
          Gap(10.dp()),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(text: 'Location: ', style: textTheme.bodyMedium),
                  TextSpan(
                    text: event.location,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(40.dp()),
          Obx(
            () => FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(primaryGreenColor),
              ),
              onPressed: hasStartedSharing.value
                  ? null
                  : () async {
                      hasStartedSharing.value = true;
                      await ShareFileUtils().saveAndShareImage(
                        imageUrl: event.image,
                        title: "${event.name}\n\n${event.description}",
                      );
                      hasStartedSharing.value = false;
                    },
              label: Text(
                "   Share   ",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              icon: hasStartedSharing.value
                  ? const CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    )
                  : Icon(Icons.share, color: Colors.white, size: 20.dp()),
            ),
          ),
          Gap(40.dp()),
        ],
      ),
    );
  }
}
