import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final String? subText;
  final GestureTapCallback? onTap;

  const TitleTextWidget(
      {super.key, required this.text, this.onTap, this.subText});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
        if (onTap != null)
          TextButtonWidget.withTextOnly(
            onTap: onTap!,
            text: subText ?? 'See All',
            style: textTheme.bodyMedium?.copyWith(),
          )
      ],
    );
  }
}
