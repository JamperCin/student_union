import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:student_union/core-ui/widgets/simple_card_item.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:student_union/screens/dashboard/more/more_controller.dart';

class MoreScreen extends BaseScreenStandard {
  final _controller = Get.put(MoreController());

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.shadow.withOpacity(0.2);
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  String appBarTitle() {
    return "More";
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    final prefixSize = 25.dp();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: appDimen.dimen(10),
        horizontal: appDimen.dimen(10),
      ),
      child: Column(
        children: [
          SimpleCardItem(
            title: "Profile",
            prefixAsset: icProfileCircular,
            prefixAssetHeight: prefixSize,
            onTap: (v){
              _controller.onEditProfileOnClick();
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Read Bible",
            prefixAsset: icReadBible,
            prefixAssetHeight: prefixSize,
          ),
         /* Gap(10.dp()),
          SimpleCardItem(
            title: "Highlights",
            prefixAsset: icEdit,
            prefixAssetHeight: prefixSize,
          ),*/
          Gap(10.dp()),
          SimpleCardItem(
            title: "Counselling & Prayers",
            prefixAsset: icPray,
            prefixAssetHeight: prefixSize,
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Chat",
            prefixAsset: icChat,
            prefixAssetHeight: prefixSize,
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Settings",
            prefixAsset: icSettingsIcon,
            prefixAssetHeight: prefixSize,
            onTap: (v){
              _controller.onSettingsOnClick();
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Log Out",
            prefixAsset: icLogOutIcon,
            prefixAssetHeight: prefixSize,
          ),
          Gap(10.dp()),
        ],
      ),
    );
  }
}
