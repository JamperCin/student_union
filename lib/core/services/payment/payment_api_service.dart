import 'dart:collection';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/remote/payment_model.dart';
import 'package:student_union/core/services/payment/payment_api_interface.dart';

class PaymentApiService extends BaseApiService implements PaymentApiInterface {
  static PaymentApiService? _instance;

  PaymentApiService._internal();

  factory PaymentApiService() {
    return _instance ??= PaymentApiService._internal();
  }

  @override
  Future<List<PaymentModel>> fetchPaymentHistory({Map<String,dynamic>? param}) async{
    await Future.delayed(const Duration(seconds: 1));
    final results = await FileUtils().fetchList<PaymentModel>(
      path: 'assets/data/payment_history.json',
      key: 'transactions',
      parser: (json) => PaymentModel.fromJson(json),
    );

    // final results = await _instance?.getListRequest<PaymentModel>(
    //   api: "customer/v1/payments?",
    //    key: "payments"
    //   parser: (json) => PaymentModel.fromJson(json),
    // );

   // debugPrint("results---> $results");

    return results;
  }

  @override
  Future<PaymentModel> makePaymentOfBook(Map<String,dynamic> param) async{
    final results = await _instance?.postRequest<PaymentModel>(
      api: "customer/v1/payments",
      param: param,
      showToast: true,
      parser: (json) => PaymentModel.fromJson(json),
    ) ?? const PaymentModel();

    return results;
  }

  @override
  Future<PaymentModel> makePaymentOfCampaign(Map<String,dynamic> param) async{
    final results = await _instance?.postRequest<PaymentModel>(
      api: "customer/v1/payments",
      parser: (json) => PaymentModel.fromJson(json),
    ) ?? const PaymentModel();

    return results;
  }
}
