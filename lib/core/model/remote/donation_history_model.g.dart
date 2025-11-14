// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonationHistoryModelImpl _$$DonationHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$DonationHistoryModelImpl(
  description: json['description'] as String? ?? "",
  currency: json['currency'] as String? ?? "GHS",
  time: json['time'] as String? ?? "",
  amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$DonationHistoryModelImplToJson(
  _$DonationHistoryModelImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'currency': instance.currency,
  'time': instance.time,
  'amount': instance.amount,
};
