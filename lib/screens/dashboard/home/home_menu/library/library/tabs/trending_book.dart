import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/models/trending_books_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart' as getx;

import '../widgets/library_book_card.dart';

class TrendingBooksState extends ChangeNotifier {
  String language = 'en';
  List<BookDetailsModal> books = [];

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  reset() {
    books = [];
  }

  load() async {
    // if (loading == true) return;
    reset();
    loading = true;
    var endpoint = 'library/user/get-trending-library-book?language=en';
    Response<dynamic> response =
        await dioService.get(endpoint).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    TrendingBooksResponse libraryBooksResponse =
        TrendingBooksResponse.fromJson(res);
    libraryBooksResponse.data!.trendingbook?.forEach((book) => books.add(book));
    notifyListeners();
  }
}

final trendingBooksProvider = ChangeNotifierProvider.autoDispose((r) {
  var state = TrendingBooksState();

  return state;
});

class TrendingBooksTab extends ConsumerStatefulWidget {
  const TrendingBooksTab({Key? key}) : super(key: key);

  @override
  TrendingBooksTabState createState() => TrendingBooksTabState();
}

class TrendingBooksTabState extends ConsumerState<TrendingBooksTab> {
  // const TrendingBooksTabState({Key? key}) : super(key: key);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(trendingBooksProvider).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(trendingBooksProvider);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(getx.Get.width * 0.04),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              var book = state.books[index];
              return LibraryBookCard(
                book,
                openDetails: () {
                  getx.Get.toNamed(libraryDetails,
                          parameters: {'book_id': book.id ?? ''})
                      ?.then((value) => state.load());
                },
              ).marginOnly(bottom: getx.Get.height * 0.02);
            },
            itemCount: state.books.length,
          ),
        ),
        if (state.loading)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: getx.Get.height * 0.01),
                const Text('loading...'),
              ],
            ),
          )
      ],
    );
  }
}
