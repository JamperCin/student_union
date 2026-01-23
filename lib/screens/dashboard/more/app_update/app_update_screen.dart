import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/app_update_model.dart';
import 'package:student_union/core/res/asset_path.dart';

class AppUpdateScreen extends BaseSharedScreen {
  @override
  bool showAppBar() {
    return false;
  }

  @override
  AppUpdateModel getModel() {
    return baseObject as AppUpdateModel;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  @override
  Widget body(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        children: [
          Gap(appDimen.screenHeight * 0.15),
          AssetImageWidget(asset: icSuccess, height: 220.dp(), width: 250.dp()),
          Gap(50.dp()),
          Text(
            getModel().title,
            textAlign: TextAlign.center,
            style: textTheme.displayLarge?.copyWith(color: colorScheme.primary),
          ),
          Gap(20.dp()),
          Text(
            getModel().description ??
                "Please update to the latest version to enjoy new features and improvements.",
            textAlign: TextAlign.start,
            style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),
          ),
          Gap(70.dp()),
          ButtonWidget(
            text: "Update Now",
            textColor: colorScheme.surface,
            onTap: openAppOnStore,
          ),
          Gap(10.dp()),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              isMayBeLaterSet = true;
              navUtils.fireTargetHome();
            },
            child: Text(
              'Maybe Later',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
            ),
          ),
          Gap(40.dp()),
        ],
      ),
    );
  }

  void openAppOnStore() {
    final inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(appStoreId: '6753677173');
  }
}
