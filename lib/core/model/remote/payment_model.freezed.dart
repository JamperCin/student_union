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
  @JsonKey(name: 'transactionId')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionType')
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorization_url')
  String? get authUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_id')
  int? get campaignId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get narration => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_id')
  int? get bookId => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'transactionId') String? transactionId,
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
      @JsonKey(name: 'book_id') int? bookId});
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
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? ref = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? transactionType = freezed,
    Object? authUrl = freezed,
    Object? campaignId = freezed,
    Object? createdAt = freezed,
    Object? narration = freezed,
    Object? bookId = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      narration: freezed == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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
      {@JsonKey(name: 'transactionId') String? transactionId,
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
      @JsonKey(name: 'book_id') int? bookId});
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
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? ref = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? transactionType = freezed,
    Object? authUrl = freezed,
    Object? campaignId = freezed,
    Object? createdAt = freezed,
    Object? narration = freezed,
    Object? bookId = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      authUrl: freezed == authUrl
          ? _value.authUrl
          : authUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      narration: freezed == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  const _$PaymentModelImpl(
      {@JsonKey(name: 'transactionId') this.transactionId,
      @JsonKey(name: 'amount') this.amount,
      this.currency,
      this.ref,
      this.name,
      this.status,
      @JsonKey(name: 'transactionType') this.transactionType,
      @JsonKey(name: 'authorization_url') this.authUrl,
      @JsonKey(name: 'campaign_id') this.campaignId,
      @JsonKey(name: 'created_at') this.createdAt,
      this.narration,
      @JsonKey(name: 'book_id') this.bookId});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  @JsonKey(name: 'transactionId')
  final String? transactionId;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  final String? currency;
  @override
  final String? ref;
  @override
  final String? name;
  @override
  final String? status;
  @override
  @JsonKey(name: 'transactionType')
  final String? transactionType;
  @override
  @JsonKey(name: 'authorization_url')
  final String? authUrl;
  @override
  @JsonKey(name: 'campaign_id')
  final int? campaignId;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final String? narration;
  @override
  @JsonKey(name: 'book_id')
  final int? bookId;

  @override
  String toString() {
    return 'PaymentModel(transactionId: $transactionId, amount: $amount, currency: $currency, ref: $ref, name: $name, status: $status, transactionType: $transactionType, authUrl: $authUrl, campaignId: $campaignId, createdAt: $createdAt, narration: $narration, bookId: $bookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.authUrl, authUrl) || other.authUrl == authUrl) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.narration, narration) ||
                other.narration == narration) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      amount,
      currency,
      ref,
      name,
      status,
      transactionType,
      authUrl,
      campaignId,
      createdAt,
      narration,
      bookId);

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
      {@JsonKey(name: 'transactionId') final String? transactionId,
      @JsonKey(name: 'amount') final double? amount,
      final String? currency,
      final String? ref,
      final String? name,
      final String? status,
      @JsonKey(name: 'transactionType') final String? transactionType,
      @JsonKey(name: 'authorization_url') final String? authUrl,
      @JsonKey(name: 'campaign_id') final int? campaignId,
      @JsonKey(name: 'created_at') final String? createdAt,
      final String? narration,
      @JsonKey(name: 'book_id') final int? bookId}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  @JsonKey(name: 'transactionId')
  String? get transactionId;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  String? get currency;
  @override
  String? get ref;
  @override
  String? get name;
  @override
  String? get status;
  @override
  @JsonKey(name: 'transactionType')
  String? get transactionType;
  @override
  @JsonKey(name: 'authorization_url')
  String? get authUrl;
  @override
  @JsonKey(name: 'campaign_id')
  int? get campaignId;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  String? get narration;
  @override
  @JsonKey(name: 'book_id')
  int? get bookId;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
