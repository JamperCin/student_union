import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/model/core_ministry_model.dart';

import '../../../../core/model/success_model.dart';
import '../../../shared/success_screen.dart';
import '../ui/donate_to_core_ministry_screen.dart';

class DonationsController extends BaseController {
  TextEditingController amountTxt = TextEditingController();

  //Onclick listener when a donation is clicked
  void onDonationOnClick(CoreMinistryModel model) {
    navUtils.fireTarget(DonateToCoreMinistryScreen(), model: model);
  }

  Future<void> onInitiateDonateOnClick(
      BuildContext context, CoreMinistryModel model) async {
    //validate amount
    if (amountTxt.text.toString().isEmpty || amountTxt.text.toString() == "0" || double.tryParse(amountTxt.text.toString()) == null) {
      SnackBarSnippet().snackBarError("Please enter a valid amount");
      return;
    }

    const LoaderWidget().showProgressIndicator(context: context);
    await Future.delayed(const Duration(seconds: 2));
    const LoaderWidget().hideProgress();

    navUtils.fireTargetOff(
      SuccessScreen(),
      model: SuccessModel(
        title: "Success",
        message: "You have successfully donated to ${model.title}",
      ),
    );
  }
}
