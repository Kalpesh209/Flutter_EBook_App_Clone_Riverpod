import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/models/library_books_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/widgets/library_book_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart' as getx;
import 'package:loadmore/loadmore.dart';

class AllBooksTabState extends ChangeNotifier {
  int currentPage = 0;
  String language = 'en';
  int perPage = 10;
  List<BookDetailsModal> books = [];

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  reset() {
    books.clear();
    currentPage = 0;
  }

  int count = 0;

  load() async {
    print("Prev length: ${books.length}");
    currentPage++;
    print(currentPage);
    var endpoint =
        'library/user/get-all-library-book?language=en&&per_page=10&&page_number=$currentPage';
    Response<dynamic> response =
        await dioService.get(endpoint).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    LibraryBooksResponse libraryBooksResponse =
        LibraryBooksResponse.fromJson(res);
    // libraryBooksResponse.data!.book?.forEach((book) => books.add(book));
    count = libraryBooksResponse.data!.allCount!;
    if (books.length < count) {
      books.addAll(libraryBooksResponse.data!.book!);
    }
    notifyListeners();
  }
}

final allBooksTabProvider = ChangeNotifierProvider.autoDispose((r) {
  var state = AllBooksTabState();

  return state;
});

class AllBooksTab extends ConsumerStatefulWidget {
  const AllBooksTab({Key? key}) : super(key: key);

  @override
  AllBooksTabStatee createState() => AllBooksTabStatee();
}

class AllBooksTabStatee extends ConsumerState<AllBooksTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(allBooksTabProvider).reset();
      ref.watch(allBooksTabProvider).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(allBooksTabProvider);

    return Padding(
      padding: EdgeInsets.all(getx.Get.width * 0.04),
      child: LoadMore(
        textBuilder: (_) {
          return "";
        },
        isFinish: state.books.length == state.count,
        onLoadMore: () async {
          debugPrint("onLoadMore");
          await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
          state.load();
          return true;
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            var book = state.books[index];
            return LibraryBookCard(
              book,
              openDetails: () {
                getx.Get.toNamed(libraryDetails,
                        parameters: {'book_id': book.id ?? ''})
                    ?.then((value) => state.reset());
              },
            ).marginOnly(bottom: getx.Get.height * 0.02);
          },
          itemCount: state.books.length,
        ),
      ),
    );
  }
}
