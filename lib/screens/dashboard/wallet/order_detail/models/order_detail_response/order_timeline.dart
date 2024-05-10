import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_timeline.freezed.dart';
part 'order_timeline.g.dart';

@freezed
class OrderTimeline with _$OrderTimeline {
  factory OrderTimeline({
    String? id,
    @JsonKey(name: 'from_status') dynamic fromStatus,
    @JsonKey(name: 'is_active') dynamic isactive,
    String? status,
    @JsonKey(name: 'created_at') dynamic createdAt,
  }) = _OrderTimeline;

  factory OrderTimeline.fromJson(Map<String, dynamic> json) => _$OrderTimelineFromJson(json);
}