import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    String? id,
    String? question,
    String? type,
    List<Option>? option,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
