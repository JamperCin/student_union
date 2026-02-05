import 'dart:isolate';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/enums/segment_type.dart';
import 'package:student_union/core/model/local/text_segment.dart';
import 'package:student_union/core/model/remote/upcoming_event_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EventTextSegmentationWidget extends StatelessWidget {
  final UpcomingEventModel event;
  const EventTextSegmentationWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return FutureBuilder<List<TextSegment>>(
      // Offload the heavy work to a separate worker thread
      future: Isolate.run(() => parseDescription(event.description)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Show plain text while the background thread is working
          return Text(event.description, style: textTheme.bodySmall);
        }

        final segments = snapshot.data!;
        return RichText(
          text: TextSpan(
            children: segments.map((segment) {
              if (segment.type == SegmentType.text) {
                return TextSpan(text: segment.text, style: textTheme.bodySmall);
              }

              return TextSpan(
                text: segment.text,
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    final uri = segment.type == SegmentType.phone
                        ? Uri.parse("tel:${segment.text.replaceAll(' ', '')}")
                        : Uri.parse(segment.text);
                    launchUrl(uri);
                  },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
