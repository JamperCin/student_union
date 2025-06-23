// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devotional_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevotionalBookModelImpl _$$DevotionalBookModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DevotionalBookModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      year: (json['year'] as num?)?.toInt() ?? 0,
      published: json['published'] as bool? ?? true,
      purchased: json['purchased'] as bool? ?? false,
      thumbnail: json['thumbnail_url'] as String? ?? "",
      devotionalType: json['devotion_type'] == null
          ? null
          : DevotionalType.fromJson(
              json['devotion_type'] as Map<String, dynamic>),
      devotionalId: (json['devotion_year_id'] as num?)?.toInt() ?? 0,
      devotion: json['devotion'] == null
          ? null
          : TodaysDevotion.fromJson(json['devotion'] as Map<String, dynamic>),
      description: json['description'] as String? ?? "",
      title: json['title'] as String? ?? "",
      name: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      page: json['page'] as String? ?? "",
      currency: json['currency'] as String? ?? "GHS",
      price: json['price'] as String? ?? "0.00",
    );

Map<String, dynamic> _$$DevotionalBookModelImplToJson(
        _$DevotionalBookModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'published': instance.published,
      'purchased': instance.purchased,
      'thumbnail_url': instance.thumbnail,
      'devotion_type': instance.devotionalType,
      'devotion_year_id': instance.devotionalId,
      'devotion': instance.devotion,
      'description': instance.description,
      'title': instance.title,
      'name': instance.name,
      'author': instance.author,
      'page': instance.page,
      'currency': instance.currency,
      'price': instance.price,
    };
