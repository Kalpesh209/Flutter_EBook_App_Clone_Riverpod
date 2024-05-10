import 'dart:io' show Platform;

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/dialogs/confirmation_dialog.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/modals/create_challenge_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart' as getx;

class ChallengeScreenState extends ChangeNotifier {
  int maxPoints = 0;
  int minPoints = 0;
  double selectedPoints = 0;

  int daysValue = 5;
  int maxDaysValue = 5;
  int minDaysValue = 3;
  List<BookDetailsModal> listOfBooks = [];
  String? myPoints = '';

  bool isContactSelected = false;
  Contact selectedContact = Contact();
  bool loading = false;

  void setPoints(String? myPoints) {
    maxPoints = int.parse(myPoints ?? '0');
    minPoints = maxPoints > 10 ? 10 : 0;
    selectedPoints = maxPoints > 10 ? 10 : 0;
    notifyListeners();
  }

  void setDays() {
    daysValue = listOfBooks.length * 5;
    //minDaysValue = listOfBooks.length * 3;
    minDaysValue = listOfBooks.length * 5;
    maxDaysValue = listOfBooks.length * 5;
  }

  Future<void> onSelectUser() async {
    debugPrint('onSelectUser');
    var hasValue = await getx.Get.toNamed(selectContactScreen);
    if (hasValue != null) {
      selectedContact = hasValue;
      isContactSelected = true;
      notifyListeners();
    }
  }

  String convertUSPhoneNumberToIndian(String usPhoneNumber) {
    String digitsOnly = usPhoneNumber.replaceAll(RegExp(r'\D'), '');
    String indianPhoneNumber = digitsOnly.substring(0);
    return indianPhoneNumber;
  }

  void onChanged(double value) {
    selectedPoints = value;
    notifyListeners();
  }

  void onDecreaseDays() {
    debugPrint('onDecreaseDays $daysValue $minDaysValue');
    if (daysValue == 5) return;

    daysValue -= 5;
    // if (daysValue < minDaysValue) {
    //   daysValue = minDaysValue;
    // }

    notifyListeners();
  }

  void onIncreaseDays() async {
    debugPrint('onIncreaseDays $maxDaysValue');
    if (daysValue == maxDaysValue) return;
    daysValue += 5;
    // if (daysValue == minDaysValue) {
    //   daysValue = 5 * listOfBooks.length ;
    // } else {
    //   daysValue += 5;
    // }

    notifyListeners();
  }

  Future<void> onStart() async {
    debugPrint('onStart');
    debugPrint('listOfBooks.length ${listOfBooks.length}');

    if (maxPoints > 0) {
      var booksIds = [];
      for (var book in listOfBooks) {
        booksIds.add({"id": book.id});
      }

      try {
        if (isContactSelected && selectedContact.phones.isNotEmpty) {
          loading = true;
          String indianPhoneNumber = "";
          if (Platform.isIOS) {
            indianPhoneNumber =
                convertUSPhoneNumberToIndian(selectedContact.phones[0].number);
          } else {
            indianPhoneNumber = selectedContact.phones[0].toString();
          }
          var requestData = {
            "mobile": indianPhoneNumber,
            "challenge_days": daysValue.toString(),
            "point_value": selectedPoints.round().toString(),
            "books": booksIds,
          };
          //book-reading-challenges/create     challenges/user/challenges
          debugPrint('request data : $requestData');
          dio.Response<dynamic> response = await dioService
              .post('book-reading-challenges/create', data: requestData)
              .whenComplete(() => loading = false);

          Map<String, dynamic> res = response.data;
          CreateChallengeResponse challengeResponse =
              CreateChallengeResponse.fromJson(res);
          if (challengeResponse.data?.applicationUser ?? false) {
            successDialog('Success', challengeResponse.message ?? '', 'OK',
                () => getx.Get.close(3));
          } else {
            successDialog('Success', challengeResponse.message ?? '', 'Invite',
                () {
              getx.Get.close(3);
              getx.Get.toNamed(inviteScreen);
            });
          }
          notifyListeners();
        }
      } catch (e) {
        debugPrint('e $e');
      }
    } else {
      successDialog(
          'Error', "You don't have sufficient points to create challenge", 'OK',
          () {
        getx.Get.back();
      });
    }
  }

  Future<void> onTapInvite() async {
    var confirm = await confirmationDialog(
        'Invite', 'Est aliquam tristique magnis iaculis ');
    if (confirm) {
      getx.Get.toNamed(inviteScreen);
    }
  }

  Future<void> onTapWatchNow() async {
    var confirm = await notEnoughPointsDialog();
  }
}

final challengeProvider =
    ChangeNotifierProvider((ref) => ChallengeScreenState());
