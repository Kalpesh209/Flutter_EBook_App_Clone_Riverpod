import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'music_category_response.freezed.dart';
part 'music_category_response.g.dart';

@freezed
class MusicCategoryResponse with _$MusicCategoryResponse {
  factory MusicCategoryResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _MusicCategoryResponse;

  factory MusicCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicCategoryResponseFromJson(json);
}
