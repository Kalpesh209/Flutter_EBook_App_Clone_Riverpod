import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

import '../../../../../common/helpers/snakbar_helper.dart';

class MenuScreenState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  String firstname = '';
  String lastname = '';
  String email = '';
  String mobileNumber = '';
  String? profileimage;
  String verification = '';
  String inivitelink = '';
  bool notification = false;
  bool app_notification = false;

  TextEditingController _subjectControllerContacct = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  get subcon => _subjectControllerContacct;

  get messagecon => _messageController;

  // loadSavedUsed() async {
  //   await authService.loadUser();
  //   if (authService.user?.token != null) {
  //     token = authService.user?.token;
  //   } else {
  //     await authService.logout();
  //     Get.offAndToNamed(LOGIN);
  //   }
  // }

  set subcont(status) {
    _subjectControllerContacct = subcon;
    notifyListeners();
  }

  set messagecon(status) {
    _messageController = messagecon;

    notifyListeners();
  }

  getContactDetail() async {
    debugPrint('getContactDetail');
    loading = true;
    Response<dynamic> response = await dioService
        .get('user/get-user',
            data: {
              // "category": _categoryController.text,
              // "subject": _subjectController.text,
              // "feedback": _feedbackController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    debugPrint('response.data ${response.data}');
    Map<String, dynamic> res = response.data;
    firstname = res['data']['first_name'];
    lastname = res['data']['last_name'];
    email = res['data']['email'];
    mobileNumber = res['data']['mobile_number'];
    profileimage = res['data']['profile_image'];
    verification = res['data']['verification_code'];
    inivitelink = res['data']['invite_code_link'];
    notification = res['data']['notification'];
    app_notification = res['data']['app_notification'];
    debugPrint(profileimage);
    // twitterlink = res['data']['twitter_url'];
    notifyListeners();
  }

  postContactDetails() async {
    // populate devide info

    loading = true;
    Response<dynamic> response = await dioService
        .post('/enquire/user/add-enquire',
            data: {
              // "category": _categoryController.text,
              "subject": _subjectControllerContacct.text,
              "message": _messageController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');

    notifyListeners();
  }

  appNotification(bool flag) async {
    loading = true;
    //dio.Response<dynamic> response =

    Response<dynamic> response = await dioService.put(
      'user/status_change/app_notification',
      data: {'app_notification': flag},
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      app_notification = flag;
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error(res["message"]);
    }

    notifyListeners();
    getContactDetail();
  }

  generalNotification(bool flag) async {
    loading = true;
    //dio.Response<dynamic> response =

    Response<dynamic> response = await dioService.put(
      'user/status_change/general_notification',
      data: {'general_notification': flag},
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      notification = flag;
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error(res["message"]);
    }
    notifyListeners();
    getContactDetail();
  }
}

final menuState = ChangeNotifierProvider.autoDispose((r) {
  return MenuScreenState();
});
