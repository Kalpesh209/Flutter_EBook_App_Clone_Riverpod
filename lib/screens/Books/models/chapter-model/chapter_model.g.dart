// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterResponseImpl _$$ChapterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterResponseImpl(
      data: json['data'] == null
          ? null
          : ChapterData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ChapterResponseImplToJson(
    _$ChapterResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      chapterContent: json['chapter_content'] as String?,
      coverImage: json['cover_image'] as String?,
      tag: json['tag'] as String?,
      bookTopic: (json['bookTopic'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      audioUrl: json['audio_url'] as String?,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'chapter_content': instance.chapterContent,
      'cover_image': instance.coverImage,
      'tag': instance.tag,
      'bookTopic': instance.bookTopic,
      'audio_url': instance.audioUrl,
    };

_$ChapterDataImpl _$$ChapterDataImplFromJson(Map<String, dynamic> json) =>
    _$ChapterDataImpl(
      bookChapter: (json['bookChapter'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      AllCount: json['AllCount'] as int?,
    );

Map<String, dynamic> _$$ChapterDataImplToJson(_$ChapterDataImpl instance) =>
    <String, dynamic>{
      'bookChapter': instance.bookChapter,
      'count': instance.count,
      'AllCount': instance.AllCount,
    };
