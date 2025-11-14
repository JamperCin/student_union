// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DonationHistoryModel _$DonationHistoryModelFromJson(Map<String, dynamic> json) {
  return _DonationHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$DonationHistoryModel {
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this DonationHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DonationHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DonationHistoryModelCopyWith<DonationHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationHistoryModelCopyWith<$Res> {
  factory $DonationHistoryModelCopyWith(
    DonationHistoryModel value,
    $Res Function(DonationHistoryModel) then,
  ) = _$DonationHistoryModelCopyWithImpl<$Res, DonationHistoryModel>;
  @useResult
  $Res call({String description, String currency, String time, double amount});
}

/// @nodoc
class _$DonationHistoryModelCopyWithImpl<
  $Res,
  $Val extends DonationHistoryModel
>
    implements $DonationHistoryModelCopyWith<$Res> {
  _$DonationHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DonationHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? currency = null,
    Object? time = null,
    Object? amount = null,
  }) {
    return _then(
      _value.copyWith(
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DonationHistoryModelImplCopyWith<$Res>
    implements $DonationHistoryModelCopyWith<$Res> {
  factory _$$DonationHistoryModelImplCopyWith(
    _$DonationHistoryModelImpl value,
    $Res Function(_$DonationHistoryModelImpl) then,
  ) = __$$DonationHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String currency, String time, double amount});
}

/// @nodoc
class __$$DonationHistoryModelImplCopyWithImpl<$Res>
    extends _$DonationHistoryModelCopyWithImpl<$Res, _$DonationHistoryModelImpl>
    implements _$$DonationHistoryModelImplCopyWith<$Res> {
  __$$DonationHistoryModelImplCopyWithImpl(
    _$DonationHistoryModelImpl _value,
    $Res Function(_$DonationHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DonationHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? currency = null,
    Object? time = null,
    Object? amount = null,
  }) {
    return _then(
      _$DonationHistoryModelImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DonationHistoryModelImpl implements _DonationHistoryModel {
  const _$DonationHistoryModelImpl({
    this.description = "",
    this.currency = "GHS",
    this.time = "",
    this.amount = 0.0,
  });

  factory _$DonationHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonationHistoryModelImplFromJson(json);

  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'DonationHistoryModel(description: $description, currency: $currency, time: $time, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonationHistoryModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, currency, time, amount);

  /// Create a copy of DonationHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DonationHistoryModelImplCopyWith<_$DonationHistoryModelImpl>
  get copyWith =>
      __$$DonationHistoryModelImplCopyWithImpl<_$DonationHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DonationHistoryModelImplToJson(this);
  }
}

abstract class _DonationHistoryModel implements DonationHistoryModel {
  const factory _DonationHistoryModel({
    final String description,
    final String currency,
    final String time,
    final double amount,
  }) = _$DonationHistoryModelImpl;

  factory _DonationHistoryModel.fromJson(Map<String, dynamic> json) =
      _$DonationHistoryModelImpl.fromJson;

  @override
  String get description;
  @override
  String get currency;
  @override
  String get time;
  @override
  double get amount;

  /// Create a copy of DonationHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DonationHistoryModelImplCopyWith<_$DonationHistoryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
