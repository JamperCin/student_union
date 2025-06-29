import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payable_meta.freezed.dart';
part 'payable_meta.g.dart';

@freezed
class PayableMeta extends BaseObject with _$PayableMeta {
  const factory PayableMeta({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'account_id') int? accountId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'archived') bool? archived,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'update_by') dynamic updateBy,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'campaign_type_id') int? campaignTypeId,
    @JsonKey(name: 'goal_amount') String? goalAmount,
    @JsonKey(name: 'raised_amount') String? raisedAmount,
    @JsonKey(name: 'donation_amount') String? donationAmount,
  }) = _PayableMeta;

  factory PayableMeta.fromJson(Map<String, Object?> json) => _$PayableMetaFromJson(json);
}

