// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookMasterImpl _$$BookMasterImplFromJson(Map<String, dynamic> json) =>
    _$BookMasterImpl(
      id: json['id'] as String?,
      bookTitle: json['book_title'] as String?,
      releaseYear: json['release_year'] as int?,
      isFeatured: json['is_featured'] as bool?,
      isAudioBook: json['is_audio_book'] as bool?,
      language: json['language'] as String?,
      about: json['about'] as String?,
      coverImage: json['cover_image'] as String?,
      isbn: json['ISBN'] as String?,
      bookTag: json['book_tag'] as String?,
      tag: json['tag'] as String?,
      bookUsage: json['book_usage'] as String?,
      libraryQuantity: json['library_quantity'] as int?,
      isPublish: json['is_publish'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BookMasterImplToJson(_$BookMasterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_title': instance.bookTitle,
      'release_year': instance.releaseYear,
      'is_featured': instance.isFeatured,
      'is_audio_book': instance.isAudioBook,
      'language': instance.language,
      'about': instance.about,
      'cover_image': instance.coverImage,
      'ISBN': instance.isbn,
      'book_tag': instance.bookTag,
      'tag': instance.tag,
      'book_usage': instance.bookUsage,
      'library_quantity': instance.libraryQuantity,
      'is_publish': instance.isPublish,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
