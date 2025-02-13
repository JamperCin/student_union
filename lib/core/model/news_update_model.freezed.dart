// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsUpdateModel _$NewsUpdateModelFromJson(Map<String, dynamic> json) {
  return _NewsUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$NewsUpdateModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this NewsUpdateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsUpdateModelCopyWith<NewsUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsUpdateModelCopyWith<$Res> {
  factory $NewsUpdateModelCopyWith(
          NewsUpdateModel value, $Res Function(NewsUpdateModel) then) =
      _$NewsUpdateModelCopyWithImpl<$Res, NewsUpdateModel>;
  @useResult
  $Res call({String title, String description, String createdAt, String image});
}

/// @nodoc
class _$NewsUpdateModelCopyWithImpl<$Res, $Val extends NewsUpdateModel>
    implements $NewsUpdateModelCopyWith<$Res> {
  _$NewsUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsUpdateModelImplCopyWith<$Res>
    implements $NewsUpdateModelCopyWith<$Res> {
  factory _$$NewsUpdateModelImplCopyWith(_$NewsUpdateModelImpl value,
          $Res Function(_$NewsUpdateModelImpl) then) =
      __$$NewsUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String createdAt, String image});
}

/// @nodoc
class __$$NewsUpdateModelImplCopyWithImpl<$Res>
    extends _$NewsUpdateModelCopyWithImpl<$Res, _$NewsUpdateModelImpl>
    implements _$$NewsUpdateModelImplCopyWith<$Res> {
  __$$NewsUpdateModelImplCopyWithImpl(
      _$NewsUpdateModelImpl _value, $Res Function(_$NewsUpdateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? image = null,
  }) {
    return _then(_$NewsUpdateModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsUpdateModelImpl implements _NewsUpdateModel {
  const _$NewsUpdateModelImpl(
      {this.title = "",
      this.description = "",
      this.createdAt = "",
      this.image = ""});

  factory _$NewsUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsUpdateModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String image;

  @override
  String toString() {
    return 'NewsUpdateModel(title: $title, description: $description, createdAt: $createdAt, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsUpdateModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, createdAt, image);

  /// Create a copy of NewsUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsUpdateModelImplCopyWith<_$NewsUpdateModelImpl> get copyWith =>
      __$$NewsUpdateModelImplCopyWithImpl<_$NewsUpdateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _NewsUpdateModel implements NewsUpdateModel {
  const factory _NewsUpdateModel(
      {final String title,
      final String description,
      final String createdAt,
      final String image}) = _$NewsUpdateModelImpl;

  factory _NewsUpdateModel.fromJson(Map<String, dynamic> json) =
      _$NewsUpdateModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  String get image;

  /// Create a copy of NewsUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsUpdateModelImplCopyWith<_$NewsUpdateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
