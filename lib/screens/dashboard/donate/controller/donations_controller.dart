import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/enums/payment_type.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/campaign_model.dart';
import 'package:student_union/screens/dashboard/donate/ui/donations_history_screen.dart';

import '../../../../core/model/local/success_model.dart';
import '../../../shared/success_screen.dart';
import '../ui/donate_to_core_ministry_screen.dart';

class DonationsController extends BaseController {
  TextEditingController amountTxt = TextEditingController();

  //Onclick listener when a donation is clicked
  void onDonationOnClick(CampaignModel model) {
    navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
  }

  Future<void> onInitiateDonateOnClick(
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
      "metadata": {"campaign_id": model.id, "note": "Donations"}
    };

    const LoaderWidget().showProgressIndicator(context: context);
    final results = await paymentApiService.makePaymentOfBook(param);
    if (results.authUrl != null) {
      navToPaymentScreen(results.authUrl ?? '');
    }
    const LoaderWidget().hideProgress();

    // navUtils.fireTargetOff(
    //   SuccessScreen(),
    //   model: SuccessModel(
    //     title: "Success",
    //     message: "You have successfully donated to ${model.title}",
    //   ),
    // );
  }

  void navToPaymentScreen(String url) {
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
