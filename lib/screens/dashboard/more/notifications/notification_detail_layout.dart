import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class NotificationDetailLayout extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  const NotificationDetailLayout({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(5.dp()),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          Gap(16.dp()),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              DateTimeUtils().formatDate(date, format: 'dd MMM yyyy, hh:mm a'),
              style: textTheme.labelMedium?.copyWith(fontSize: 10.dp()),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
