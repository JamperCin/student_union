import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:student_union/core-ui/widgets/core_ministries_widget.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/model/donation_history_model.dart';

import '../../news/news_screen.dart';
import '../controller/donations_controller.dart';

class DonationCoreMinistriesScreen extends NewsScreen{
  final _controller = Get.put(DonationsController());

  @override
  String appBarTitle() {
    return "Donation";
  }

  bool showAppBarIcon = false;

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double appBarElevation() {
    return 10;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super.appBarTitleStyle(context)?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return showAppBarIcon
        ? super.appBarLeadingIcon(context)
        : const SizedBox.shrink();
  }

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    if (baseObject is DonationHistoryModel) {
      showAppBarIcon = true;
    } else {
      showAppBarIcon = false;
    }
    print("BAr ==> $showAppBarIcon");
  }


  @override
  Widget body(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(16.dp()),
     child: Column(
       children: [
         TitleTextWidget(text: "Donate to our core minitries"),
         Gap(10.dp()),
         Expanded(
           child: CoreMinistriesWidget.withDonations(onTap: _controller.onDonationOnClick,),
         ),
       ],
     ),
   );
  }

}