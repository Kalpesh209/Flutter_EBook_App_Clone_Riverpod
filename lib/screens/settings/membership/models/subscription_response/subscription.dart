import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription {
  factory Subscription({
    String? id,
    String? name,
    int? price,
    int? day,
    @JsonKey(name: 'payment_url') String? paymentUrl,
    String? details,
    String? content,
    @JsonKey(name: 'heading_one') String? headingone,
    @JsonKey(name: 'heading_two') String? headingtwo,
    @JsonKey(name: 'heading_three') String? headingthree,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
}
