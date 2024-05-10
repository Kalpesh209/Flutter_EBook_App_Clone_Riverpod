// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      bookOrder: (json['bookOrder'] as List<dynamic>?)
          ?.map((e) => BookOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      allCount: json['AllCount'] as int?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'bookOrder': instance.bookOrder,
      'count': instance.count,
      'AllCount': instance.allCount,
    };
