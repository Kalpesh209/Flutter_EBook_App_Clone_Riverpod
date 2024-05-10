// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'out_of_box_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutOfBoxResponseImpl _$$OutOfBoxResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OutOfBoxResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$OutOfBoxResponseImplToJson(
        _$OutOfBoxResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
