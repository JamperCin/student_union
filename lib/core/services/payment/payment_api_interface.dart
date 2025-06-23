import 'dart:collection';

import 'package:student_union/core/model/remote/payment_model.dart';

abstract class PaymentApiInterface{

  Future<PaymentModel> makePaymentOfBook(Map<String,dynamic> param);
  Future<PaymentModel> makePaymentOfCampaign(Map<String,dynamic> param);
  Future<List<PaymentModel>> fetchPaymentHistory({Map<String,dynamic>? param});

}