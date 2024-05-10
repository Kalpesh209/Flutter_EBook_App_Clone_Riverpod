import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_track.freezed.dart';
part 'meditation_track.g.dart';

@freezed
class MeditationTrack with _$MeditationTrack {
  factory MeditationTrack({
    String? id,
    @JsonKey(name: 'sr_no') int? srNo,
    String? title,
    String? description,
    String? tag,
    String? image,
    @JsonKey(name: 'video_url') String? trackUrl,
    @JsonKey(name: 'is_favourite') bool? isFavourite,
  }) = _MeditationTrack;

  factory MeditationTrack.fromJson(Map<String, dynamic> json) =>
      _$MeditationTrackFromJson(json);
}
