// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devotional_guide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevotionalGuideModel _$DevotionalGuideModelFromJson(Map<String, dynamic> json) {
  return _DevotionalGuideModel.fromJson(json);
}

/// @nodoc
mixin _$DevotionalGuideModel {
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this DevotionalGuideModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DevotionalGuideModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DevotionalGuideModelCopyWith<DevotionalGuideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevotionalGuideModelCopyWith<$Res> {
  factory $DevotionalGuideModelCopyWith(DevotionalGuideModel value,
          $Res Function(DevotionalGuideModel) then) =
      _$DevotionalGuideModelCopyWithImpl<$Res, DevotionalGuideModel>;
  @useResult
  $Res call(
      {String image,
      String description,
      String title,
      String currency,
      double amount});
}

/// @nodoc
class _$DevotionalGuideModelCopyWithImpl<$Res,
        $Val extends DevotionalGuideModel>
    implements $DevotionalGuideModelCopyWith<$Res> {
  _$DevotionalGuideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DevotionalGuideModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? title = null,
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevotionalGuideModelImplCopyWith<$Res>
    implements $DevotionalGuideModelCopyWith<$Res> {
  factory _$$DevotionalGuideModelImplCopyWith(_$DevotionalGuideModelImpl value,
          $Res Function(_$DevotionalGuideModelImpl) then) =
      __$$DevotionalGuideModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String image,
      String description,
      String title,
      String currency,
      double amount});
}

/// @nodoc
class __$$DevotionalGuideModelImplCopyWithImpl<$Res>
    extends _$DevotionalGuideModelCopyWithImpl<$Res, _$DevotionalGuideModelImpl>
    implements _$$DevotionalGuideModelImplCopyWith<$Res> {
  __$$DevotionalGuideModelImplCopyWithImpl(_$DevotionalGuideModelImpl _value,
      $Res Function(_$DevotionalGuideModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DevotionalGuideModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? title = null,
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_$DevotionalGuideModelImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevotionalGuideModelImpl implements _DevotionalGuideModel {
  const _$DevotionalGuideModelImpl(
      {this.image = "",
      this.description = "",
      this.title = "",
      this.currency = "GHS",
      this.amount = 0.0});

  factory _$DevotionalGuideModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevotionalGuideModelImplFromJson(json);

  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'DevotionalGuideModel(image: $image, description: $description, title: $title, currency: $currency, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevotionalGuideModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, description, title, currency, amount);

  /// Create a copy of DevotionalGuideModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevotionalGuideModelImplCopyWith<_$DevotionalGuideModelImpl>
      get copyWith =>
          __$$DevotionalGuideModelImplCopyWithImpl<_$DevotionalGuideModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevotionalGuideModelImplToJson(
      this,
    );
  }
}

abstract class _DevotionalGuideModel implements DevotionalGuideModel {
  const factory _DevotionalGuideModel(
      {final String image,
      final String description,
      final String title,
      final String currency,
      final double amount}) = _$DevotionalGuideModelImpl;

  factory _DevotionalGuideModel.fromJson(Map<String, dynamic> json) =
      _$DevotionalGuideModelImpl.fromJson;

  @override
  String get image;
  @override
  String get description;
  @override
  String get title;
  @override
  String get currency;
  @override
  double get amount;

  /// Create a copy of DevotionalGuideModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevotionalGuideModelImplCopyWith<_$DevotionalGuideModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
