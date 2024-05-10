import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

class PrivacyPolicyState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  String content = '';

  getContactDetail() async {
    // populate devide info
    loading = true;
    Response<dynamic> response = await dioService
        .get('/privacypolicy/user/get-privacy-policy',
            queryParameters: {"type": "data_sharing_policy"},
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
    content = res['data']['content'];
    loading = false;
    // twitterlink = res['data']['twitter_url'];

    notifyListeners();
  }
}

final privacypolicy = ChangeNotifierProvider.autoDispose((r) {
  return PrivacyPolicyState();
});
