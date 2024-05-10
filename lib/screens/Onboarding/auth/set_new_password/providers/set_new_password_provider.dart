import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SetNewPasswordState extends ChangeNotifier {
  bool _loading = false;
  bool _passwordShow = true;
  bool _confiPasswordShow = true;
  bool _obscureText = true;

  get loading => _loading;

  get obscureText => _obscureText;
  get passwordShow => _passwordShow;
  get confirmPasswordShow => _confiPasswordShow;

  set toggle(status) {
    _obscureText = status;
    notifyListeners();
  }

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  set passwordShow(status) {
    _passwordShow = status;
    notifyListeners();
  }

  set confirmPasswordShow(status) {
    _confiPasswordShow = status;
    notifyListeners();
  }

  TextEditingController tECNewPassword = TextEditingController(text: "");
  TextEditingController tECConfirmPassword = TextEditingController(text: "");

  // get newController => _newpassword;
  // get confirmController => _confirmPassword;

  set subcont(status) {
    //_newpassword = newController;

    notifyListeners();
  }

  // FormGroup newPasswordForm = FormGroup({
  //   //'country_code': FormControl(),
  //   'mobile_number': FormControl<String>(validators: [Validators.required, Validators.number]),
  //   'password': FormControl<String>(validators: [Validators.required]),
  // });

  var newPasswordForm = GlobalKey<FormState>();

  setNewPassword() async {
    loading = true;
    //Response<dynamic> response =
    await dioService.put('user/forgot', data: {
      "mobile_number": GetStorage().read('mobile_number'),
      "password": tECNewPassword.text,
      "user_type": "User",
    }).whenComplete(() {
      loading = false;
      SnackbarHelper.success('Password Updated Successfully');
      Get.offAllNamed(login);
    });
    //Map<String, dynamic> res = response.data;
  }
}

final setNewPasswordStateProvider = ChangeNotifierProvider.autoDispose((r) {
  return SetNewPasswordState();
});
