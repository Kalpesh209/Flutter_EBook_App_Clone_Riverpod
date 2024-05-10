// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteResponseImpl _$$FavoriteResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoriteResponseImpl(
      data: json['data'] == null
          ? null
          : FavoriteData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$FavoriteResponseImplToJson(
        _$FavoriteResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

_$FavouriteMusicImpl _$$FavouriteMusicImplFromJson(Map<String, dynamic> json) =>
    _$FavouriteMusicImpl(
      id: json['id'] as String?,
      trackId: json['track_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
      trackUrl: json['track_url'],
      musicId: json['music_id'],
      tag: json['tag'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$$FavouriteMusicImplToJson(
        _$FavouriteMusicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'track_id': instance.trackId,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'cover_image': instance.coverImage,
      'track_url': instance.trackUrl,
      'music_id': instance.musicId,
      'tag': instance.tag,
      'rating': instance.rating,
    };

_$FavoriteEbookImpl _$$FavoriteEbookImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteEbookImpl(
      id: json['id'] as String?,
      bookTitle: json['book_title'] as String?,
      bookId: json['book_id'] as String?,
      releaseYear: json['release_year'] as int?,
      language: json['language'] as String?,
      about: json['about'] as String?,
      coverImage: json['cover_image'] as String?,
      bookTag: json['book_tag'],
      tag: json['tag'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$$FavoriteEbookImplToJson(_$FavoriteEbookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_title': instance.bookTitle,
      'book_id': instance.bookId,
      'release_year': instance.releaseYear,
      'language': instance.language,
      'about': instance.about,
      'cover_image': instance.coverImage,
      'book_tag': instance.bookTag,
      'tag': instance.tag,
      'rating': instance.rating,
    };

_$FavoriteMeditationImpl _$$FavoriteMeditationImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoriteMeditationImpl(
      id: json['id'] as String?,
      chapterId: json['chapter_id'] as String?,
      meditationId: json['meditation_id'] as String?,
      videoUrl: json['video_url'] as String?,
      coverImage: json['cover_image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      rating: json['rating'] as int?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$FavoriteMeditationImplToJson(
        _$FavoriteMeditationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapter_id': instance.chapterId,
      'meditation_id': instance.meditationId,
      'video_url': instance.videoUrl,
      'cover_image': instance.coverImage,
      'title': instance.title,
      'description': instance.description,
      'rating': instance.rating,
      'tag': instance.tag,
    };

_$FavoriteDataImpl _$$FavoriteDataImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteDataImpl(
      favouriteYoga: (json['favouriteYoga'] as List<dynamic>?)
          ?.map((e) => BookDetailsModal.fromJson(e as Map<String, dynamic>))
          .toList(),
      favouriteBook: (json['favouriteBook'] as List<dynamic>?)
          ?.map((e) => FavoriteEbook.fromJson(e as Map<String, dynamic>))
          .toList(),
      favouriteMusic: (json['favouriteMusic'] as List<dynamic>?)
          ?.map((e) => FavouriteMusic.fromJson(e as Map<String, dynamic>))
          .toList(),
      favouriteMeditation: (json['favouriteMeditation'] as List<dynamic>?)
          ?.map((e) => FavoriteMeditation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavoriteDataImplToJson(_$FavoriteDataImpl instance) =>
    <String, dynamic>{
      'favouriteYoga': instance.favouriteYoga,
      'favouriteBook': instance.favouriteBook,
      'favouriteMusic': instance.favouriteMusic,
      'favouriteMeditation': instance.favouriteMeditation,
    };
