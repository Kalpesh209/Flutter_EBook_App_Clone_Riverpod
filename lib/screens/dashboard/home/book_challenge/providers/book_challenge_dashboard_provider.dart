import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/modals/book_challenge_dashboard_response.dart';
import 'package:get/get.dart';

import '../../../../../dialogs/confirmation_dialog.dart';
import '../../../../../globals.dart';
import '../modals/book_accept_response.dart';

class BookChallengeDashboardScreenState extends ChangeNotifier {
  MainUser? user = MainUser();
  List<Invitations> listOfInvitations = [];
  List<AcceptedChallengesStatus> listOfAcceptedChallenges = [];
  bool _isLoading = false;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  /* void onTabAcceptOrReject(String value, String invitationId) {
    print(invitationId);
    notifyListeners();
  }*/

  void onTabMoreChallenge() {
    print("onTabMoreChallenge");
    Get.toNamed(challengeStatusScreen);
    notifyListeners();
  }

  void onTabSeeMore() {
    print("onTabSeeMore");
    Get.toNamed(invitationsStatusScreen);
    notifyListeners();
  }

  //Api calling
  void getBookReadingChallenge() async {
    debugPrint('Api-getBookReadingChallenge');
    loading = true;
    authService.getToken().then((token) async {
      try {
        dio.Response<dynamic> response = await dioService
            .get("book-reading-challenges/dashboard",
                options: dio.Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);
        Map<String, dynamic> res = response.data;
        BookChallengeDashboardResponse bookChallengeResponse =
            BookChallengeDashboardResponse.fromJson(res);

        user = bookChallengeResponse.data?.user;
        listOfInvitations = bookChallengeResponse.data?.invitations ?? [];
        listOfAcceptedChallenges =
            bookChallengeResponse.data?.acceptedChallengesStatus ?? [];
      } on dio.DioException catch (e) {
        debugPrint('${e.response!.statusCode}');
      }
    });
  }

  //Accept and reject
  Future<void> onTapAcceptOrReject(
      String accOrReject, String invitationId) async {
    try {
      loading = true;
      String postUrl = "";
      var requestData = {
        "invitation_id": invitationId,
      };
      if (accOrReject == "Accept") {
        postUrl = "book-reading-challenges/invitations/accept";
      } else if (accOrReject == "Reject") {
        postUrl = "book-reading-challenges/invitations/reject";
      }
      var response = await dioService.get(
        postUrl,
        queryParameters: {
          'invitation_id': invitationId,
        },
        options: Options(headers: {"Authorization": token}),
      );
      debugPrint('request data : $requestData');
      Map<String, dynamic> res = response.data;
      BookAcceptDashboardResponse acceptResponse =
          BookAcceptDashboardResponse.fromJson(res);
      if (acceptResponse.success ?? false) {
        successDialog('Success', acceptResponse.message ?? '', 'OK', () {
          print(requestData);
          loading = false;
          Get.back();
          getBookReadingChallenge();
        });
      } else {
        loading = false;
        /* successDialog('Success', challengeResponse.message ?? '', 'Invite',
                  () {
                getx.Get.close(3);
                getx.Get.toNamed(inviteScreen);
              });*/
      }
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  String outOffBooks(List<ChallengeBooks>? bookCount) {
    int count = 0;
    for (var books in bookCount!) {
      if (books.orderStatus == "pending") {
        //count += 1;
      } else {
        count += 1;
      }
    }
    return "${count.toString()} / ${bookCount.length} Book";
  }

  String outOffBooksForSlider(List<ChallengeBooks>? bookCount) {
    int count = 0;
    for (var books in bookCount!) {
      if (books.orderStatus == "pending") {
        //count += 1;
      } else {
        count += 1;
      }
    }
    return count.toString();
  }

  String timeAgo(String? fromDate, {bool numericDates = true}) {
    if (fromDate != null) {
      try {
        final date1 = DateTime.parse(fromDate);
        final date2 = DateTime.now();
        final difference = date1.difference(date2);
        return "${difference.inDays} days left";
      } catch (e) {
        debugPrint('Exception in Utility $e');
        return '';
      }
    } else {
      return '';
    }
  }

  printNew() {
    int j = 0;
    for (int i = 0; i < 10; i++) {
      j++;
      if (i > 2) {
        if (j == 4) {
          j = 1;
        }
      }
      print("J ki value:- $j");
    }
  }

  generateSequence() {
    int count = 0;
    int getNextNumber() {
      count = (count % 3) + 1;
      return count;
    }

    return getNextNumber;
  }
}

final selectBookDashboardProvider =
    ChangeNotifierProvider((ref) => BookChallengeDashboardScreenState());
