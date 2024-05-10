import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/continue_reading.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/e_book.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/providers/books_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/widgets/books_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/widgets/my_points_widget.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/home_section_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/sliders/e_book_slider.dart';
import 'package:get/get.dart';

class BooksScreen extends ConsumerStatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  BooksScreenState createState() => BooksScreenState();
}

class BooksScreenState extends ConsumerState<BooksScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance
        .logEvent(name: 'open_books_screen')
        .then((value) => null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(booksScreenProvider).getbooksByCategory();
      ref.read(booksScreenProvider).continueReading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(booksScreenProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(booksScreenProvider).getbooksByCategory();
        ref.read(booksScreenProvider).continueReading();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Books'),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen(
                      type: "Book",
                    );
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: Assets.icons.search.image(width: Get.width * 0.06),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const BookSlider(),
                // TopCarouselSlider(
                //   '',
                //   'EBook',
                //   (bookDetailsModal) => Get.to(
                //     () => EbookDetail(book: bookDetailsModal),
                //   ),
                // ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                const MyPointsWidget(1200),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                state.loading2
                    ? const Text("Loading...")
                    : state.continueReadingbooks.isNotEmpty
                        ? Column(
                            children: [
                              //ebooks
                              SizedBox(height: Get.height * 0.03),
                              HomeSectionTitle(
                                  showView: true,
                                  title: "Continue Reading",
                                  onTap: () {
                                    Get.to(
                                      () => ContinueReadingScreen(
                                          itemCount:
                                              state.continueReadingbooks.length,
                                          books: state.continueReadingbooks),
                                    );
                                  }),
                              SizedBox(height: Get.height * 0.01),
                              EbookSlider(
                                slides: state.continueReadingbooks.reversed
                                    .toList(),
                              ),
                              //end ebooks
                            ],
                          )
                        : const SizedBox(),
                state.loading
                    ? Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.03),
                        child: const CircularProgressIndicator(),
                      )
                    : state.categories.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.03),
                            child: const Text("No books to display"),
                          )
                        : Column(
                            children: state.categories
                                .map(
                                  (e) => Column(
                                    children: [
                                      //ebooks
                                      SizedBox(height: Get.height * 0.03),
                                      HomeSectionTitle(
                                          showView: true,
                                          title: e.categoryName!,
                                          onTap: () {
                                            debugPrint(
                                                "categoryid: ${e.categoryId}");
                                            Get.to(
                                                () => EbookScreen(category: e));
                                          }),
                                      SizedBox(height: Get.height * 0.01),
                                      EbookSlider(
                                        slides: e.books ?? [],
                                      ),
                                      //end ebooks
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
