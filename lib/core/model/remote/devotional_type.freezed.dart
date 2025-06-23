// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devotional_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevotionalType _$DevotionalTypeFromJson(Map<String, dynamic> json) {
  return _DevotionalType.fromJson(json);
}

/// @nodoc
mixin _$DevotionalType {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this DevotionalType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DevotionalType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DevotionalTypeCopyWith<DevotionalType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevotionalTypeCopyWith<$Res> {
  factory $DevotionalTypeCopyWith(
          DevotionalType value, $Res Function(DevotionalType) then) =
      _$DevotionalTypeCopyWithImpl<$Res, DevotionalType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$DevotionalTypeCopyWithImpl<$Res, $Val extends DevotionalType>
    implements $DevotionalTypeCopyWith<$Res> {
  _$DevotionalTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DevotionalType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevotionalTypeImplCopyWith<$Res>
    implements $DevotionalTypeCopyWith<$Res> {
  factory _$$DevotionalTypeImplCopyWith(_$DevotionalTypeImpl value,
          $Res Function(_$DevotionalTypeImpl) then) =
      __$$DevotionalTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$DevotionalTypeImplCopyWithImpl<$Res>
    extends _$DevotionalTypeCopyWithImpl<$Res, _$DevotionalTypeImpl>
    implements _$$DevotionalTypeImplCopyWith<$Res> {
  __$$DevotionalTypeImplCopyWithImpl(
      _$DevotionalTypeImpl _value, $Res Function(_$DevotionalTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DevotionalType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$DevotionalTypeImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevotionalTypeImpl implements _DevotionalType {
  const _$DevotionalTypeImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description});

  factory _$DevotionalTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevotionalTypeImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'DevotionalType(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevotionalTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of DevotionalType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevotionalTypeImplCopyWith<_$DevotionalTypeImpl> get copyWith =>
      __$$DevotionalTypeImplCopyWithImpl<_$DevotionalTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevotionalTypeImplToJson(
      this,
    );
  }
}

abstract class _DevotionalType implements DevotionalType {
  const factory _DevotionalType(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description}) =
      _$DevotionalTypeImpl;

  factory _DevotionalType.fromJson(Map<String, dynamic> json) =
      _$DevotionalTypeImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;

  /// Create a copy of DevotionalType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevotionalTypeImplCopyWith<_$DevotionalTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
