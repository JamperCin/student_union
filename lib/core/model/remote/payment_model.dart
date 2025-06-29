import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_union/core/model/remote/payable_meta.dart';
import 'package:student_union/core/model/remote/payment_info_meta.dart';

part 'payment_model.freezed.dart';

part 'payment_model.g.dart';

@freezed
class PaymentModel extends BaseObject with _$PaymentModel {
  const factory PaymentModel({
    @Default(0) int id,
    @Default("0.0") String amount,
    @Default("") String status,
    @Default("") String reference,
    @JsonKey(name: 'payment_type') @Default("") String paymentType,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
    @Default("GHS") String currency,
    @JsonKey(name: 'authorization_url') @Default("") String authUrl,
    @JsonKey(name: 'payable_meta')  PayableMeta? payableMeta,
    @JsonKey(name: 'metadata')  PaymentInfoMeta? paymentInfoMeta,
    @JsonKey(name: 'campaign_id') @Default(0) int campaignId,

  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, Object?> json) =>
      _$PaymentModelFromJson(json);
}
