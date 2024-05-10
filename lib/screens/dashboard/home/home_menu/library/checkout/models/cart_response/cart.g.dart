// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      id: json['id'] as String?,
      bookId: json['book_id'] as String?,
      bookTitle: json['book_title'] as String?,
      bookUsage: json['book_usage'] as String?,
      libraryQuantity: json['library_quantity'] as int?,
      releaseYear: json['release_year'] as int?,
      isbn: json['ISBN'] as String?,
      language: json['language'] as String?,
      about: json['about'] as String?,
      coverImage: json['cover_image'] as String?,
      bookTag: json['book_tag'] as String?,
      authorName: json['author_name'] as String?,
      rating: json['rating'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'book_title': instance.bookTitle,
      'book_usage': instance.bookUsage,
      'library_quantity': instance.libraryQuantity,
      'release_year': instance.releaseYear,
      'ISBN': instance.isbn,
      'language': instance.language,
      'about': instance.about,
      'cover_image': instance.coverImage,
      'book_tag': instance.bookTag,
      'author_name': instance.authorName,
      'rating': instance.rating,
      'tag': instance.tag,
    };
