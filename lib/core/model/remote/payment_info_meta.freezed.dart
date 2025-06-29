// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_info_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentInfoMeta _$PaymentInfoMetaFromJson(Map<String, dynamic> json) {
  return _PaymentInfoMeta.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfoMeta {
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_id')
  int? get campaignId => throw _privateConstructorUsedError;
  @JsonKey(name: 'init_response')
  InitResponse? get initResponse => throw _privateConstructorUsedError;

  /// Serializes this PaymentInfoMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentInfoMetaCopyWith<PaymentInfoMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoMetaCopyWith<$Res> {
  factory $PaymentInfoMetaCopyWith(
          PaymentInfoMeta value, $Res Function(PaymentInfoMeta) then) =
      _$PaymentInfoMetaCopyWithImpl<$Res, PaymentInfoMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'note') String? note,
      @JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'init_response') InitResponse? initResponse});

  $InitResponseCopyWith<$Res>? get initResponse;
}

/// @nodoc
class _$PaymentInfoMetaCopyWithImpl<$Res, $Val extends PaymentInfoMeta>
    implements $PaymentInfoMetaCopyWith<$Res> {
  _$PaymentInfoMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? campaignId = freezed,
    Object? initResponse = freezed,
  }) {
    return _then(_value.copyWith(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      initResponse: freezed == initResponse
          ? _value.initResponse
          : initResponse // ignore: cast_nullable_to_non_nullable
              as InitResponse?,
    ) as $Val);
  }

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitResponseCopyWith<$Res>? get initResponse {
    if (_value.initResponse == null) {
      return null;
    }

    return $InitResponseCopyWith<$Res>(_value.initResponse!, (value) {
      return _then(_value.copyWith(initResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentInfoMetaImplCopyWith<$Res>
    implements $PaymentInfoMetaCopyWith<$Res> {
  factory _$$PaymentInfoMetaImplCopyWith(_$PaymentInfoMetaImpl value,
          $Res Function(_$PaymentInfoMetaImpl) then) =
      __$$PaymentInfoMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'note') String? note,
      @JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'init_response') InitResponse? initResponse});

  @override
  $InitResponseCopyWith<$Res>? get initResponse;
}

/// @nodoc
class __$$PaymentInfoMetaImplCopyWithImpl<$Res>
    extends _$PaymentInfoMetaCopyWithImpl<$Res, _$PaymentInfoMetaImpl>
    implements _$$PaymentInfoMetaImplCopyWith<$Res> {
  __$$PaymentInfoMetaImplCopyWithImpl(
      _$PaymentInfoMetaImpl _value, $Res Function(_$PaymentInfoMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? campaignId = freezed,
    Object? initResponse = freezed,
  }) {
    return _then(_$PaymentInfoMetaImpl(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      initResponse: freezed == initResponse
          ? _value.initResponse
          : initResponse // ignore: cast_nullable_to_non_nullable
              as InitResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoMetaImpl implements _PaymentInfoMeta {
  const _$PaymentInfoMetaImpl(
      {@JsonKey(name: 'note') this.note,
      @JsonKey(name: 'campaign_id') this.campaignId,
      @JsonKey(name: 'init_response') this.initResponse});

  factory _$PaymentInfoMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoMetaImplFromJson(json);

  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'campaign_id')
  final int? campaignId;
  @override
  @JsonKey(name: 'init_response')
  final InitResponse? initResponse;

  @override
  String toString() {
    return 'PaymentInfoMeta(note: $note, campaignId: $campaignId, initResponse: $initResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoMetaImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.initResponse, initResponse) ||
                other.initResponse == initResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, note, campaignId, initResponse);

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoMetaImplCopyWith<_$PaymentInfoMetaImpl> get copyWith =>
      __$$PaymentInfoMetaImplCopyWithImpl<_$PaymentInfoMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoMetaImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfoMeta implements PaymentInfoMeta {
  const factory _PaymentInfoMeta(
          {@JsonKey(name: 'note') final String? note,
          @JsonKey(name: 'campaign_id') final int? campaignId,
          @JsonKey(name: 'init_response') final InitResponse? initResponse}) =
      _$PaymentInfoMetaImpl;

  factory _PaymentInfoMeta.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoMetaImpl.fromJson;

  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'campaign_id')
  int? get campaignId;
  @override
  @JsonKey(name: 'init_response')
  InitResponse? get initResponse;

  /// Create a copy of PaymentInfoMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentInfoMetaImplCopyWith<_$PaymentInfoMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InitResponse _$InitResponseFromJson(Map<String, dynamic> json) {
  return _InitResponse.fromJson(json);
}

/// @nodoc
mixin _$InitResponse {
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this InitResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitResponseCopyWith<InitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitResponseCopyWith<$Res> {
  factory $InitResponseCopyWith(
          InitResponse value, $Res Function(InitResponse) then) =
      _$InitResponseCopyWithImpl<$Res, InitResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') Data? data,
      @JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$InitResponseCopyWithImpl<$Res, $Val extends InitResponse>
    implements $InitResponseCopyWith<$Res> {
  _$InitResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitResponseImplCopyWith<$Res>
    implements $InitResponseCopyWith<$Res> {
  factory _$$InitResponseImplCopyWith(
          _$InitResponseImpl value, $Res Function(_$InitResponseImpl) then) =
      __$$InitResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') Data? data,
      @JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$InitResponseImplCopyWithImpl<$Res>
    extends _$InitResponseCopyWithImpl<$Res, _$InitResponseImpl>
    implements _$$InitResponseImplCopyWith<$Res> {
  __$$InitResponseImplCopyWithImpl(
      _$InitResponseImpl _value, $Res Function(_$InitResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$InitResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitResponseImpl implements _InitResponse {
  const _$InitResponseImpl(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message});

  factory _$InitResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final Data? data;
  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'InitResponse(data: $data, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, status, message);

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitResponseImplCopyWith<_$InitResponseImpl> get copyWith =>
      __$$InitResponseImplCopyWithImpl<_$InitResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitResponseImplToJson(
      this,
    );
  }
}

abstract class _InitResponse implements InitResponse {
  const factory _InitResponse(
      {@JsonKey(name: 'data') final Data? data,
      @JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message}) = _$InitResponseImpl;

  factory _InitResponse.fromJson(Map<String, dynamic> json) =
      _$InitResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  Data? get data;
  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;

  /// Create a copy of InitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitResponseImplCopyWith<_$InitResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_code')
  String? get accessCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorization_url')
  String? get authorizationUrl => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'access_code') String? accessCode,
      @JsonKey(name: 'authorization_url') String? authorizationUrl});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? accessCode = freezed,
    Object? authorizationUrl = freezed,
  }) {
    return _then(_value.copyWith(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationUrl: freezed == authorizationUrl
          ? _value.authorizationUrl
          : authorizationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'access_code') String? accessCode,
      @JsonKey(name: 'authorization_url') String? authorizationUrl});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? accessCode = freezed,
    Object? authorizationUrl = freezed,
  }) {
    return _then(_$DataImpl(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationUrl: freezed == authorizationUrl
          ? _value.authorizationUrl
          : authorizationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'reference') this.reference,
      @JsonKey(name: 'access_code') this.accessCode,
      @JsonKey(name: 'authorization_url') this.authorizationUrl});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'reference')
  final String? reference;
  @override
  @JsonKey(name: 'access_code')
  final String? accessCode;
  @override
  @JsonKey(name: 'authorization_url')
  final String? authorizationUrl;

  @override
  String toString() {
    return 'Data(reference: $reference, accessCode: $accessCode, authorizationUrl: $authorizationUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.accessCode, accessCode) ||
                other.accessCode == accessCode) &&
            (identical(other.authorizationUrl, authorizationUrl) ||
                other.authorizationUrl == authorizationUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reference, accessCode, authorizationUrl);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
          {@JsonKey(name: 'reference') final String? reference,
          @JsonKey(name: 'access_code') final String? accessCode,
          @JsonKey(name: 'authorization_url') final String? authorizationUrl}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(name: 'access_code')
  String? get accessCode;
  @override
  @JsonKey(name: 'authorization_url')
  String? get authorizationUrl;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
