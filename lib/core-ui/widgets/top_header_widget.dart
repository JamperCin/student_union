import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core/def/global_access.dart';

class TopHeaderWidget extends StatelessWidget {
  final VoidCallback? onNotifyOnClick;
  final VoidCallback? onSearchOnClick;
  final bool displayEmail;

  const TopHeaderWidget({
    super.key,
    this.onNotifyOnClick,
    this.onSearchOnClick,
  }) : displayEmail = false;

  const TopHeaderWidget.withEmail({
    super.key,
    this.onNotifyOnClick,
    this.onSearchOnClick,
  }) : displayEmail = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: appDimen.screenWidth,
      color: colorScheme.surface,
      padding: EdgeInsets.symmetric(
        horizontal: appDimen.dimen(10),
        vertical: appDimen.dimen(5),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NetworkImageWidget.withCircular(
                  url: userApiService.profilePic.value,
                  radius: appDimen.dimen(40),
                ),
                SizedBox(width: appDimen.dimen(5)),
                if (displayEmail)
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'John Doe',
                        style: textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: '\nmyemail@gmail.com',
                        style: textTheme.labelSmall,
                      )
                    ],
                  ))
                else
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(text: 'Welcome', style: textTheme.titleLarge),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'John Doe',
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.primary),
                      ),
                      TextSpan(text: '  👋', style: textTheme.bodyLarge),
                    ],
                  )),
              ],
            ),
            SizedBox(width: appDimen.dimen(5)),
            Row(
              children: [
                if (onSearchOnClick != null)
                  IconButtonWidget(
                    icon: Icons.search,
                    iconSize: 25,
                    iconPadding: 2,
                    //backgroundColor: colorScheme.inversePrimary.withOpacity(0.5),
                    // borderColor: Colors.transparent,
                    onTap: onSearchOnClick,
                  ),
                if (onSearchOnClick != null) Gap(appDimen.dimen(1)),
                IconButtonWidget(
                  icon: Icons.notifications_none,
                  iconSize: 25,
                  iconPadding: 2,
                  iconColor: colorScheme.primary,
                  onTap: onNotifyOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
