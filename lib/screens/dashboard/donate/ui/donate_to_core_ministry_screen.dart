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
  DonationModel getModel() {
    return super.getModel() as DonationModel;
  }

  @override
  Widget body(BuildContext context) {
    final model = getModel();
    final goalAmount = parseDouble(model.goalAmount);
    final raisedAmount = parseDouble(model.raisedAmount);
    final currency = model.currency.isEmpty ? "GHS" : model.currency;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
            ),
          ),
          Gap(10.dp()),
          NetworkImageWidget(
            url: model.image,
            width: appDimen.screenWidth,
            height: appDimen.screenHeight * 0.3,
            fit: BoxFit.contain,
            placeHolderWidget: ContainerWidget(
              width: appDimen.screenWidth,
              height: appDimen.screenHeight * 0.3,
            ),
          ),

          //display description if available
          if (model.description.isNotEmpty)
            Column(
              children: [
                Gap(10.dp()),
                Text(model.description, style: textTheme.labelMedium),
              ],
            ),

          //if Goal amount is not empty and greater than zero, display it
          if (goalAmount > 0.0)
            Column(
              children: [
                Gap(20.dp()),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Goal Amount: ",
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: "$currency ${goalAmount.toDecimalPlaces()}",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          //If Raised amount is not empty and greater than zero, display it
          if (raisedAmount > 0.0)
            Column(
              children: [
                Gap(10.dp()),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Raised Amount: ",
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: "$currency ${raisedAmount.toStringAsFixed(2)}",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  double parseDouble(String? amount) {
    double value = 0.0;
    if (amount == null || amount.isEmpty) {
      return value;
    }

    try {
      value = amount.isEmpty ? 0.0 : double.parse(amount);
    } catch (e) {
      return value;
    }
    return value;
  }
}
