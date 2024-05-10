// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignBookResponseImpl _$$AssignBookResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AssignBookResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AssignBookResponseImplToJson(
        _$AssignBookResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
