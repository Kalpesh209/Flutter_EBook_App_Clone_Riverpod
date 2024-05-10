
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/helpers/snakbar_helper.dart';
import '../../../../../config/constants.dart';
import '../../../../../config/services/setup_singleton_services.dart';
import '../../login/models/login_response/login_response.dart';


class ForgotPasswordState extends ChangeNotifier {
  bool _loading = false;

  String _countyCode = "+91";

  get countyCode => _countyCode;
  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }


  set countyCode(status){
    _countyCode = status;
    countryCode = status;

    notifyListeners();
  }

  bool _sendingOtp = false;

  get sendingOtp => _sendingOtp;
  set sendingOtp(status) {
    _sendingOtp = status;
    notifyListeners();
  }



  FormGroup forgotPasswordForm = FormGroup({
    'country_code': FormControl(),
    'mobile_number': FormControl<String>(
        validators: [Validators.required]),
  });

  startPasswordRecovery() {
    FirebaseAnalytics.instance
        .logEvent(name: 'continue_password_recovery_button_tap')
        .then((value) => null);

    GetStorage().write('verification_type', 'reset-password');
    GetStorage().write('mobile_number', forgotPasswordForm.control('mobile_number').value);

    //sendOtp();
   // Get.toNamed(resetVerify);
  }


  late LoginResponse loginResponse;

  sendOtp() async {
    // if (sendingOtp) return;
    // EasyLoading.show(status: 'Sending OTP');
    var mobileNumber = forgotPasswordForm.control('mobile_number').value;

 /*   Response<dynamic> response = await dioService.post('user/sendotp',
        data: {'mobile_number': mobileNumber}).whenComplete(() {
      sendingOtp = false;
      return EasyLoading.dismiss();
    });*/

    Response<dynamic> response = await dioService
        .post('user/sendotp', data: {'mobile_number': mobileNumber})
        .whenComplete(() => loading = false);

    Map<String, dynamic> res = response.data;
    loginResponse   = LoginResponse.fromJson(res);

    if(loginResponse.success == true){
      // Get.toNamed(resetVerify);
      GetStorage().write('verification_type', 'reset-password');
      GetStorage().write('mobile_number', forgotPasswordForm.control('mobile_number').value);

    }else{
      SnackbarHelper.success(loginResponse.message );
    }

  /*  debugPrint("error code for  : ${res["success"]}");
    if(res["success"] == true){
      Get.toNamed(resetVerify);
    }else{
      SnackbarHelper.success(res["message"] );
    }*/


  }




}

final forgotPasswordProvider = ChangeNotifierProvider.autoDispose((r) {
  FirebaseAnalytics.instance
      .logEvent(name: 'open_forgot_password_screen')
      .then((value) => null);
  return ForgotPasswordState();
});
