// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllOrderResponseImpl _$$AllOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AllOrderResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AllOrderResponseImplToJson(
        _$AllOrderResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
