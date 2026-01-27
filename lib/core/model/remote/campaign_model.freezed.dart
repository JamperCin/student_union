// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DonationModel _$DonationModelFromJson(Map<String, dynamic> json) {
  return _CampaignModel.fromJson(json);
}

/// @nodoc
mixin _$DonationModel {
  @JsonKey(name: 'image_url')
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_amount')
  String get goalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'raised_amount')
  String get raisedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_type')
  String get campaignType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this DonationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DonationModelCopyWith<DonationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationModelCopyWith<$Res> {
  factory $DonationModelCopyWith(
    DonationModel value,
    $Res Function(DonationModel) then,
  ) = _$DonationModelCopyWithImpl<$Res, DonationModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'image_url') String image,
    String description,
    String currency,
    int id,
    @JsonKey(name: 'goal_amount') String goalAmount,
    @JsonKey(name: 'raised_amount') String raisedAmount,
    @JsonKey(name: 'campaign_type') String campaignType,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'account_id') int accountId,
    String title,
  });
}

/// @nodoc
class _$DonationModelCopyWithImpl<$Res, $Val extends DonationModel>
    implements $DonationModelCopyWith<$Res> {
  _$DonationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? currency = null,
    Object? id = null,
    Object? goalAmount = null,
    Object? raisedAmount = null,
    Object? campaignType = null,
    Object? createdAt = null,
    Object? accountId = null,
    Object? title = null,
  }) {
    return _then(
      _value.copyWith(
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            goalAmount: null == goalAmount
                ? _value.goalAmount
                : goalAmount // ignore: cast_nullable_to_non_nullable
                      as String,
            raisedAmount: null == raisedAmount
                ? _value.raisedAmount
                : raisedAmount // ignore: cast_nullable_to_non_nullable
                      as String,
            campaignType: null == campaignType
                ? _value.campaignType
                : campaignType // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CampaignModelImplCopyWith<$Res>
    implements $DonationModelCopyWith<$Res> {
  factory _$$CampaignModelImplCopyWith(
    _$CampaignModelImpl value,
    $Res Function(_$CampaignModelImpl) then,
  ) = __$$CampaignModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'image_url') String image,
    String description,
    String currency,
    int id,
    @JsonKey(name: 'goal_amount') String goalAmount,
    @JsonKey(name: 'raised_amount') String raisedAmount,
    @JsonKey(name: 'campaign_type') String campaignType,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'account_id') int accountId,
    String title,
  });
}

/// @nodoc
class __$$CampaignModelImplCopyWithImpl<$Res>
    extends _$DonationModelCopyWithImpl<$Res, _$CampaignModelImpl>
    implements _$$CampaignModelImplCopyWith<$Res> {
  __$$CampaignModelImplCopyWithImpl(
    _$CampaignModelImpl _value,
    $Res Function(_$CampaignModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? currency = null,
    Object? id = null,
    Object? goalAmount = null,
    Object? raisedAmount = null,
    Object? campaignType = null,
    Object? createdAt = null,
    Object? accountId = null,
    Object? title = null,
  }) {
    return _then(
      _$CampaignModelImpl(
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        goalAmount: null == goalAmount
            ? _value.goalAmount
            : goalAmount // ignore: cast_nullable_to_non_nullable
                  as String,
        raisedAmount: null == raisedAmount
            ? _value.raisedAmount
            : raisedAmount // ignore: cast_nullable_to_non_nullable
                  as String,
        campaignType: null == campaignType
            ? _value.campaignType
            : campaignType // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CampaignModelImpl implements _CampaignModel {
  const _$CampaignModelImpl({
    @JsonKey(name: 'image_url') this.image = "",
    this.description = "",
    this.currency = "GHS",
    this.id = 0,
    @JsonKey(name: 'goal_amount') this.goalAmount = "",
    @JsonKey(name: 'raised_amount') this.raisedAmount = "",
    @JsonKey(name: 'campaign_type') this.campaignType = "",
    @JsonKey(name: 'created_at') this.createdAt = "",
    @JsonKey(name: 'account_id') this.accountId = 0,
    this.title = "",
  });

  factory _$CampaignModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampaignModelImplFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String image;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'goal_amount')
  final String goalAmount;
  @override
  @JsonKey(name: 'raised_amount')
  final String raisedAmount;
  @override
  @JsonKey(name: 'campaign_type')
  final String campaignType;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'DonationModel(image: $image, description: $description, currency: $currency, id: $id, goalAmount: $goalAmount, raisedAmount: $raisedAmount, campaignType: $campaignType, createdAt: $createdAt, accountId: $accountId, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampaignModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalAmount, goalAmount) ||
                other.goalAmount == goalAmount) &&
            (identical(other.raisedAmount, raisedAmount) ||
                other.raisedAmount == raisedAmount) &&
            (identical(other.campaignType, campaignType) ||
                other.campaignType == campaignType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    image,
    description,
    currency,
    id,
    goalAmount,
    raisedAmount,
    campaignType,
    createdAt,
    accountId,
    title,
  );

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampaignModelImplCopyWith<_$CampaignModelImpl> get copyWith =>
      __$$CampaignModelImplCopyWithImpl<_$CampaignModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampaignModelImplToJson(this);
  }
}

abstract class _CampaignModel implements DonationModel {
  const factory _CampaignModel({
    @JsonKey(name: 'image_url') final String image,
    final String description,
    final String currency,
    final int id,
    @JsonKey(name: 'goal_amount') final String goalAmount,
    @JsonKey(name: 'raised_amount') final String raisedAmount,
    @JsonKey(name: 'campaign_type') final String campaignType,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'account_id') final int accountId,
    final String title,
  }) = _$CampaignModelImpl;

  factory _CampaignModel.fromJson(Map<String, dynamic> json) =
      _$CampaignModelImpl.fromJson;

  @override
  @JsonKey(name: 'image_url')
  String get image;
  @override
  String get description;
  @override
  String get currency;
  @override
  int get id;
  @override
  @JsonKey(name: 'goal_amount')
  String get goalAmount;
  @override
  @JsonKey(name: 'raised_amount')
  String get raisedAmount;
  @override
  @JsonKey(name: 'campaign_type')
  String get campaignType;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  String get title;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampaignModelImplCopyWith<_$CampaignModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
