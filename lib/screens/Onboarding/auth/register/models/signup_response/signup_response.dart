import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'signup_response.freezed.dart';
part 'signup_response.g.dart';

@freezed
class SignupResponse with _$SignupResponse {
  factory SignupResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
