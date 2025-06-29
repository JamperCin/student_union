import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/payment_history_widget.dart';

class DonationsHistoryScreen extends BaseScreenStandard {
  @override
  String appBarTitle() {
    return 'Donations History';
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.dp(),
        vertical: 16.dp(),
      ),
      child:  PaymentHistoryWidget(),
    );
  }
}
