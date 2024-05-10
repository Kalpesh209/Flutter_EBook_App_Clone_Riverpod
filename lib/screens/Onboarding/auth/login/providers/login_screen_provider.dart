import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/login/models/login_response/login_response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreenState extends ChangeNotifier {
  bool _loading = false;
  bool _obscureText = true;

  get obscureText => _obscureText;

  get loading => _loading;

  set toggle(status) {
    _obscureText = status;
    notifyListeners();
  }

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  FormGroup loginForm = FormGroup({
    //'country_code': FormControl(),
    'mobile_number': FormControl(
      value: '',
    ),
    'password': FormControl(value: '', validators: [Validators.required]),
    'device_info': FormControl(validators: [Validators.required]),
    'fcmToken': FormControl(value: fcmToken),
  });

  getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    return await deviceInfoPlugin.deviceInfo;
  }

  late LoginResponse loginResponse;

  login() async {
    FirebaseAnalytics.instance
        .logEvent(name: 'login_button_tap')
        .then((value) => null);

    var deviceInfo = await getDeviceInfo();
    // populate devide info
    loginForm.patchValue({
      'device_info': Platform.isAndroid
          ? (deviceInfo as AndroidDeviceInfo).device
          : (deviceInfo as IosDeviceInfo).name,
    });
    if (loginForm.invalid) {
      throw InvalidFormException();
    }
    loading = true;

    Response<dynamic> response = await dioService
        .post('user/login', data: loginForm.value)
        .whenComplete(() => {});

    Map<String, dynamic> res = response.data;
    loginResponse = LoginResponse.fromJson(res);

    if (loginResponse.data?.isVerified == false) {
      loading = false;
    } else {
      loading = false;

      if (loginResponse.success == true) {
        await authService.save(loginResponse);
        await authService.loadUser();
      }
    }
  }
}

final loginScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  FirebaseAnalytics.instance
      .logEvent(name: 'open_login_screen')
      .then((value) => null);
  return LoginScreenState();
});
