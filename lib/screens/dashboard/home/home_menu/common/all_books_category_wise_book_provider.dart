import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/common/all_books_categories_wise_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class AllBooksCategoryWiseState extends ChangeNotifier {
  List<BookDetailsModal> books = [];
  String _categoryId = "";

  get id => _categoryId;

  set id(val) {
    _categoryId = val;
    notifyListeners();
  }

  void setbooksEmpty() {
    books.clear();
  }

  int pageNo = 0;

  void setPageNo() {
    pageNo = 0;
  }

  int _count = 0;

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool loadMore = false;

  get count => _count;

  set count(val) {
    _count = val;
    notifyListeners();
  }

  void setId(String idd) {
    id = idd;
  }

  void getBooks() async {
    debugPrint('getBooks');
    debugPrint('category_id $id');
    pageNo++;
    if (pageNo == 1) {
      loading = true;
    } else {
      loadMore = true;
    }
    try {
      Response<dynamic> response = await dioService
          .get('bookuser/user/get-all-book-category-wise',
              queryParameters: {
                'category_id': id,
                'language': "en",
                'per_page': "10",
                'page_number': pageNo,
              },
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {
        loading = false;
        loadMore = false;
      });
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      AllBooksCategoryWiseResponse ebookResponse =
          AllBooksCategoryWiseResponse.fromJson(res);
      count = ebookResponse.data!.allCount;
      books.addAll(ebookResponse.data!.book!);
      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }
}

final allBooksCategoryWiseProvider = ChangeNotifierProvider((r) {
  return AllBooksCategoryWiseState();
});
