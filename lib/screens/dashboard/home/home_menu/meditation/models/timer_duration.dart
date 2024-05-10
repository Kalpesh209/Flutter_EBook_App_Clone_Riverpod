import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_duration.freezed.dart';
part 'timer_duration.g.dart';

@freezed
class TimerDuration with _$TimerDuration {
  factory TimerDuration({
    String? hour,
    String? minutes,
    String? seconds,
  }) = _TimerDuration;

  factory TimerDuration.fromJson(Map<String, dynamic> json) =>
      _$TimerDurationFromJson(json);
}
