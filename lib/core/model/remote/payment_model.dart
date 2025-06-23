import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel extends BaseObject with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(name: 'transactionId') String? transactionId,
    @JsonKey(name: 'amount') double? amount,
    String? currency,
    String? ref,
    String? name,
    String? status,
    @JsonKey(name: 'transactionType') String? transactionType,
    @JsonKey(name: 'authorization_url') String? authUrl,
    @JsonKey(name: 'campaign_id') int? campaignId,
    @JsonKey(name: 'created_at') String? createdAt,
    String? narration,
    @JsonKey(name: 'book_id') int? bookId,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, Object?> json) => _$PaymentModelFromJson(json);
}

