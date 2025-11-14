// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpcomingEventModelImpl _$$UpcomingEventModelImplFromJson(
  Map<String, dynamic> json,
) => _$UpcomingEventModelImpl(
  image: json['image_url'] as String? ?? "",
  id: (json['id'] as num?)?.toInt() ?? 0,
  description: json['description'] as String? ?? "",
  name: json['name'] as String? ?? "",
  location: json['location'] as String? ?? "",
  status: json['event_status'] as String? ?? "",
  state: json['current_state'] as String? ?? "",
  date: json['created_at'] as String? ?? "",
  startDate: json['start_datetime'] as String? ?? "",
  endDate: json['end_datetime'] as String? ?? "",
);

Map<String, dynamic> _$$UpcomingEventModelImplToJson(
  _$UpcomingEventModelImpl instance,
) => <String, dynamic>{
  'image_url': instance.image,
  'id': instance.id,
  'description': instance.description,
  'name': instance.name,
  'location': instance.location,
  'event_status': instance.status,
  'current_state': instance.state,
  'created_at': instance.date,
  'start_datetime': instance.startDate,
  'end_datetime': instance.endDate,
};
