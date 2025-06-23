// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuccessModel _$SuccessModelFromJson(Map<String, dynamic> json) {
  return _SuccessModel.fromJson(json);
}

/// @nodoc
mixin _$SuccessModel {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this SuccessModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuccessModelCopyWith<SuccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessModelCopyWith<$Res> {
  factory $SuccessModelCopyWith(
          SuccessModel value, $Res Function(SuccessModel) then) =
      _$SuccessModelCopyWithImpl<$Res, SuccessModel>;
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class _$SuccessModelCopyWithImpl<$Res, $Val extends SuccessModel>
    implements $SuccessModelCopyWith<$Res> {
  _$SuccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessModelImplCopyWith<$Res>
    implements $SuccessModelCopyWith<$Res> {
  factory _$$SuccessModelImplCopyWith(
          _$SuccessModelImpl value, $Res Function(_$SuccessModelImpl) then) =
      __$$SuccessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class __$$SuccessModelImplCopyWithImpl<$Res>
    extends _$SuccessModelCopyWithImpl<$Res, _$SuccessModelImpl>
    implements _$$SuccessModelImplCopyWith<$Res> {
  __$$SuccessModelImplCopyWithImpl(
      _$SuccessModelImpl _value, $Res Function(_$SuccessModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$SuccessModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuccessModelImpl implements _SuccessModel {
  const _$SuccessModelImpl({this.title = "", this.message = ""});

  factory _$SuccessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SuccessModel(title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessModelImplCopyWith<_$SuccessModelImpl> get copyWith =>
      __$$SuccessModelImplCopyWithImpl<_$SuccessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessModelImplToJson(
      this,
    );
  }
}

abstract class _SuccessModel implements SuccessModel {
  const factory _SuccessModel({final String title, final String message}) =
      _$SuccessModelImpl;

  factory _SuccessModel.fromJson(Map<String, dynamic> json) =
      _$SuccessModelImpl.fromJson;

  @override
  String get title;
  @override
  String get message;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessModelImplCopyWith<_$SuccessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
