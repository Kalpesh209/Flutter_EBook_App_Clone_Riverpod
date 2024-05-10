import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import '../../../../../config/colors/colors.dart';
import '../../../../../config/services/setup_singleton_services.dart';
import '../../../../../globals.dart';
import '../modals/book_challenges_status_response.dart';

class ChallengeDetailsStatusScreen extends ChangeNotifier {
  List<BookDetailsModal> listOfBooks = [];

  List<StatusInvitations> listOfInvitationsStatus = [];
  List<int> listOfInt = [];
  List<Color> listOfColor = [
    FPcolors.colorFB9400,
    FPcolors.colorC74225,
    FPcolors.color8692A6
  ];
  bool isLibrarySelected = true;
  bool showBookSelectErr = false;
  String errMsg = '';
  bool isFilter = false;
  bool _isLoading = false;

  //Call
  String strFilter = "latest";
  String strPerPage = "10";
  String strPageNumber = "1";
  int intMainTab = 0;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  Future<void> onMyChallengeStatus(
      String perPage, String pageNumber, String strFilter) async {
    try {
      loading = true;
      var response = await dioService.get(
        "book-reading-challenges/my-challenges",
        queryParameters: {
          'per_page': perPage,
          'page_number': pageNumber,
          'filter': strFilter,
        },
        options: Options(headers: {"Authorization": token}),
      );

      Map<String, dynamic> res = response.data;
      BookChallengesResponse bookResponse =
          BookChallengesResponse.fromJson(res);
      listOfInvitationsStatus = bookResponse.data?.invitations ?? [];
      loading = false;
      if (bookResponse.success ?? false) {
      } else {
        loading = false;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  Future<void> onFriendsChallengeStatus(
      String perPage, String pageNumber, String strFilter) async {
    try {
      loading = true;
      var response = await dioService.get(
        "book-reading-challenges/friends-challenges",
        queryParameters: {
          'per_page': perPage,
          'page_number': pageNumber,
          'filter': strFilter,
        },
        options: Options(headers: {"Authorization": token}),
      );
      Map<String, dynamic> res = response.data;
      BookChallengesResponse bookResponse =
          BookChallengesResponse.fromJson(res);
      listOfInvitationsStatus = bookResponse.data?.invitations ?? [];
      loading = false;
      if (bookResponse.success ?? false) {
      } else {
        loading = false;
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
}

final challengeDetailsScreenProvider =
    ChangeNotifierProvider((ref) => ChallengeDetailsStatusScreen());
