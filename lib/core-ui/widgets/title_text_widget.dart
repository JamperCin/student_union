import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;

  const TitleTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Text(text, style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700));
  }
}
