// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeditationCategoryResponseImpl _$$MeditationCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeditationCategoryResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$MeditationCategoryResponseImplToJson(
        _$MeditationCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
