// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicCategoryResponseImpl _$$MusicCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicCategoryResponseImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$MusicCategoryResponseImplToJson(
        _$MusicCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
