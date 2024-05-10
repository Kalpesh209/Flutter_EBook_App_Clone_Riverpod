import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/dialogs/confirmation_dialog.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import 'package:get/get.dart' as getx;

import 'package:image_picker/image_picker.dart';

import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;

import '../../../dashboard/home/home_menu/library/checkout/models/address_response/address.dart';
import '../../../dashboard/home/home_menu/library/checkout/models/address_response/address_response.dart';

class EditUser extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  String? imageurl;
  String? profileimage;

  late bool notification;
  late bool app_notification;

  XFile? image;
  TextEditingController _lastname = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();

  get lastname => _lastname;

  get firstname => _firstname;

  get phoneNumber => _phoneNumber;

  get email => _email;

  set lastname(status) {
    _lastname = lastname;

    notifyListeners();
  }

  set email(status) {
    _email = email;

    notifyListeners();
  }

  set firstname(status) {
    _firstname = firstname;

    notifyListeners();
  }

  set phoneNumber(status) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  postImageUrl() async {
    // populate devide info
    final file = await MultipartFile.fromFile(
      image!.path,
      filename: image!.name,
    );
    debugPrint("File path : $file");
    final body = FormData.fromMap({"file": file});
    Response<dynamic> response =
        await dioService.post('/general/auth/file-and-image-upload',
            data: body,
            options: Options(headers: {
              "Authorization": globals.token,
            }));
    Map<String, dynamic> res = response.data;
    imageurl = res["display_url"];
    notifyListeners();
  }

  getContactDetail() async {
    debugPrint('getContactDetail');
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
    _firstname.text = res['data']['first_name'];
    lastname = res['data']['last_name'];
    _lastname.text = res['data']['last_name'];

    phoneNumber = res['data']['mobile_number'];
    _phoneNumber.text = res['data']['mobile_number'];

    email = res['data']['email'];
    _email.text = res['data']['email'];

    profileimage = res['data']['profile_image'];
    notification = res['data']['notification'];
    app_notification = res['data']['app_notification'];

    debugPrint(profileimage);
    // twitterlink = res['data']['twitter_url'];
    notifyListeners();
  }

  postEditUserData(MenuScreenState state) async {
    loading = true;
    if (image == null) {
    } else {
      await postImageUrl();
    }

    Response<dynamic> response = await dioService.put('/user/profile-update',
        data: {
          'profile_image': imageurl ?? (state.profileimage ?? "empty"),
          'first_name':
              _firstname.text == '' ? state.firstname : _firstname.text,
          'last_name': _lastname.text == '' ? state.lastname : _lastname.text,
          'email': _email.text == '' ? state.email : _email.text,
          // 'email': _email.text == '' ? state.email : _email.text,
        },
        options: Options(headers: {
          "Authorization": globals.token,
        }));

    loading = false;
    Map<String, dynamic> res = response.data;
    if (res['success']) {
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error(res["message"]);
    }

    notifyListeners();
  }

  deleteUser() async {
    // populate devide info
    /* var confirm = await confirmationDialog('Delete Account',
        'If you delete your account, you will lose your subscription, your total rewards, and all data. You will no longer be eligible to claim anything in the future.');
    if (confirm != true) return;
*/

    var confirm = await confirmationDialog(
        'Delete Account', 'Are you sure you want to delete account?');
    if (confirm != true) return;

    loading = true;
    Response<dynamic> response = await dioService
        .delete('/user/delete',
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res sucessfully  $res');
    if (res["success"]) {
      // SnackbarHelper.success("Account Deleted");
      SnackbarHelper.success(res["message"]);
      getx.Get.offAndToNamed(login);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }

  deactiviteUser() async {
    // populate devide info
    /* var confirm = await confirmationDialog('Delete Account',
        'If you delete your account, you will lose your subscription, your total rewards, and all data. You will no longer be eligible to claim anything in the future.');
    if (confirm != true) return;
*/

    var confirm = await confirmationDialog(
        'Delete Account', 'Are you sure you want to deactivate account?');
    if (confirm != true) return;

    loading = true;
    Response<dynamic> response = await dioService
        .delete('user/deactive',
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success("Account Deactivate");
      getx.Get.offAndToNamed(login);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }

  Address? selectedAddress;
  List<Address> addresses = [];

  load(String? type) async {
    addresses = [];
    notifyListeners();
    loading = true;
    Response<dynamic> response = await dioService
        .get('address/user/get-address-list?type=${type.toString()}')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    AddressResponse addressResponse = AddressResponse.fromJson(res);
    addresses = addressResponse.data!.address ?? [];

    notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }

  removeFromAddress(String? id, String type) async {
    loading = true;
    //dio.Response<dynamic> response =

    Response<dynamic> response = await dioService.delete(
      'address/user/delete-address/${id.toString()}',
      data: {'book_id': id},
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success("Address Delete Successfully");
    } else {
      SnackbarHelper.error("Try Again");
    }
    load(type);
  }
}

final edituserstate = ChangeNotifierProvider.autoDispose((r) {
  return EditUser();
});
