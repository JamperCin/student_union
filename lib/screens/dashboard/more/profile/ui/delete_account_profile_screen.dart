import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/more/profile/controller/delete_account_controller.dart';

class DeleteAccountProfileScreen extends BaseScreenStandard {
  final _controller = Get.put(DeleteAccountController());

  @override
  String appBarTitle() {
    return 'Delete Account';
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 20.dp()),
      child: Column(
        children: [
          AssetImageWidget(
            asset: icDanger,
            height: 150.dp(),
            width: 180.dp(),
          ),
          Gap(50.dp()),
          Text(
            'Deleting your account will:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(20.dp()),
          IconTextWidget(
            asset: icDanger,
            textStyle: textTheme.labelMedium,
            text: 'Delete your account info and your profile picture',
          ),
          Gap(10.dp()),
          IconTextWidget(
            asset: icDanger,
            textStyle: textTheme.labelMedium,
            text: 'Delete all your purchased daily devotions.',
          ),
          Gap(10.dp()),
          IconTextWidget(
            asset: icDanger,
            textStyle: textTheme.labelMedium,
            text: 'Delete all your donation history.',
          ),
          Gap(10.dp()),
          IconTextWidget(
            asset: icDanger,
            textStyle: textTheme.labelMedium,
            text: 'Delete all your purchase history.',
          ),
          Gap(10.dp()), IconTextWidget(
            asset: icDanger,
            textStyle: textTheme.labelMedium,
            text: 'Delete all your favorite devotional guides.',
          ),
          Gap(100.dp()),
          ButtonWidget(
            text: "Delete Account",
            textColor: colorScheme.surface,
            onTap:()=> _controller.onConfirmDeleteAccount(context),
          ),
          Gap(10.dp()),
        ],
      ),
    );
  }

  // @override
  // Widget bottomNavigationBar(BuildContext context) {
  //   return Padding(
  //     padding:  EdgeInsets.symmetric(horizontal: 24.dp(), vertical: 24.dp()),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         ButtonWidget(
  //           text: "Delete Account",
  //           onTap:()=> _controller.onConfirmDeleteAccount(context),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
