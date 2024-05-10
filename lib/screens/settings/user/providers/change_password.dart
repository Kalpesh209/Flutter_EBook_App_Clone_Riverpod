import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

class ChangePasswordState extends ChangeNotifier {
  bool _loading = false;
  bool _passwordShow = true;
  bool _confiPasswordShow = true;
  get loading => _loading;
  get passwordShow => _passwordShow;
  get confirmPasswordShow => _confiPasswordShow;

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

  // TextEditingController _oldpassword = TextEditingController();
  TextEditingController _newpassword = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  // get oldpassword => _oldpassword;

  get newpassword1 => _newpassword;

  get confirmpassword => _confirmpassword;

  /* set oldpassword(status) {
    _oldpassword = oldpassword;

    notifyListeners();
  }*/

  set newpassword1(status) {
    _newpassword = newpassword1;

    notifyListeners();
  }

  set confirmpasword(status) {
    _confirmpassword = confirmpassword;

    notifyListeners();
  }

  postContactDetails() async {
    // populate devide info

    if (_confirmpassword.text != _newpassword.text) {
      SnackbarHelper.error('Password Not Matching');
      debugPrint("heee");
    } else {
      debugPrint("heee");
      loading = true;
      Response<dynamic> response = await dioService
          .put('/user/password-change',
              data: {
                // "category": _categoryController.text,
                // "old_password": _oldpassword.text,
                "new_password": _newpassword.text,
              },
              options: Options(headers: {
                "Authorization": globals.token,
              }))
          .whenComplete(() => loading = false);
      Map<String, dynamic> res = response.data;
      SnackbarHelper.success(res["message"]);

      return "success";
    }

    notifyListeners();
  }
}

final changepasswordstate = ChangeNotifierProvider.autoDispose((r) {
  return ChangePasswordState();
});
