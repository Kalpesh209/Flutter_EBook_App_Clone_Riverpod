import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/feedback/models/feedbackmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/helpers/snakbar_helper.dart';
import '../../../../config/route/route_names.dart';

class FeedbackState extends ChangeNotifier {
  bool _loading = false;
  TextEditingController _subcategoryController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _feedbackController = TextEditingController();

  String _categoryName = "";

  get loading => _loading;

  get subcategory => _subcategoryController;
  get subcon => _subjectController;

  get catcon => _categoryController;

  get feedcon => _feedbackController;

  get categoryName => _categoryName;

  set categoryName(status) {
    _categoryName = status;
    debugPrint("Feedback category 2 $_categoryName");
    notifyListeners();
  }

  String? token = "";

  loadSavedUsed() async {
    await authService.loadUser();
    if (authService.user?.token != null) {
      token = authService.user?.token;
    } else {
      await authService.logout();
      Get.offAndToNamed(login);
    }
  }

  set subcont(status) {
    _subjectController = subcon;

    notifyListeners();
  }

  set subcategory(status) {
    _subcategoryController = subcategory;

    notifyListeners();
  }

  set catcon(status) {
    _categoryController = catcon;

    notifyListeners();
  }

  set feedcon(status) {
    _feedbackController = feedcon;

    notifyListeners();
  }

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  sendfeeback() async {
    // populate devide info
    debugPrint("Feedback category $categoryName");

    loading = true;
    Response<dynamic> response = await dioService
        .post('feedback/user/add-feedback',
            data: {
              "category": categoryName,
              "sub_category": _subcategoryController.text,
              "subject": _subjectController.text,
              "feedback": _feedbackController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    FeedbackResponse feedbackResponse = FeedbackResponse.fromJson(res);
    if (feedbackResponse.success) {
      SnackbarHelper.error(feedbackResponse.message);
    } else {
      SnackbarHelper.error(feedbackResponse.message);
    }
  }
}

final feedbackprov = ChangeNotifierProvider.autoDispose((r) {
  var state = FeedbackState();
  state.loadSavedUsed();
  return FeedbackState();
});
