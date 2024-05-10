import 'package:freezed_annotation/freezed_annotation.dart';

import 'music_track.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<MusicTrack>? musicTrack,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
