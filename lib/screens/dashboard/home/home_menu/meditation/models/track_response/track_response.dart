import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'track_response.freezed.dart';
part 'track_response.g.dart';

@freezed
class TrackResponse with _$TrackResponse {
  factory TrackResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _TrackResponse;

  factory TrackResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseFromJson(json);
}
