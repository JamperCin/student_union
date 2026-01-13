import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/core_ministries_widget.dart';

import '../controller/donations_controller.dart';

class DonationCoreMinistriesScreen extends BaseSharedScreen {
  final _controller = Get.put(DonationsController());

  @override
  String appBarTitle() {
    return "Donations";
  }


  @override
  List<Widget> actions() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.dp(),
        ),
        child: IconButtonWidget(
          icon: Icons.history,
          iconSize: 25.dp(),
          iconColor: colorScheme.tertiary,
          onTap: _controller.onViewDonationHistory,
        ),
      )
    ];
  }


  @override
  Widget body(BuildContext context) {
    return CoreMinistriesWidget.withDonations(
      onTap: _controller.onDonationOnClick,
    );
  }
}
