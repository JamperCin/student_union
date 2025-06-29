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


  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }


  @override
  Widget body(BuildContext context) {
    return CoreMinistriesWidget.withDonations(
      onTap: _controller.onDonationOnClick,
    );
  }
}
