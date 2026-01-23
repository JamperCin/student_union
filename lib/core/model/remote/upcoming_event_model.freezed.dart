// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpcomingEventModel _$UpcomingEventModelFromJson(Map<String, dynamic> json) {
  return _UpcomingEventModel.fromJson(json);
}

/// @nodoc
mixin _$UpcomingEventModel {
  @JsonKey(name: 'image_url')
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_datetime')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_datetime')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UpcomingEventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpcomingEventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpcomingEventModelCopyWith<UpcomingEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingEventModelCopyWith<$Res> {
  factory $UpcomingEventModelCopyWith(
    UpcomingEventModel value,
    $Res Function(UpcomingEventModel) then,
  ) = _$UpcomingEventModelCopyWithImpl<$Res, UpcomingEventModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'image_url') String image,
    int id,
    String description,
    String name,
    String location,
    @JsonKey(name: 'event_status') String status,
    @JsonKey(name: 'current_state') String state,
    @JsonKey(name: 'start_datetime') String startDate,
    @JsonKey(name: 'end_datetime') String endDate,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$UpcomingEventModelCopyWithImpl<$Res, $Val extends UpcomingEventModel>
    implements $UpcomingEventModelCopyWith<$Res> {
  _$UpcomingEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpcomingEventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
    Object? description = null,
    Object? name = null,
    Object? location = null,
    Object? status = null,
    Object? state = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UpcomingEventModelImplCopyWith<$Res>
    implements $UpcomingEventModelCopyWith<$Res> {
  factory _$$UpcomingEventModelImplCopyWith(
    _$UpcomingEventModelImpl value,
    $Res Function(_$UpcomingEventModelImpl) then,
  ) = __$$UpcomingEventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'image_url') String image,
    int id,
    String description,
    String name,
    String location,
    @JsonKey(name: 'event_status') String status,
    @JsonKey(name: 'current_state') String state,
    @JsonKey(name: 'start_datetime') String startDate,
    @JsonKey(name: 'end_datetime') String endDate,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$UpcomingEventModelImplCopyWithImpl<$Res>
    extends _$UpcomingEventModelCopyWithImpl<$Res, _$UpcomingEventModelImpl>
    implements _$$UpcomingEventModelImplCopyWith<$Res> {
  __$$UpcomingEventModelImplCopyWithImpl(
    _$UpcomingEventModelImpl _value,
    $Res Function(_$UpcomingEventModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpcomingEventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
    Object? description = null,
    Object? name = null,
    Object? location = null,
    Object? status = null,
    Object? state = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$UpcomingEventModelImpl(
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
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
class _$UpcomingEventModelImpl implements _UpcomingEventModel {
  const _$UpcomingEventModelImpl({
    @JsonKey(name: 'image_url') this.image = "",
    this.id = 0,
    this.description = "",
    this.name = "",
    this.location = "",
    @JsonKey(name: 'event_status') this.status = "",
    @JsonKey(name: 'current_state') this.state = "",
    @JsonKey(name: 'start_datetime') this.startDate = "",
    @JsonKey(name: 'end_datetime') this.endDate = "",
    @JsonKey(name: 'created_at') this.createdAt = "",
  });

  factory _$UpcomingEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingEventModelImplFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String image;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey(name: 'event_status')
  final String status;
  @override
  @JsonKey(name: 'current_state')
  final String state;
  @override
  @JsonKey(name: 'start_datetime')
  final String startDate;
  @override
  @JsonKey(name: 'end_datetime')
  final String endDate;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'UpcomingEventModel(image: $image, id: $id, description: $description, name: $name, location: $location, status: $status, state: $state, startDate: $startDate, endDate: $endDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingEventModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    image,
    id,
    description,
    name,
    location,
    status,
    state,
    startDate,
    endDate,
    createdAt,
  );

  /// Create a copy of UpcomingEventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingEventModelImplCopyWith<_$UpcomingEventModelImpl> get copyWith =>
      __$$UpcomingEventModelImplCopyWithImpl<_$UpcomingEventModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingEventModelImplToJson(this);
  }
}

abstract class _UpcomingEventModel implements UpcomingEventModel {
  const factory _UpcomingEventModel({
    @JsonKey(name: 'image_url') final String image,
    final int id,
    final String description,
    final String name,
    final String location,
    @JsonKey(name: 'event_status') final String status,
    @JsonKey(name: 'current_state') final String state,
    @JsonKey(name: 'start_datetime') final String startDate,
    @JsonKey(name: 'end_datetime') final String endDate,
    @JsonKey(name: 'created_at') final String createdAt,
  }) = _$UpcomingEventModelImpl;

  factory _UpcomingEventModel.fromJson(Map<String, dynamic> json) =
      _$UpcomingEventModelImpl.fromJson;

  @override
  @JsonKey(name: 'image_url')
  String get image;
  @override
  int get id;
  @override
  String get description;
  @override
  String get name;
  @override
  String get location;
  @override
  @JsonKey(name: 'event_status')
  String get status;
  @override
  @JsonKey(name: 'current_state')
  String get state;
  @override
  @JsonKey(name: 'start_datetime')
  String get startDate;
  @override
  @JsonKey(name: 'end_datetime')
  String get endDate;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of UpcomingEventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpcomingEventModelImplCopyWith<_$UpcomingEventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
