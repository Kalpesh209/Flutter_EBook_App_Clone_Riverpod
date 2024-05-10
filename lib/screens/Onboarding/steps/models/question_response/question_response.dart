import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'question_response.freezed.dart';
part 'question_response.g.dart';

@freezed
class QuestionResponse with _$QuestionResponse {
  factory QuestionResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _QuestionResponse;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);
}
