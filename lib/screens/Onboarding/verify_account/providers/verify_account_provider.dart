import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/models/signup_response/signup_response.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/models/signup_response/data.dart'
    as user_data;

class VerifyAccountState extends ChangeNotifier {
  bool _loading = false;
  get loading => _loading;
  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool _sendingOtp = false;

  get sendingOtp => _sendingOtp;
  set sendingOtp(status) {
    _sendingOtp = status;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();

  FormGroup verifyAccounForm = FormGroup({
    'mobile_number': FormControl(),
    'code': FormControl(),
  });

  sendOtp() async {
    if (sendingOtp) return;
    EasyLoading.show(status: 'Sending OTP');
    var mobileNumber = verifyAccounForm.control('mobile_number').value;

    //Response<dynamic> response =

    await dioService.post('user/sendotp',
        data: {'mobile_number': mobileNumber}).whenComplete(() {
      sendingOtp = false;
      return EasyLoading.dismiss();
    });
    //Map<String, dynamic> res = response.data;
    SnackbarHelper.success("Success");
  }

  verifyOtp() async {
    if (loading) return;
    debugPrint('verifyAccounForm.value ${verifyAccounForm.value}');

    Response<dynamic> response = await dioService
        .post('user/verifyotp', data: verifyAccounForm.value)
        .whenComplete(() {
      sendingOtp = false;
      return EasyLoading.dismiss();
    });
    var verification_type = GetStorage().read('verification_type');
    if (verification_type == "reset-password") {
    } else {
      try {
        SignupResponse signupResponse = SignupResponse.fromJson(response.data);
        user_data.Data userDetails = user_data.Data(
          id: signupResponse.data?.id,
          firstName: signupResponse.data?.firstName,
          lastName: signupResponse.data?.lastName,
          email: signupResponse.data?.email,
          mobileNumber: signupResponse.data?.mobileNumber,
          verificationCode: signupResponse.data?.verificationCode,
          profileImage: signupResponse.data?.profileImage,
          token: signupResponse.data?.token,
          isVerified: true,
        );

        await storageService.write(key: 'user', value: jsonEncode(userDetails));
      } catch (e) {
        debugPrint('e $e');
      }
    }
  }
}

final verifyAccountProvider = ChangeNotifierProvider.autoDispose((r) {
  var state = VerifyAccountState();
  var mobileNumber = GetStorage().read('mobile_number');
  var verification_type = GetStorage().read('verification_type');
  state.verifyAccounForm.patchValue({'mobile_number': mobileNumber});

  debugPrint('verification_type.value $verification_type');
  if (verification_type == "reset-password") {
  } else {
    state.sendOtp();
  }
  return state;
});
