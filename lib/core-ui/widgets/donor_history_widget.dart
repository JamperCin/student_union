import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';

class DonorHistoryWidget extends StatelessWidget {
  const DonorHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coreMinistryApiService.fetchListDonationHistory(),
        builder: (context, data) {
          return ListView();
        });
  }
}
