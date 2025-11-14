// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devotional_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DevotionalBookModel _$DevotionalBookModelFromJson(Map<String, dynamic> json) {
  return _DevotionalBookModel.fromJson(json);
}

/// @nodoc
mixin _$DevotionalBookModel {
  int get id => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  bool get purchased => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_url")
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: "devotion_type")
  DevotionalType? get devotionalType => throw _privateConstructorUsedError;
  @JsonKey(name: "devotion_year_id")
  int get devotionalId => throw _privateConstructorUsedError;
  TodaysDevotion? get devotion => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get page => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  /// Serializes this DevotionalBookModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DevotionalBookModelCopyWith<DevotionalBookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevotionalBookModelCopyWith<$Res> {
  factory $DevotionalBookModelCopyWith(
    DevotionalBookModel value,
    $Res Function(DevotionalBookModel) then,
  ) = _$DevotionalBookModelCopyWithImpl<$Res, DevotionalBookModel>;
  @useResult
  $Res call({
    int id,
    int year,
    bool published,
    bool purchased,
    @JsonKey(name: "thumbnail_url") String thumbnail,
    @JsonKey(name: "devotion_type") DevotionalType? devotionalType,
    @JsonKey(name: "devotion_year_id") int devotionalId,
    TodaysDevotion? devotion,
    String description,
    String title,
    String name,
    String author,
    String page,
    String currency,
    String price,
  });

  $DevotionalTypeCopyWith<$Res>? get devotionalType;
  $TodaysDevotionCopyWith<$Res>? get devotion;
}

/// @nodoc
class _$DevotionalBookModelCopyWithImpl<$Res, $Val extends DevotionalBookModel>
    implements $DevotionalBookModelCopyWith<$Res> {
  _$DevotionalBookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? published = null,
    Object? purchased = null,
    Object? thumbnail = null,
    Object? devotionalType = freezed,
    Object? devotionalId = null,
    Object? devotion = freezed,
    Object? description = null,
    Object? title = null,
    Object? name = null,
    Object? author = null,
    Object? page = null,
    Object? currency = null,
    Object? price = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            published: null == published
                ? _value.published
                : published // ignore: cast_nullable_to_non_nullable
                      as bool,
            purchased: null == purchased
                ? _value.purchased
                : purchased // ignore: cast_nullable_to_non_nullable
                      as bool,
            thumbnail: null == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String,
            devotionalType: freezed == devotionalType
                ? _value.devotionalType
                : devotionalType // ignore: cast_nullable_to_non_nullable
                      as DevotionalType?,
            devotionalId: null == devotionalId
                ? _value.devotionalId
                : devotionalId // ignore: cast_nullable_to_non_nullable
                      as int,
            devotion: freezed == devotion
                ? _value.devotion
                : devotion // ignore: cast_nullable_to_non_nullable
                      as TodaysDevotion?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DevotionalTypeCopyWith<$Res>? get devotionalType {
    if (_value.devotionalType == null) {
      return null;
    }

    return $DevotionalTypeCopyWith<$Res>(_value.devotionalType!, (value) {
      return _then(_value.copyWith(devotionalType: value) as $Val);
    });
  }

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodaysDevotionCopyWith<$Res>? get devotion {
    if (_value.devotion == null) {
      return null;
    }

    return $TodaysDevotionCopyWith<$Res>(_value.devotion!, (value) {
      return _then(_value.copyWith(devotion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DevotionalBookModelImplCopyWith<$Res>
    implements $DevotionalBookModelCopyWith<$Res> {
  factory _$$DevotionalBookModelImplCopyWith(
    _$DevotionalBookModelImpl value,
    $Res Function(_$DevotionalBookModelImpl) then,
  ) = __$$DevotionalBookModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int year,
    bool published,
    bool purchased,
    @JsonKey(name: "thumbnail_url") String thumbnail,
    @JsonKey(name: "devotion_type") DevotionalType? devotionalType,
    @JsonKey(name: "devotion_year_id") int devotionalId,
    TodaysDevotion? devotion,
    String description,
    String title,
    String name,
    String author,
    String page,
    String currency,
    String price,
  });

  @override
  $DevotionalTypeCopyWith<$Res>? get devotionalType;
  @override
  $TodaysDevotionCopyWith<$Res>? get devotion;
}

/// @nodoc
class __$$DevotionalBookModelImplCopyWithImpl<$Res>
    extends _$DevotionalBookModelCopyWithImpl<$Res, _$DevotionalBookModelImpl>
    implements _$$DevotionalBookModelImplCopyWith<$Res> {
  __$$DevotionalBookModelImplCopyWithImpl(
    _$DevotionalBookModelImpl _value,
    $Res Function(_$DevotionalBookModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? published = null,
    Object? purchased = null,
    Object? thumbnail = null,
    Object? devotionalType = freezed,
    Object? devotionalId = null,
    Object? devotion = freezed,
    Object? description = null,
    Object? title = null,
    Object? name = null,
    Object? author = null,
    Object? page = null,
    Object? currency = null,
    Object? price = null,
  }) {
    return _then(
      _$DevotionalBookModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        published: null == published
            ? _value.published
            : published // ignore: cast_nullable_to_non_nullable
                  as bool,
        purchased: null == purchased
            ? _value.purchased
            : purchased // ignore: cast_nullable_to_non_nullable
                  as bool,
        thumbnail: null == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String,
        devotionalType: freezed == devotionalType
            ? _value.devotionalType
            : devotionalType // ignore: cast_nullable_to_non_nullable
                  as DevotionalType?,
        devotionalId: null == devotionalId
            ? _value.devotionalId
            : devotionalId // ignore: cast_nullable_to_non_nullable
                  as int,
        devotion: freezed == devotion
            ? _value.devotion
            : devotion // ignore: cast_nullable_to_non_nullable
                  as TodaysDevotion?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DevotionalBookModelImpl implements _DevotionalBookModel {
  const _$DevotionalBookModelImpl({
    this.id = 0,
    this.year = 0,
    this.published = true,
    this.purchased = false,
    @JsonKey(name: "thumbnail_url") this.thumbnail = "",
    @JsonKey(name: "devotion_type") this.devotionalType,
    @JsonKey(name: "devotion_year_id") this.devotionalId = 0,
    this.devotion,
    this.description = "",
    this.title = "",
    this.name = "",
    this.author = "",
    this.page = "",
    this.currency = "GHS",
    this.price = "0.00",
  });

  factory _$DevotionalBookModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevotionalBookModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final bool published;
  @override
  @JsonKey()
  final bool purchased;
  @override
  @JsonKey(name: "thumbnail_url")
  final String thumbnail;
  @override
  @JsonKey(name: "devotion_type")
  final DevotionalType? devotionalType;
  @override
  @JsonKey(name: "devotion_year_id")
  final int devotionalId;
  @override
  final TodaysDevotion? devotion;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final String page;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String price;

  @override
  String toString() {
    return 'DevotionalBookModel(id: $id, year: $year, published: $published, purchased: $purchased, thumbnail: $thumbnail, devotionalType: $devotionalType, devotionalId: $devotionalId, devotion: $devotion, description: $description, title: $title, name: $name, author: $author, page: $page, currency: $currency, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevotionalBookModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.purchased, purchased) ||
                other.purchased == purchased) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.devotionalType, devotionalType) ||
                other.devotionalType == devotionalType) &&
            (identical(other.devotionalId, devotionalId) ||
                other.devotionalId == devotionalId) &&
            (identical(other.devotion, devotion) ||
                other.devotion == devotion) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    year,
    published,
    purchased,
    thumbnail,
    devotionalType,
    devotionalId,
    devotion,
    description,
    title,
    name,
    author,
    page,
    currency,
    price,
  );

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevotionalBookModelImplCopyWith<_$DevotionalBookModelImpl> get copyWith =>
      __$$DevotionalBookModelImplCopyWithImpl<_$DevotionalBookModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DevotionalBookModelImplToJson(this);
  }
}

abstract class _DevotionalBookModel implements DevotionalBookModel {
  const factory _DevotionalBookModel({
    final int id,
    final int year,
    final bool published,
    final bool purchased,
    @JsonKey(name: "thumbnail_url") final String thumbnail,
    @JsonKey(name: "devotion_type") final DevotionalType? devotionalType,
    @JsonKey(name: "devotion_year_id") final int devotionalId,
    final TodaysDevotion? devotion,
    final String description,
    final String title,
    final String name,
    final String author,
    final String page,
    final String currency,
    final String price,
  }) = _$DevotionalBookModelImpl;

  factory _DevotionalBookModel.fromJson(Map<String, dynamic> json) =
      _$DevotionalBookModelImpl.fromJson;

  @override
  int get id;
  @override
  int get year;
  @override
  bool get published;
  @override
  bool get purchased;
  @override
  @JsonKey(name: "thumbnail_url")
  String get thumbnail;
  @override
  @JsonKey(name: "devotion_type")
  DevotionalType? get devotionalType;
  @override
  @JsonKey(name: "devotion_year_id")
  int get devotionalId;
  @override
  TodaysDevotion? get devotion;
  @override
  String get description;
  @override
  String get title;
  @override
  String get name;
  @override
  String get author;
  @override
  String get page;
  @override
  String get currency;
  @override
  String get price;

  /// Create a copy of DevotionalBookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevotionalBookModelImplCopyWith<_$DevotionalBookModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
