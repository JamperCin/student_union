import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/button_switch_widget.dart';
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
            title: "About",
            prefixAsset: icAbout,
            prefixAssetHeight: prefixSize,
            onTap: (v) {
              _controller.onAboutOnClick();
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Profile",
            prefixAsset: icProfileCircular,
            prefixAssetHeight: prefixSize,
            onTap: (v) {
              _controller.onEditProfileOnClick();
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Read Bible",
            prefixAsset: icReadBible,
            prefixAssetHeight: prefixSize,
            onTap: _controller.onReadBibleOnClick,
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
            onTap: _controller.onCounsellingOnClick,
          ),
          // Gap(10.dp()),
          // SimpleCardItem(
          //   title: "Chat",
          //   prefixAsset: icChat,
          //   prefixAssetHeight: prefixSize,
          // ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Settings",
            prefixAsset: icSettingsIcon,
            prefixAssetHeight: prefixSize,
            onTap: (v) {
              _controller.onSettingsOnClick();
            },
          ),
          Gap(10.dp()),
          SimpleCardItem(
            title: "Log Out",
            prefixAsset: icLogOutIcon,
            prefixAssetHeight: prefixSize,
            onTap: (v) {
              _controller.onLogOutOnClick(context);
            },
          ),
          Gap(10.dp()),
        ],
      ),
    );
  }
}
