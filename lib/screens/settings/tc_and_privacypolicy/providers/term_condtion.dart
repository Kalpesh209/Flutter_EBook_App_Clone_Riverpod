import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

class TermCondtionState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  String contentt = '';

  getContactDetail() async {
    // populate devide info

    loading = true;
    Response<dynamic> response = await dioService
        .get('/termandcondition/user/get-term-and-condition',
            data: {
              // "category": _categoryController.text,
              // "subject": _subjectController.text,
              // "feedback": _feedbackController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    contentt = res['data']['content'];
    loading = false;
    // twitterlink = res['data']['twitter_url'];

    notifyListeners();
  }
}

final termcondtionstate = ChangeNotifierProvider.autoDispose((r) {
  return TermCondtionState();
});
