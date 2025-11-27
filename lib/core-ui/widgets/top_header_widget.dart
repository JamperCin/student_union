import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core/db/app_preference.dart';
import 'package:student_union/core/def/global_access.dart';

import '../../core/res/asset_path.dart';

class TopHeaderWidget extends StatelessWidget {
  final VoidCallback? onNotifyOnClick;
  final VoidCallback? onSearchOnClick;
  final VoidCallback? onProfileOnClick;
  final bool displayEmail;

  const TopHeaderWidget({
    super.key,
    this.onNotifyOnClick,
    this.onProfileOnClick,
    this.onSearchOnClick,
  }) : displayEmail = false;

  const TopHeaderWidget.withEmail({
    super.key,
    this.onNotifyOnClick,
    this.onSearchOnClick,
    this.onProfileOnClick,
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
            InkWell(
              onTap: onProfileOnClick,
              child: Row(
                children: [
                  NetworkImageWidget.withCircular(
                    url: userApiService.profilePic.value.isEmpty
                        ? appPreference.getString(AppPreference().PROFILE_IMAGE)
                        : userApiService.profilePic.value,
                    radius: appDimen.dimen(40),
                    placeholder: icUserIc,
                    heroTag: "Profile_img_ui_xyz",
                  ),
                  SizedBox(width: appDimen.dimen(5)),
                  if (displayEmail)
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: appPreference.getUser().name,
                          style: textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: appPreference.getUser().email,
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
                          text: appPreference.getUser().name,
                          style: textTheme.bodyMedium
                              ?.copyWith(color: colorScheme.primary),
                        ),
                        TextSpan(text: '  👋', style: textTheme.bodyLarge),
                      ],
                    )),
                ],
              ),
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
                    iconColor: colorScheme.primary,
                    onTap: onSearchOnClick,
                  ),
                if (onSearchOnClick != null) Gap(appDimen.dimen(1)),
                if (onNotifyOnClick != null)
                  InkWell(
                    onTap: onNotifyOnClick,
                    child: Badge(
                      backgroundColor: Colors.red,
                      label: Center(
                        child: Text(
                          "${notificationCount.value}",
                          style: textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 10.dp(),
                          ),
                        ),
                      ),
                      isLabelVisible: true,
                      child: Icon(
                        Icons.notifications_none,
                        size: 25.dp(),
                        color: colorScheme.inverseSurface,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
