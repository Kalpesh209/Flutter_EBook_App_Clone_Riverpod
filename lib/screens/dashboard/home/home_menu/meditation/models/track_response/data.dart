import 'package:freezed_annotation/freezed_annotation.dart';

import 'meditation_track.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<MeditationTrack>? meditationChapter,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
