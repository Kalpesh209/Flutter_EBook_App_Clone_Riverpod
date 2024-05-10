import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'music_response.freezed.dart';
part 'music_response.g.dart';

@freezed
class MusicResponse with _$MusicResponse {
  factory MusicResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _MusicResponse;

  factory MusicResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicResponseFromJson(json);
}
