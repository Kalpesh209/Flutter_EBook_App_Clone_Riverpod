// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderTimelineImpl _$$OrderTimelineImplFromJson(Map<String, dynamic> json) =>
    _$OrderTimelineImpl(
      id: json['id'] as String?,
      fromStatus: json['from_status'],
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OrderTimelineImplToJson(_$OrderTimelineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_status': instance.fromStatus,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };
