import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/core/res/asset_path.dart';

import '../controller/donations_controller.dart';

class DonateToCoreMinistryScreen extends BaseSharedScreen {
  final _controller = Get.put(DonationsController());

  DonateToCoreMinistryScreen() {
    _controller.amountTxt.text = "";
  }

  @override
  String appBarTitle() {
    return "Donate to Core Ministry";
  }

  @override
  CampaignModel getModel() {
    return super.getModel() as CampaignModel;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              getModel().title,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
            ),
          ),
          Gap(5.dp()),
          NetworkImageWidget(
            url: getModel().image,
            width: appDimen.screenWidth,
            height: appDimen.screenHeight * 0.35,
            fit: BoxFit.contain,
            placeHolderWidget: ContainerWidget(
              width: appDimen.screenWidth,
              height: appDimen.screenHeight * 0.35,
            ),
          ),
          Gap(40.dp()),
          Text(
            "Enter an amount to donate",
            style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
          ),
          Gap(5.dp()),
          TextFieldWidget(
            hintText: "Enter Amount",
            keyboardType: TextInputType.number,
            controller: _controller.amountTxt,
            prefixIcon: Padding(
              padding: EdgeInsets.all(5.dp()),
              child: AssetImageWidget(
                asset: icGhs,
                height: 15.dp(),
                width: 15.dp(),
                assetColor: colorScheme.primary,
              ),
            ),
          ),
          Gap(70.dp()),
          ButtonWidget(
            text: "Proceed",
            textColor: colorScheme.surface,
            onTap: () {
              dismissKeyBoard(context);
              _controller.confirmDonation(context, getModel());
            },
          ),
          Gap(40.dp()),
        ],
      ),
    );
  }
}
