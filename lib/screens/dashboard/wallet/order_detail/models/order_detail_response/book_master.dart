import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_master.freezed.dart';
part 'book_master.g.dart';

@freezed
class BookMaster with _$BookMaster {
  factory BookMaster({
    String? id,
    @JsonKey(name: 'book_title') String? bookTitle,
    @JsonKey(name: 'release_year') int? releaseYear,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    @JsonKey(name: 'is_audio_book') bool? isAudioBook,
    String? language,
    String? about,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'ISBN') String? isbn,
    @JsonKey(name: 'book_tag') String? bookTag,
    String? tag,
    @JsonKey(name: 'book_usage') String? bookUsage,
    @JsonKey(name: 'library_quantity') int? libraryQuantity,
    @JsonKey(name: 'is_publish') bool? isPublish,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _BookMaster;

  factory BookMaster.fromJson(Map<String, dynamic> json) =>
      _$BookMasterFromJson(json);
}
