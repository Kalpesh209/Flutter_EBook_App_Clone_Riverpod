import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';

class SelectContactState extends ChangeNotifier {
  List<Contact> listOfContacts = [];
  List<Contact> listOfContactsSearch = [];
  bool isLoading = false;

  onInit() async {
    if (await FlutterContacts.requestPermission(readonly: true)) {
      listOfContacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      debugPrint('listOfContacts.length ${listOfContacts.length}');
      listOfContactsSearch = List.of(listOfContacts);
      notifyListeners();
    } else {
      debugPrint('Not have permission');
      confirmationDialog();
    }
  }

  void onChanged(String value) {
    debugPrint('listOfContacts.length ${listOfContacts.length}');
    listOfContactsSearch = [];
    if (value.isEmpty) {
      listOfContactsSearch = List.of(listOfContacts);
      debugPrint('listOfContactsSearch.length ${listOfContactsSearch.length}');
      notifyListeners();
      return;
    }

    for (var userDetail in listOfContacts) {
      if (userDetail.displayName.toLowerCase().contains(value.toLowerCase())) {
        listOfContactsSearch.add(userDetail);
      }
    }
    debugPrint('listOfContactsSearch.length ${listOfContactsSearch.length}');
    notifyListeners();
  }

  void onCloseSearch() {
    debugPrint('onCloseSearch');
    listOfContactsSearch = [];
    listOfContactsSearch = List.of(listOfContacts);
    debugPrint('listOfContactsSearch.length ${listOfContacts.length}');
    notifyListeners();
  }

  confirmationDialog() {
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(Get.width * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Syncing Contacts',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Please allow access to get contact for challenge.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FPcolors.color72777A,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    await FlutterContacts.requestPermission(readonly: true);
                    Get.back(result: true);
                  },
                  child: const Text('Allow'),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final selectContactProvider =
    ChangeNotifierProvider((ref) => SelectContactState());
