// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  int get id => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorization_url')
  String get authUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'payable_meta')
  PayableMeta? get payableMeta => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  PaymentInfoMeta? get paymentInfoMeta => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_id')
  int get campaignId => throw _privateConstructorUsedError;

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {int id,
      String amount,
      String status,
      String reference,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'created_at') String createdAt,
      String currency,
      @JsonKey(name: 'authorization_url') String authUrl,
      @JsonKey(name: 'payable_meta') PayableMeta? payableMeta,
      @JsonKey(name: 'metadata') PaymentInfoMeta? paymentInfoMeta,
      @JsonKey(name: 'campaign_id') int campaignId});

  $PayableMetaCopyWith<$Res>? get payableMeta;
  $PaymentInfoMetaCopyWith<$Res>? get paymentInfoMeta;
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? status = null,
    Object? reference = null,
    Object? paymentType = null,
    Object? createdAt = null,
    Object? currency = null,
    Object? authUrl = null,
    Object? payableMeta = freezed,
    Object? paymentInfoMeta = freezed,
    Object? campaignId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      authUrl: null == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String,
      payableMeta: freezed == payableMeta
          ? _value.payableMeta
          : payableMeta // ignore: cast_nullable_to_non_nullable
              as PayableMeta?,
      paymentInfoMeta: freezed == paymentInfoMeta
          ? _value.paymentInfoMeta
          : paymentInfoMeta // ignore: cast_nullable_to_non_nullable
              as PaymentInfoMeta?,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayableMetaCopyWith<$Res>? get payableMeta {
    if (_value.payableMeta == null) {
      return null;
    }

    return $PayableMetaCopyWith<$Res>(_value.payableMeta!, (value) {
      return _then(_value.copyWith(payableMeta: value) as $Val);
    });
  }

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoMetaCopyWith<$Res>? get paymentInfoMeta {
    if (_value.paymentInfoMeta == null) {
      return null;
    }

    return $PaymentInfoMetaCopyWith<$Res>(_value.paymentInfoMeta!, (value) {
      return _then(_value.copyWith(paymentInfoMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String amount,
      String status,
      String reference,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'created_at') String createdAt,
      String currency,
      @JsonKey(name: 'authorization_url') String authUrl,
      @JsonKey(name: 'payable_meta') PayableMeta? payableMeta,
      @JsonKey(name: 'metadata') PaymentInfoMeta? paymentInfoMeta,
      @JsonKey(name: 'campaign_id') int campaignId});

  @override
  $PayableMetaCopyWith<$Res>? get payableMeta;
  @override
  $PaymentInfoMetaCopyWith<$Res>? get paymentInfoMeta;
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? status = null,
    Object? reference = null,
    Object? paymentType = null,
    Object? createdAt = null,
    Object? currency = null,
    Object? authUrl = null,
    Object? payableMeta = freezed,
    Object? paymentInfoMeta = freezed,
    Object? campaignId = null,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      authUrl: null == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String,
      payableMeta: freezed == payableMeta
          ? _value.payableMeta
          : payableMeta // ignore: cast_nullable_to_non_nullable
              as PayableMeta?,
      paymentInfoMeta: freezed == paymentInfoMeta
          ? _value.paymentInfoMeta
          : paymentInfoMeta // ignore: cast_nullable_to_non_nullable
              as PaymentInfoMeta?,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  const _$PaymentModelImpl(
      {this.id = 0,
      this.amount = "0.0",
      this.status = "",
      this.reference = "",
      @JsonKey(name: 'payment_type') this.paymentType = "",
      @JsonKey(name: 'created_at') this.createdAt = "",
      this.currency = "GHS",
      @JsonKey(name: 'authorization_url') this.authUrl = "",
      @JsonKey(name: 'payable_meta') this.payableMeta,
      @JsonKey(name: 'metadata') this.paymentInfoMeta,
      @JsonKey(name: 'campaign_id') this.campaignId = 0});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String reference;
  @override
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'authorization_url')
  final String authUrl;
  @override
  @JsonKey(name: 'payable_meta')
  final PayableMeta? payableMeta;
  @override
  @JsonKey(name: 'metadata')
  final PaymentInfoMeta? paymentInfoMeta;
  @override
  @JsonKey(name: 'campaign_id')
  final int campaignId;

  @override
  String toString() {
    return 'PaymentModel(id: $id, amount: $amount, status: $status, reference: $reference, paymentType: $paymentType, createdAt: $createdAt, currency: $currency, authUrl: $authUrl, payableMeta: $payableMeta, paymentInfoMeta: $paymentInfoMeta, campaignId: $campaignId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.authUrl, authUrl) || other.authUrl == authUrl) &&
            (identical(other.payableMeta, payableMeta) ||
                other.payableMeta == payableMeta) &&
            (identical(other.paymentInfoMeta, paymentInfoMeta) ||
                other.paymentInfoMeta == paymentInfoMeta) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      status,
      reference,
      paymentType,
      createdAt,
      currency,
      authUrl,
      payableMeta,
      paymentInfoMeta,
      campaignId);

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
      {final int id,
      final String amount,
      final String status,
      final String reference,
      @JsonKey(name: 'payment_type') final String paymentType,
      @JsonKey(name: 'created_at') final String createdAt,
      final String currency,
      @JsonKey(name: 'authorization_url') final String authUrl,
      @JsonKey(name: 'payable_meta') final PayableMeta? payableMeta,
      @JsonKey(name: 'metadata') final PaymentInfoMeta? paymentInfoMeta,
      @JsonKey(name: 'campaign_id') final int campaignId}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get amount;
  @override
  String get status;
  @override
  String get reference;
  @override
  @JsonKey(name: 'payment_type')
  String get paymentType;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String get currency;
  @override
  @JsonKey(name: 'authorization_url')
  String get authUrl;
  @override
  @JsonKey(name: 'payable_meta')
  PayableMeta? get payableMeta;
  @override
  @JsonKey(name: 'metadata')
  PaymentInfoMeta? get paymentInfoMeta;
  @override
  @JsonKey(name: 'campaign_id')
  int get campaignId;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
