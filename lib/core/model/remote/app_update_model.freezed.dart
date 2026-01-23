// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppUpdateModel _$AppUpdateModelFromJson(Map<String, dynamic> json) {
  return _AppUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$AppUpdateModel {
  @JsonKey(name: 'version_number')
  String get versionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  String get versionCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppUpdateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUpdateModelCopyWith<AppUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateModelCopyWith<$Res> {
  factory $AppUpdateModelCopyWith(
    AppUpdateModel value,
    $Res Function(AppUpdateModel) then,
  ) = _$AppUpdateModelCopyWithImpl<$Res, AppUpdateModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'version_number') String versionName,
    @JsonKey(name: 'version') String versionCode,
    String? description,
    String title,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$AppUpdateModelCopyWithImpl<$Res, $Val extends AppUpdateModel>
    implements $AppUpdateModelCopyWith<$Res> {
  _$AppUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionName = null,
    Object? versionCode = null,
    Object? description = freezed,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            versionName: null == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                      as String,
            versionCode: null == versionCode
                ? _value.versionCode
                : versionCode // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppUpdateModelImplCopyWith<$Res>
    implements $AppUpdateModelCopyWith<$Res> {
  factory _$$AppUpdateModelImplCopyWith(
    _$AppUpdateModelImpl value,
    $Res Function(_$AppUpdateModelImpl) then,
  ) = __$$AppUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'version_number') String versionName,
    @JsonKey(name: 'version') String versionCode,
    String? description,
    String title,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$AppUpdateModelImplCopyWithImpl<$Res>
    extends _$AppUpdateModelCopyWithImpl<$Res, _$AppUpdateModelImpl>
    implements _$$AppUpdateModelImplCopyWith<$Res> {
  __$$AppUpdateModelImplCopyWithImpl(
    _$AppUpdateModelImpl _value,
    $Res Function(_$AppUpdateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionName = null,
    Object? versionCode = null,
    Object? description = freezed,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$AppUpdateModelImpl(
        versionName: null == versionName
            ? _value.versionName
            : versionName // ignore: cast_nullable_to_non_nullable
                  as String,
        versionCode: null == versionCode
            ? _value.versionCode
            : versionCode // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateModelImpl implements _AppUpdateModel {
  _$AppUpdateModelImpl({
    @JsonKey(name: 'version_number') this.versionName = "",
    @JsonKey(name: 'version') this.versionCode = "",
    this.description,
    this.title = "A new update is available",
    @JsonKey(name: 'created_at') this.createdAt = "",
  });

  factory _$AppUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateModelImplFromJson(json);

  @override
  @JsonKey(name: 'version_number')
  final String versionName;
  @override
  @JsonKey(name: 'version')
  final String versionCode;
  @override
  final String? description;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'AppUpdateModel(versionName: $versionName, versionCode: $versionCode, description: $description, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateModelImpl &&
            (identical(other.versionName, versionName) ||
                other.versionName == versionName) &&
            (identical(other.versionCode, versionCode) ||
                other.versionCode == versionCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    versionName,
    versionCode,
    description,
    title,
    createdAt,
  );

  /// Create a copy of AppUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateModelImplCopyWith<_$AppUpdateModelImpl> get copyWith =>
      __$$AppUpdateModelImplCopyWithImpl<_$AppUpdateModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateModelImplToJson(this);
  }
}

abstract class _AppUpdateModel implements AppUpdateModel {
  factory _AppUpdateModel({
    @JsonKey(name: 'version_number') final String versionName,
    @JsonKey(name: 'version') final String versionCode,
    final String? description,
    final String title,
    @JsonKey(name: 'created_at') final String createdAt,
  }) = _$AppUpdateModelImpl;

  factory _AppUpdateModel.fromJson(Map<String, dynamic> json) =
      _$AppUpdateModelImpl.fromJson;

  @override
  @JsonKey(name: 'version_number')
  String get versionName;
  @override
  @JsonKey(name: 'version')
  String get versionCode;
  @override
  String? get description;
  @override
  String get title;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of AppUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateModelImplCopyWith<_$AppUpdateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
