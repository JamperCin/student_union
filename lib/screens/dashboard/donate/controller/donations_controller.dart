import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/extensions/string_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/confirm_transaction_layout.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/enums/payment_type.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';

import '../ui/donate_to_core_ministry_screen.dart';

class DonationsController extends BaseController {
  TextEditingController amountTxt = TextEditingController();

  //Onclick listener when a donation is clicked
  void onDonationOnClick(CampaignModel model) {
    navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
  }

  void confirmDonation(BuildContext context, CampaignModel model) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.5,
      child: ConfirmTransactionLayout(
        title: "Confirm Donation",
        titleStyle: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
        subTitle:
            "Kindly confirm your donation to ${model.title} with the amount stated below",
        buttonTitle: "Proceed",
        cancelAssetColor: Theme.of(context).colorScheme.surface,
        buttonStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.surface),
        onTap: () => _initiateDonation(context, model),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${model.currency} ${amountTxt.text.toString().toDecimalPlaces()}",
                style: textTheme.displayLarge,
              ),
              Gap(5.dp()),
              Text(
                "Amount",
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onInverseSurface,
                ),
              ),
              Gap(20.dp()),
              Text(" ${model.title}", style: textTheme.titleLarge),
              Gap(5.dp()),
              Text(
                "Campaign Details",
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onInverseSurface,
                ),
              ),
              Gap(20.dp()),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initiateDonation(
      BuildContext context, CampaignModel model) async {
    //validate amount
    if (amountTxt.text.toString().isEmpty ||
        amountTxt.text.toString() == "0" ||
        double.tryParse(amountTxt.text.toString()) == null) {
      SnackBarSnippet().snackBarError("Please enter a valid amount");
      return;
    }
    Map<String, dynamic> param = {
      "payment_type": PaymentType.campaign_donation.name,
      "metadata": {
        "campaign_id": model.id,
        "note": "Donations",
        "amount": amountTxt.text.toString(),
      },

    };

    const LoaderWidget().showProgressIndicator(context: context);
    final results = await paymentApiService.makePaymentOfBook(param);
    navToPaymentScreen(results.authUrl);
    const LoaderWidget().hideProgress();
  }

  void navToPaymentScreen(String url) {
    if (url.isEmpty) return;

    navUtils.fireTarget(
      BaseWebView(
        model: WebModel(
            url: url,
            onDoneOnclick: () {
              navUtils.fireTargetHome();
            }),
      ),
    );
  }

  void onViewDonationHistory() {
    navUtils.fireTarget(DonationsHistoryScreen());
  }
}
