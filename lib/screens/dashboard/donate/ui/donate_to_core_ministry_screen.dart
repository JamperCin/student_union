import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core/model/core_ministry_model.dart';
import 'package:student_union/core/res/asset_path.dart';

import '../controller/donations_controller.dart';

class DonateToCoreMinistryScreen extends BaseScreenStandard {
  final _controller = Get.put(DonationsController());

  @override
  String appBarTitle() {
    return getModel().title;
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  CoreMinistryModel getModel() {
    return super.getModel() as CoreMinistryModel;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkImageWidget(
            url: getModel().image,
            width: appDimen.screenWidth,
            height: appDimen.screenHeight * 0.4,
            fit: BoxFit.cover,
            placeHolderWidget: ContainerWidget(
              width: appDimen.screenWidth,
              height: appDimen.screenHeight * 0.4,
            ),
          ),
          Gap(40.dp()),
          Text("Enter an amount to donate",
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary)),
          Gap(5.dp()),
          TextFieldWidget(
            hintText: "Enter Amount",
            keyboardType: TextInputType.number,
            controller: _controller.amountTxt,
            prefixIcon: Padding(
              padding:  EdgeInsets.all(5.dp()),
              child: AssetImageWidget(
                asset: icGhs,
                height: 15.dp(),
                width: 15.dp(),
              ),
            ),
          ),
          Gap(70.dp()),
          ButtonWidget(
              text: "Proceed",
              onTap: () {
                _controller.onInitiateDonateOnClick(context, getModel());
              }),
          Gap(40.dp()),
        ],
      ),
    );
  }
}
