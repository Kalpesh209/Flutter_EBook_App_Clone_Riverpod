import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'subscription_response.freezed.dart';
part 'subscription_response.g.dart';

@freezed
class SubscriptionResponse with _$SubscriptionResponse {
  factory SubscriptionResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}
