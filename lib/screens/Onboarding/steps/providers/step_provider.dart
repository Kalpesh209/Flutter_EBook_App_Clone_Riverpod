import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/models/question_response/question.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/models/question_response/question_response.dart';

class StepProviderState extends ChangeNotifier {
  List<String> answers = [];
  bool _loadingQuestions = false;
  get loadingQuestions => _loadingQuestions;
  set loadingQuestions(status) {
    _loadingQuestions = status;
    notifyListeners();
  }

  List<Question> questions = [];
  int _currentQuestionIndex = 0;
  get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  String _answerId = '';
  get answerId => _answerId;
  set answerId(status) {
    _answerId = status;
    notifyListeners();
  }

  bool _savingAnswer = false;
  get savingAnswer => _savingAnswer;
  set savingAnswer(status) {
    _savingAnswer = status;
    notifyListeners();
  }

  getQuestions() async {
    loadingQuestions = true;
    Response<dynamic> response =
        await dioService.get('onboarding/user/get-question?language=en');
    Map<String, dynamic> res = response.data;
    QuestionResponse questionResponse = QuestionResponse.fromJson(res);
    debugPrint('res $res');
    questions = questionResponse.data?.question ?? [];
    loadingQuestions = false;
    notifyListeners();
  }

  answerQuetion(questionId, answerId) async {
    savingAnswer = true;
    //Response<dynamic> response =
    await dioService.post('onboarding/user/question-answer', data: {
      'question_master_id': questionId,
      'option_master_id': answerId,
    }).whenComplete(() => savingAnswer = false);
  }
}

final stepProviderProvider = ChangeNotifierProvider.autoDispose((r) {
  return StepProviderState()..getQuestions();
});
