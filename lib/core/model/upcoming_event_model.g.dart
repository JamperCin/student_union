// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpcomingEventModelImpl _$$UpcomingEventModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpcomingEventModelImpl(
      image: json['image'] as String? ?? "",
      description: json['description'] as String? ?? "",
      title: json['title'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );

Map<String, dynamic> _$$UpcomingEventModelImplToJson(
        _$UpcomingEventModelImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'description': instance.description,
      'title': instance.title,
      'date': instance.date,
    };
