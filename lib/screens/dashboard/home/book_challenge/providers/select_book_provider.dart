import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/screens/select_book_search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class SelectBookScreenState extends ChangeNotifier {
  List<BookDetailsModal> listOfBooks = [];
  bool isLibrarySelected = true;
  bool showBookSelectErr = false;
  String errMsg = '';

  searchBook(int index) async {
    showBookSelectErr = false;
    List<BookDetailsModal> list = await Get.to(() => SelectBookSearchScreen(
          type: index == 0 ? 'Library' : 'Book',
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

  removeFromList(BookDetailsModal removedBook) {
    listOfBooks.remove(removedBook);
    notifyListeners();
  }

  void onTabChange(int value) {
    listOfBooks = [];
    isLibrarySelected = value == 0;
    notifyListeners();
  }

  void onNext(String? myPoints) {
    if (listOfBooks.isEmpty) {
      showBookSelectErr = true;
      errMsg = '*Please select books';
    } else if (listOfBooks.length > 1 && !isLibrarySelected) {
      showBookSelectErr = true;
      errMsg = '*You have select more than 1 books';
    } else if (listOfBooks.length > 10 && isLibrarySelected) {
      showBookSelectErr = true;
      errMsg = '*You have select more than 10 books';
    } else {
      Get.toNamed(challengeScreen, arguments: {
        'my_points': myPoints,
        'list_of_books': listOfBooks,
      });
    }
    notifyListeners();
  }
}

final selectBookScreenProvider =
    ChangeNotifierProvider((ref) => SelectBookScreenState());
