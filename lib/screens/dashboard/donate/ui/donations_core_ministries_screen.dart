import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/widgets/core_ministries_widget.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';

import '../../news/ui/news_screen.dart';
import '../controller/donations_controller.dart';

class DonationCoreMinistriesScreen extends NewsScreen {
  final _controller = Get.put(DonationsController());

  @override
  String appBarTitle() {
    return "Donation";
  }

  @override
  List<Widget> actions() {
    // TODO: implement actions
    return [
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.dp(),),
        child: IconButtonWidget(
          icon: Icons.history,
          iconSize: 25.dp(),
          onTap: _controller.onViewDonationHistory,
        ),
      )
    ];
  }

  // bool showAppBarIcon = false;

  // @override
  // bool showAppBar() {
  //   return true;
  // }
  //
  // @override
  // double appBarElevation() {
  //   return 10;
  // }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  // @override
  // Widget? appBarLeadingIcon(BuildContext context) {
  //   return showAppBarIcon
  //       ? super.appBarLeadingIcon(context)
  //       : const SizedBox.shrink();
  // }
  //
  // @override
  // void setModel(BaseObject baseObject) {
  //   super.setModel(baseObject);
  //   if (baseObject is CoreMinistryModel) {
  //     showAppBarIcon = true;
  //   } else {
  //     showAppBarIcon = false;
  //   }
  //   print("BAr ==> $showAppBarIcon");
  // }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.dp()),
      child: Column(
        children: [
          // TitleTextWidget(text: "Donate to our core minitries"),
          // Gap(10.dp()),
          Expanded(
            child: CoreMinistriesWidget.withDonations(
              onTap: _controller.onDonationOnClick,
            ),
          ),
        ],
      ),
    );
  }
}
