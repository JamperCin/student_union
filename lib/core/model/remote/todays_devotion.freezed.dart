// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todays_devotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodaysDevotion _$TodaysDevotionFromJson(Map<String, dynamic> json) {
  return _TodaysDevotion.fromJson(json);
}

/// @nodoc
mixin _$TodaysDevotion {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_date')
  String? get displayDate => throw _privateConstructorUsedError;

  /// Serializes this TodaysDevotion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodaysDevotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodaysDevotionCopyWith<TodaysDevotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodaysDevotionCopyWith<$Res> {
  factory $TodaysDevotionCopyWith(
          TodaysDevotion value, $Res Function(TodaysDevotion) then) =
      _$TodaysDevotionCopyWithImpl<$Res, TodaysDevotion>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? reference,
      @JsonKey(name: 'display_date') String? displayDate});
}

/// @nodoc
class _$TodaysDevotionCopyWithImpl<$Res, $Val extends TodaysDevotion>
    implements $TodaysDevotionCopyWith<$Res> {
  _$TodaysDevotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodaysDevotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? reference = freezed,
    Object? displayDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      displayDate: freezed == displayDate
          ? _value.displayDate
          : displayDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodaysDevotionImplCopyWith<$Res>
    implements $TodaysDevotionCopyWith<$Res> {
  factory _$$TodaysDevotionImplCopyWith(_$TodaysDevotionImpl value,
          $Res Function(_$TodaysDevotionImpl) then) =
      __$$TodaysDevotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? reference,
      @JsonKey(name: 'display_date') String? displayDate});
}

/// @nodoc
class __$$TodaysDevotionImplCopyWithImpl<$Res>
    extends _$TodaysDevotionCopyWithImpl<$Res, _$TodaysDevotionImpl>
    implements _$$TodaysDevotionImplCopyWith<$Res> {
  __$$TodaysDevotionImplCopyWithImpl(
      _$TodaysDevotionImpl _value, $Res Function(_$TodaysDevotionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodaysDevotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? reference = freezed,
    Object? displayDate = freezed,
  }) {
    return _then(_$TodaysDevotionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      displayDate: freezed == displayDate
          ? _value.displayDate
          : displayDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodaysDevotionImpl implements _TodaysDevotion {
  const _$TodaysDevotionImpl(
      {this.id,
      this.title,
      this.content,
      this.reference,
      @JsonKey(name: 'display_date') this.displayDate});

  factory _$TodaysDevotionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodaysDevotionImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? reference;
  @override
  @JsonKey(name: 'display_date')
  final String? displayDate;

  @override
  String toString() {
    return 'TodaysDevotion(id: $id, title: $title, content: $content, reference: $reference, displayDate: $displayDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodaysDevotionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.displayDate, displayDate) ||
                other.displayDate == displayDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, reference, displayDate);

  /// Create a copy of TodaysDevotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodaysDevotionImplCopyWith<_$TodaysDevotionImpl> get copyWith =>
      __$$TodaysDevotionImplCopyWithImpl<_$TodaysDevotionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodaysDevotionImplToJson(
      this,
    );
  }
}

abstract class _TodaysDevotion implements TodaysDevotion {
  const factory _TodaysDevotion(
          {final int? id,
          final String? title,
          final String? content,
          final String? reference,
          @JsonKey(name: 'display_date') final String? displayDate}) =
      _$TodaysDevotionImpl;

  factory _TodaysDevotion.fromJson(Map<String, dynamic> json) =
      _$TodaysDevotionImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get reference;
  @override
  @JsonKey(name: 'display_date')
  String? get displayDate;

  /// Create a copy of TodaysDevotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodaysDevotionImplCopyWith<_$TodaysDevotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
