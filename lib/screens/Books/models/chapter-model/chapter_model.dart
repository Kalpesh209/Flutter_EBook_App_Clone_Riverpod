import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class ChapterResponse with _$ChapterResponse {
  factory ChapterResponse({
    ChapterData? data,
    bool? success,
    String? message,
  }) = _ChapterResponse;

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterResponseFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    String? id,
    String? title,
    @JsonKey(name: "chapter_content") String? chapterContent,
    @JsonKey(name: "cover_image") String? coverImage,
    String? tag,
    List<String>? bookTopic,
    @JsonKey(name: "audio_url") String? audioUrl,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

@freezed
class ChapterData with _$ChapterData {
  factory ChapterData({
    List<Chapter>? bookChapter,
    int? count,
    int? AllCount,
  }) = _ChapterData;

  factory ChapterData.fromJson(Map<String, dynamic> json) =>
      _$ChapterDataFromJson(json);
}
