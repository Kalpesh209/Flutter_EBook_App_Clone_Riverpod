import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/screens/select_book_search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/services/setup_singleton_services.dart';
import '../../../../../globals.dart';
import '../modals/book_invitation_status.response.dart';

class InvitationsStatusScreen extends ChangeNotifier {
  List<BookDetailsModal> listOfBooks = [];

  List<int> listOfInt = [];

  List<InvitationsStatus> listOfInvitationsStatus = [];

  List<Color> listOfColor = [
    FPcolors.colorEEEEEE,
    FPcolors.colorFB9400,
    FPcolors.colorC74225,
    FPcolors.color8692A6
  ];
  bool isLibrarySelected = true;
  bool showBookSelectErr = false;
  String errMsg = '';
  bool isFilter = false;

  //Call
  String strFilter = "latest";
  String strPerPage = "10";
  String strPageNumber = "1";
  int intMainTab = 0;
  bool _isLoading = false;
  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  searchBook(int index) async {
    showBookSelectErr = false;
    List<BookDetailsModal> list = await Get.to(() => SelectBookSearchScreen(
          type: index == 1 ? 'Library' : 'Book',
        ));
    listOfBooks.addAll(list);
    Map<String, BookDetailsModal> myMap = {};
    for (var item in listOfBooks) {
      myMap[item.id ?? ''] = item;
    }
    var filteredList = myMap.values.toList();
    listOfBooks = filteredList;
    notifyListeners();
  }

  void onTabChange(int value) {
    intMainTab = value;
    if (value == 0) {
      onMyChallengeStatus(strPerPage, strPageNumber, strFilter);
    } else if (value == 1) {
      onFriendsChallengeStatus(strPerPage, strPageNumber, strFilter);
    }
    notifyListeners();
  }

  void onTabStatusChange(int value) {
    if (intMainTab == 0) {
      if (value == 0) {
        strFilter = "latest";
      } else if (value == 1) {
        strFilter = "accepted";
      } else if (value == 2) {
        strFilter = "rejected";
      }
      onMyChallengeStatus(strPerPage, strPageNumber, strFilter);
    } else {
      if (value == 0) {
        strFilter = "latest";
      } else if (value == 1) {
        strFilter = "accepted";
      } else if (value == 2) {
        strFilter = "rejected";
      }
      onFriendsChallengeStatus(strPerPage, strPageNumber, strFilter);
    }
    notifyListeners();
  }

  onTapFilter() {
    print('onTapFilter');
    isFilter = !isFilter;
    notifyListeners();
  }

  //Api calling
  Future<void> onMyChallengeStatus(
      String perPage, String pageNumber, String strFilter) async {
    try {
      loading = true;
      var response = await dioService.get(
        "book-reading-challenges/my-invitations",
        queryParameters: {
          'per_page': perPage,
          'page_number': pageNumber,
          'filter': strFilter,
        },
        options: Options(headers: {"Authorization": token}),
      );
      Map<String, dynamic> res = response.data;
      BookInvitationResponse bookResponse =
          BookInvitationResponse.fromJson(res);
      listOfInvitationsStatus = bookResponse.data?.invitations ?? [];

      loading = false;
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
        "book-reading-challenges/friends-invitations",
        queryParameters: {
          'per_page': perPage,
          'page_number': pageNumber,
          'filter': strFilter,
        },
        options: Options(headers: {"Authorization": token}),
      );
      Map<String, dynamic> res = response.data;
      BookInvitationResponse bookResponse =
          BookInvitationResponse.fromJson(res);
      listOfInvitationsStatus = bookResponse.data?.invitations ?? [];
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }
}

final invitationsStatusScreenProvider =
    ChangeNotifierProvider((ref) => InvitationsStatusScreen());
