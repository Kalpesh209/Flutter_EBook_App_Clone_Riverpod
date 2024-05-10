import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_track.freezed.dart';
part 'music_track.g.dart';

@freezed
class MusicTrack with _$MusicTrack {
  factory MusicTrack({
    String? id,
    @JsonKey(name: 'sr_no') int? srNo,
    String? title,
    String? description,
    String? tag,
    String? image,
    @JsonKey(name: 'track_url') String? trackUrl,
    @JsonKey(name: 'is_favourite') bool? isFavourite,
  }) = _MusicTrack;

  factory MusicTrack.fromJson(Map<String, dynamic> json) =>
      _$MusicTrackFromJson(json);
}
