import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InvitationScreenState extends ChangeNotifier {
  bool _loading = false;
  get loading => _loading;
  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List aa = [];
  FormGroup invitationForm = FormGroup({
    'mobile_number': FormControl(validators: [Validators.required]),
    'verification_code': FormControl(validators: [Validators.required])
  });

  checkCode() async {
    invitationForm
        .patchValue({'mobile_number': authService.user?.mobileNumber});

    if (invitationForm.invalid) {
      invitationForm.markAllAsTouched();
      throw InvalidFormException();
    }
    loading = true;
    Response<dynamic> response = await dioService
        .post('user/verification-code', data: invitationForm.value)
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    aa.add(res['data']['waitlist']);
    return res;
  }
}

final invitationScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  return InvitationScreenState();
});
