// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderTimelineImpl _$$OrderTimelineImplFromJson(Map<String, dynamic> json) =>
    _$OrderTimelineImpl(
      id: json['id'] as String?,
      fromStatus: json['from_status'],
      isactive: json['is_active'],
      status: json['status'] as String?,
      createdAt: json['created_at'],
    );

Map<String, dynamic> _$$OrderTimelineImplToJson(_$OrderTimelineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_status': instance.fromStatus,
      'is_active': instance.isactive,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
