import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info_meta.freezed.dart';
part 'payment_info_meta.g.dart';

@freezed
class PaymentInfoMeta extends BaseObject with _$PaymentInfoMeta {
  const factory PaymentInfoMeta({
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'campaign_id') int? campaignId,
    @JsonKey(name: 'init_response') InitResponse? initResponse,
  }) = _PaymentInfoMeta;

  factory PaymentInfoMeta.fromJson(Map<String, Object?> json) => _$PaymentInfoMetaFromJson(json);
}

@freezed
class InitResponse with _$InitResponse {
  const factory InitResponse({
    @JsonKey(name: 'data') Data? data,
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
  }) = _InitResponse;

  factory InitResponse.fromJson(Map<String, Object?> json) => _$InitResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'reference') String? reference,
    @JsonKey(name: 'access_code') String? accessCode,
    @JsonKey(name: 'authorization_url') String? authorizationUrl,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

