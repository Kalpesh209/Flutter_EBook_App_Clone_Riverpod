import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';

part 'favorite_model.g.dart';

@freezed
class FavoriteResponse with _$FavoriteResponse {
  factory FavoriteResponse({
    FavoriteData? data,
    bool? success,
    String? message,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);
}

@freezed
class FavouriteMusic with _$FavouriteMusic {
  factory FavouriteMusic({
    String? id,
    @JsonKey(name: 'track_id') String? trackId,
    String? title,
    String? description,
    String? image,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'track_url') dynamic trackUrl,
    @JsonKey(name: 'music_id') dynamic musicId,
    String? tag,
    int? rating,
  }) = _FavouriteMusic;

  factory FavouriteMusic.fromJson(Map<String, dynamic> json) =>
      _$FavouriteMusicFromJson(json);
}

@freezed
class FavoriteEbook with _$FavoriteEbook {
  factory FavoriteEbook({
    String? id,
    @JsonKey(name: 'book_title') String? bookTitle,
    @JsonKey(name: 'book_id') String? bookId,
    @JsonKey(name: 'release_year') int? releaseYear,
    String? language,
    String? about,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'book_tag') dynamic bookTag,
    // @JsonKey(name: 'author_name') dynamic author,
    String? tag,
    // @JsonKey(name: 'is_publish') bool? isPublish,
    // @JsonKey(name: 'is_featured') bool? isFeatured,
    int? rating,
    // String? type,
  }) = _FavoriteEbook;

  factory FavoriteEbook.fromJson(Map<String, dynamic> json) =>
      _$FavoriteEbookFromJson(json);
}

@freezed
class FavoriteMeditation with _$FavoriteMeditation {
  factory FavoriteMeditation({
    String? id,
    @JsonKey(name: 'chapter_id') String? chapterId,
    @JsonKey(name: 'meditation_id') String? meditationId,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'cover_image') String? coverImage,
    String? title,
    String? description,
    int? rating,
    String? tag,
  }) = _FavoriteMeditation;

  factory FavoriteMeditation.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMeditationFromJson(json);
}

@freezed
class FavoriteData with _$FavoriteData {
  factory FavoriteData({
    List<BookDetailsModal>? favouriteYoga,
    List<FavoriteEbook>? favouriteBook,
    List<FavouriteMusic>? favouriteMusic,
    List<FavoriteMeditation>? favouriteMeditation,
  }) = _FavoriteData;

  factory FavoriteData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataFromJson(json);
}
