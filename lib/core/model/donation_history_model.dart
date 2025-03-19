import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation_history_model.freezed.dart';
part 'donation_history_model.g.dart';


@freezed
class DonationHistoryModel extends BaseObject with _$DonationHistoryModel {
  const factory DonationHistoryModel({
    @Default("") String description,
    @Default("GHS") String currency,
    @Default("") String time,
    @Default(0.0) double amount,
}) = _DonationHistoryModel;

  factory DonationHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$DonationHistoryModelFromJson(json);
}
