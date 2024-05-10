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
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/models/signup_response/signup_response.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/helpers/snakbar_helper.dart';

class RegisterScreenState extends ChangeNotifier {
  bool _loading = false;
  bool _agree = false;
  String _countyCode = "+91";

  get loading => _loading;
  get agree => _agree;
  get countyCode => _countyCode;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  set checkBox(status) {
    _agree = status;
    notifyListeners();
  }

  set countyCode(status) {
    _countyCode = status;
    countryCode = status;

    notifyListeners();
  }

  FormGroup registerForm = FormGroup({
    "first_name": FormControl(validators: [Validators.required]),
    "last_name": FormControl(validators: [Validators.required]),
    "password":
        FormControl(validators: [Validators.required, Validators.minLength(6)]),
    "email": FormControl(validators: [Validators.required]),
    "country_code": FormControl(value: countryCode),
    "mobile_number": FormControl(
        validators: [Validators.maxLength(10), Validators.required]),
    "device_type": FormControl(),
    "device_info": FormControl(),
    'fcmToken': FormControl(value: fcmToken),
  });

  getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    return await deviceInfoPlugin.deviceInfo;
  }

  Future<SignupResponse> register() async {
    FirebaseAnalytics.instance
        .logEvent(name: 'register_button_tap')
        .then((value) => null);

    debugPrint("get number ${registerForm.value}");

    if (registerForm.invalid) {
      registerForm.markAllAsTouched();
      throw InvalidFormException();
    } else if (agree == false) {
      // SnackbarHelper.error("Accept Teams of Service and Privacy Policy");
      throw InvalidFormException(
          message: "Accept Teams of Service and Privacy Policy");
    }
    var deviceInfo = await getDeviceInfo();
    // populate devide info
    registerForm.patchValue({
      'country_code': countryCode,
      'device_info': Platform.isAndroid
          ? (deviceInfo as AndroidDeviceInfo).device
          : (deviceInfo as IosDeviceInfo).name,
      'device_type': Platform.isAndroid ? 'Android' : 'IOS',
    });

    loading = true;
    Response<dynamic> response = await dioService
        .post('user/signup', data: registerForm.value)
        .whenComplete(() => loading = false);
    Map<String, dynamic> mapResponse = response.data;
    SignupResponse signupResponse = SignupResponse.fromJson(mapResponse);
    authService.save(LoginResponse.fromJson(mapResponse));
    return signupResponse;
  }
}

final registerScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  FirebaseAnalytics.instance
      .logEvent(name: 'open_register_screen')
      .then((value) => null);
  var state = RegisterScreenState();
  return state;
});
