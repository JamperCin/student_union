// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_ministry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoreMinistryModel _$CoreMinistryModelFromJson(Map<String, dynamic> json) {
  return _CoreMinistryModel.fromJson(json);
}

/// @nodoc
mixin _$CoreMinistryModel {
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this CoreMinistryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoreMinistryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoreMinistryModelCopyWith<CoreMinistryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreMinistryModelCopyWith<$Res> {
  factory $CoreMinistryModelCopyWith(
          CoreMinistryModel value, $Res Function(CoreMinistryModel) then) =
      _$CoreMinistryModelCopyWithImpl<$Res, CoreMinistryModel>;
  @useResult
  $Res call({String image, String description, String title});
}

/// @nodoc
class _$CoreMinistryModelCopyWithImpl<$Res, $Val extends CoreMinistryModel>
    implements $CoreMinistryModelCopyWith<$Res> {
  _$CoreMinistryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoreMinistryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoreMinistryModelImplCopyWith<$Res>
    implements $CoreMinistryModelCopyWith<$Res> {
  factory _$$CoreMinistryModelImplCopyWith(_$CoreMinistryModelImpl value,
          $Res Function(_$CoreMinistryModelImpl) then) =
      __$$CoreMinistryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, String description, String title});
}

/// @nodoc
class __$$CoreMinistryModelImplCopyWithImpl<$Res>
    extends _$CoreMinistryModelCopyWithImpl<$Res, _$CoreMinistryModelImpl>
    implements _$$CoreMinistryModelImplCopyWith<$Res> {
  __$$CoreMinistryModelImplCopyWithImpl(_$CoreMinistryModelImpl _value,
      $Res Function(_$CoreMinistryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoreMinistryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? description = null,
    Object? title = null,
  }) {
    return _then(_$CoreMinistryModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoreMinistryModelImpl implements _CoreMinistryModel {
  const _$CoreMinistryModelImpl(
      {this.image = "", this.description = "", this.title = ""});

  factory _$CoreMinistryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoreMinistryModelImplFromJson(json);

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
  String toString() {
    return 'CoreMinistryModel(image: $image, description: $description, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreMinistryModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, description, title);

  /// Create a copy of CoreMinistryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreMinistryModelImplCopyWith<_$CoreMinistryModelImpl> get copyWith =>
      __$$CoreMinistryModelImplCopyWithImpl<_$CoreMinistryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoreMinistryModelImplToJson(
      this,
    );
  }
}

abstract class _CoreMinistryModel implements CoreMinistryModel {
  const factory _CoreMinistryModel(
      {final String image,
      final String description,
      final String title}) = _$CoreMinistryModelImpl;

  factory _CoreMinistryModel.fromJson(Map<String, dynamic> json) =
      _$CoreMinistryModelImpl.fromJson;

  @override
  String get image;
  @override
  String get description;
  @override
  String get title;

  /// Create a copy of CoreMinistryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoreMinistryModelImplCopyWith<_$CoreMinistryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
