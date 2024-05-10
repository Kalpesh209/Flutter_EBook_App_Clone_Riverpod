import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

import '../../../../common/helpers/snakbar_helper.dart';
import '../../feedback/models/feedbackmodel.dart';

class ContactScreenState extends ChangeNotifier {
  bool _loading = false;
  bool _agree = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  String instalink = '';
  String twitterlink = '';
  String facbooklink = '';
  String address = '';
  String contatcemail = '';
  String country_code = '';
  String number = '';

  TextEditingController _subjectControllerContacct = TextEditingController();
  TextEditingController _emailControllerContacct = TextEditingController();
  TextEditingController _nameControllerContacct = TextEditingController();
  TextEditingController _phoneControllerContacct = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  get subcon => _subjectControllerContacct;
  get email => _emailControllerContacct;
  get name => _nameControllerContacct;
  get phone => _phoneControllerContacct;
  get agree => _agree;

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
  set checkBox(status) {
    _agree = status;
    notifyListeners();
  }

  set subcont(status) {
    _subjectControllerContacct = subcon;

    notifyListeners();
  }

  set messagecon(status) {
    _messageController = messagecon;

    notifyListeners();
  }

  set email(status) {
    _emailControllerContacct = email;

    notifyListeners();
  }

  set name(status) {
    _nameControllerContacct = name;

    notifyListeners();
  }

  set phone(status) {
    _phoneControllerContacct = phone;
    notifyListeners();
  }

  getContactDetail() async {
    // populate devide info
    debugPrint(globals.token);

    loading = true;
    /* Response<dynamic> response = await dioService
        .get('/contactus/user/get-contact-us',
            data: {
              // "category": _categoryController.text,
              // "subject": _subjectController.text,
              // "feedback": _feedbackController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))*/
    Response<dynamic> response = await dioService
        .get('supportus/user/get-support-us',
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
    facbooklink = res['data']['facebook_url'];
    instalink = res['data']['instagram_url'];
    twitterlink = res['data']['twitter_url'];
    address = res['data']['address'];
    contatcemail = res['data']['email'];
    country_code = res['data']['country_code'];
    number = res['data']['number'];

    notifyListeners();
  }

  postContactDetails() async {
    // populate devide info

    loading = true;
    Response<dynamic> response = await dioService
        // .post('/enquire/user/add-enquire',
        .post('contactus/user/add-contact-us',
            data: {
              // "category": _categoryController.text,
              "name": _nameControllerContacct.text,
              "number": _phoneControllerContacct.text,
              "email": _emailControllerContacct.text,
              "subject": _subjectControllerContacct.text,
              "message": _messageController.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    _subjectControllerContacct.text = "";
    _messageController.text = "";
    _nameControllerContacct.text = "";
    _phoneControllerContacct.text = "";
    _emailControllerContacct.text = "";
    debugPrint('res $res');

    FeedbackResponse feedbackResponse = FeedbackResponse.fromJson(res);

    if (feedbackResponse.success) {
      SnackbarHelper.error(feedbackResponse.message);
    } else {
      SnackbarHelper.error(feedbackResponse.message);
    }
    notifyListeners();
  }
}

final contactscreenprov = ChangeNotifierProvider.autoDispose((r) {
  return ContactScreenState();
});
