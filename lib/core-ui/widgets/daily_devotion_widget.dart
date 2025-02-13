import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/res/asset_path.dart';

class DailyDevotionWidget extends StatelessWidget {
  const DailyDevotionWidget({super.key});

  final text =
      'The secret things belong to the Lord our God, but the things revealed belong to us and to our children forever, that we may follow all the words of this law.';
  final script = 'Deuteronomy 29:29';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerWidget(
          backgroundImage: icDevotionBg,
          padding: EdgeInsets.all(5.dp()),
          width: appDimen.screenWidth,
          child: Column(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: text,
                  style: textTheme.labelMedium?.copyWith(
                      fontSize: 12.dp(), color: colorScheme.tertiary),
                ),
                    TextSpan(
                      text: "\n\n",
                      style: textTheme.labelMedium?.copyWith(
                          fontSize: 10.dp(), color: colorScheme.tertiary),
                    ),
                    TextSpan(
                      text: script,
                      style: textTheme.labelMedium?.copyWith(
                          fontSize: 12.dp(), color: colorScheme.secondary),
                    ),
              ])),

            ],
          ),
        ),
      ],
    );
  }
}
