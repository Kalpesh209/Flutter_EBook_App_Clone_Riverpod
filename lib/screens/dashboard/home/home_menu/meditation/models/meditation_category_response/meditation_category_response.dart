import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'meditation_category_response.freezed.dart';
part 'meditation_category_response.g.dart';

@freezed
class MeditationCategoryResponse with _$MeditationCategoryResponse {
  factory MeditationCategoryResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _MeditationCategoryResponse;

  factory MeditationCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MeditationCategoryResponseFromJson(json);
}
