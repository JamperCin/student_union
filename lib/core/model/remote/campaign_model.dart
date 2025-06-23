import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_model.freezed.dart';
part 'campaign_model.g.dart';


@freezed
class CampaignModel extends BaseObject with _$CampaignModel {

  const factory CampaignModel({
    @JsonKey(name: 'image_url')@Default("") String image,
    @Default("") String description,
    @Default(0) int id,
    @JsonKey(name: 'goal_amount')@Default("") String goalAmount,
    @JsonKey(name: 'campaign_type')@Default("") String campaignType,
    @JsonKey(name: 'created_at')@Default("") String createdAt,
    @JsonKey(name: 'account_id')@Default(0) int accountId,
    @Default("") String title,
}) = _CampaignModel;
  
  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);
}
