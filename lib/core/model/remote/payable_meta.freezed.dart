// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payable_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayableMeta _$PayableMetaFromJson(Map<String, dynamic> json) {
  return _PayableMeta.fromJson(json);
}

/// @nodoc
mixin _$PayableMeta {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int? get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'archived')
  bool? get archived => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_by')
  dynamic get updateBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_type_id')
  int? get campaignTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_amount')
  String? get goalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'raised_amount')
  String? get raisedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'donation_amount')
  String? get donationAmount => throw _privateConstructorUsedError;

  /// Serializes this PayableMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayableMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayableMetaCopyWith<PayableMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayableMetaCopyWith<$Res> {
  factory $PayableMetaCopyWith(
          PayableMeta value, $Res Function(PayableMeta) then) =
      _$PayableMetaCopyWithImpl<$Res, PayableMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'donation_amount') String? donationAmount});
}

/// @nodoc
class _$PayableMetaCopyWithImpl<$Res, $Val extends PayableMeta>
    implements $PayableMetaCopyWith<$Res> {
  _$PayableMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayableMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? archived = freezed,
    Object? imageUrl = freezed,
    Object? updateBy = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? campaignTypeId = freezed,
    Object? goalAmount = freezed,
    Object? raisedAmount = freezed,
    Object? donationAmount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updateBy: freezed == updateBy
          ? _value.updateBy
          : updateBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignTypeId: freezed == campaignTypeId
          ? _value.campaignTypeId
          : campaignTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      raisedAmount: freezed == raisedAmount
          ? _value.raisedAmount
          : raisedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      donationAmount: freezed == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayableMetaImplCopyWith<$Res>
    implements $PayableMetaCopyWith<$Res> {
  factory _$$PayableMetaImplCopyWith(
          _$PayableMetaImpl value, $Res Function(_$PayableMetaImpl) then) =
      __$$PayableMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'donation_amount') String? donationAmount});
}

/// @nodoc
class __$$PayableMetaImplCopyWithImpl<$Res>
    extends _$PayableMetaCopyWithImpl<$Res, _$PayableMetaImpl>
    implements _$$PayableMetaImplCopyWith<$Res> {
  __$$PayableMetaImplCopyWithImpl(
      _$PayableMetaImpl _value, $Res Function(_$PayableMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayableMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? archived = freezed,
    Object? imageUrl = freezed,
    Object? updateBy = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? campaignTypeId = freezed,
    Object? goalAmount = freezed,
    Object? raisedAmount = freezed,
    Object? donationAmount = freezed,
  }) {
    return _then(_$PayableMetaImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updateBy: freezed == updateBy
          ? _value.updateBy
          : updateBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignTypeId: freezed == campaignTypeId
          ? _value.campaignTypeId
          : campaignTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      raisedAmount: freezed == raisedAmount
          ? _value.raisedAmount
          : raisedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      donationAmount: freezed == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayableMetaImpl implements _PayableMeta {
  const _$PayableMetaImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'account_id') this.accountId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'archived') this.archived,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'update_by') this.updateBy,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'campaign_type_id') this.campaignTypeId,
      @JsonKey(name: 'goal_amount') this.goalAmount,
      @JsonKey(name: 'raised_amount') this.raisedAmount,
      @JsonKey(name: 'donation_amount') this.donationAmount});

  factory _$PayableMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayableMetaImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'account_id')
  final int? accountId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'archived')
  final bool? archived;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'update_by')
  final dynamic updateBy;
  @override
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'campaign_type_id')
  final int? campaignTypeId;
  @override
  @JsonKey(name: 'goal_amount')
  final String? goalAmount;
  @override
  @JsonKey(name: 'raised_amount')
  final String? raisedAmount;
  @override
  @JsonKey(name: 'donation_amount')
  final String? donationAmount;

  @override
  String toString() {
    return 'PayableMeta(id: $id, accountId: $accountId, title: $title, description: $description, archived: $archived, imageUrl: $imageUrl, updateBy: $updateBy, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, campaignTypeId: $campaignTypeId, goalAmount: $goalAmount, raisedAmount: $raisedAmount, donationAmount: $donationAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayableMetaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other.updateBy, updateBy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.campaignTypeId, campaignTypeId) ||
                other.campaignTypeId == campaignTypeId) &&
            (identical(other.goalAmount, goalAmount) ||
                other.goalAmount == goalAmount) &&
            (identical(other.raisedAmount, raisedAmount) ||
                other.raisedAmount == raisedAmount) &&
            (identical(other.donationAmount, donationAmount) ||
                other.donationAmount == donationAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      title,
      description,
      archived,
      imageUrl,
      const DeepCollectionEquality().hash(updateBy),
      createdBy,
      createdAt,
      updatedAt,
      campaignTypeId,
      goalAmount,
      raisedAmount,
      donationAmount);

  /// Create a copy of PayableMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayableMetaImplCopyWith<_$PayableMetaImpl> get copyWith =>
      __$$PayableMetaImplCopyWithImpl<_$PayableMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayableMetaImplToJson(
      this,
    );
  }
}

abstract class _PayableMeta implements PayableMeta {
  const factory _PayableMeta(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'account_id') final int? accountId,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'archived') final bool? archived,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'update_by') final dynamic updateBy,
          @JsonKey(name: 'created_by') final int? createdBy,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'campaign_type_id') final int? campaignTypeId,
          @JsonKey(name: 'goal_amount') final String? goalAmount,
          @JsonKey(name: 'raised_amount') final String? raisedAmount,
          @JsonKey(name: 'donation_amount') final String? donationAmount}) =
      _$PayableMetaImpl;

  factory _PayableMeta.fromJson(Map<String, dynamic> json) =
      _$PayableMetaImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'account_id')
  int? get accountId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'archived')
  bool? get archived;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'update_by')
  dynamic get updateBy;
  @override
  @JsonKey(name: 'created_by')
  int? get createdBy;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'campaign_type_id')
  int? get campaignTypeId;
  @override
  @JsonKey(name: 'goal_amount')
  String? get goalAmount;
  @override
  @JsonKey(name: 'raised_amount')
  String? get raisedAmount;
  @override
  @JsonKey(name: 'donation_amount')
  String? get donationAmount;

  /// Create a copy of PayableMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayableMetaImplCopyWith<_$PayableMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
