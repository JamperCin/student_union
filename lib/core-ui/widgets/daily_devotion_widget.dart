import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/double_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core/res/asset_path.dart';

class DailyDevotionWidget extends StatelessWidget {
  final GestureTapCallback? onReadOnTap;
  final GestureTapCallback? onShareOnTap;
  final GestureTapCallback? onReadBibleOnTap;

  const DailyDevotionWidget({
    super.key,
    this.onReadOnTap,
    this.onShareOnTap,
    this.onReadBibleOnTap,
  });

  final text =
      'The secret things belong to the Lord our God, but the things revealed belong to us and to our children forever, that we may follow all the words of this law.';
  final lead = '—  ';
  final script = 'Deuteronomy 29:29';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerWidget(
          backgroundImage: icDevotionBg,borderColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 5.dp(), vertical: 8.dp()),
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
                    fontSize: 10.dp(),
                    color: colorScheme.tertiary,
                  ),
                ),
                TextSpan(
                  text: lead,
                  style: textTheme.labelMedium?.copyWith(
                      fontSize: 12.dp(),
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      ),
                ),TextSpan(
                  text: script,
                  style: textTheme.labelMedium?.copyWith(
                      fontSize: 12.dp(),
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      ),
                ),
              ])),
              Gap(5.dp()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerWidget(
                    onTap: onReadBibleOnTap,
                    borderRadius: 20,
                    borderColor: colorScheme.tertiary,
                    // text: "Read",
                    // backgroundColor: colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.dp(),
                      vertical: 0.1.dp(),
                    ),
                    child: Center(
                        child: Text(
                      "Read Bible",
                      style: textTheme.labelMedium,
                    )),
                  ),
                  Row(
                    children: [
                      IconButtonWidget(
                        icon: Icons.share,
                        iconColor: colorScheme.tertiary,
                        onTap: onShareOnTap,
                      ),
                      Gap(5.dp()),
                      IconButtonWidget(
                        icon: Icons.volume_up,
                        iconColor: colorScheme.tertiary,
                        onTap: onReadOnTap,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
