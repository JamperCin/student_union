import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/payment_history_widget.dart';

class DonationsHistoryScreen extends BaseSharedScreen {
  @override
  String appBarTitle() {
    return 'Donations History';
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.dp(),
        vertical: 16.dp(),
      ),
      child:  PaymentHistoryWidget(),
    );
  }
}
