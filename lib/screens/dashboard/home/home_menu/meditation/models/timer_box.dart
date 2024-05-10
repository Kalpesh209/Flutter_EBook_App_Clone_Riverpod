import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_box.freezed.dart';
part 'timer_box.g.dart';

@freezed
class TimerBox with _$TimerBox {
  factory TimerBox({
    int? id,
    String? name,
    String? duration,
  }) = _TimerBox;

  factory TimerBox.fromJson(Map<String, dynamic> json) => _$TimerBoxFromJson(json);
}
