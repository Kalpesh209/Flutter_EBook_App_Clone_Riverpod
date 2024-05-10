import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/widgets/e_book_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/models/booksCategory/books_category_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/common/all_books_category_wise_book_provider.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class EbookScreen extends ConsumerStatefulWidget {
  const EbookScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  EbookScreenState createState() => EbookScreenState();
}

class EbookScreenState extends ConsumerState<EbookScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'open_books_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(allBooksCategoryWiseProvider).setbooksEmpty();
      ref.watch(allBooksCategoryWiseProvider).setPageNo();
      ref
          .watch(allBooksCategoryWiseProvider)
          .setId(widget.category.categoryId ?? '');
      ref.watch(allBooksCategoryWiseProvider).getBooks();
    });
  }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(allBooksCategoryWiseProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.watch(allBooksCategoryWiseProvider).setbooksEmpty();
        ref.watch(allBooksCategoryWiseProvider).setPageNo();
        ref
            .watch(allBooksCategoryWiseProvider)
            .setId(widget.category.categoryId ?? '');
        ref.watch(allBooksCategoryWiseProvider).getBooks();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.category.categoryName ?? ''),
            centerTitle: true,
          ),
          body: state.loading
              ? loadingCenter()
              : state.books.isEmpty
                  ? const Center(child: Text("No books Available"))
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height,
                                child: LoadMore(
                                  textBuilder: (_) {
                                    return "";
                                  },
                                  isFinish: state.books.length == state.count,
                                  onLoadMore: () async {
                                    debugPrint("onLoadMore");
                                    await Future.delayed(
                                      const Duration(
                                          seconds: 0, milliseconds: 100),
                                    );
                                    state.getBooks();
                                    return true;
                                  },
                                  child: ListView.builder(
                                    controller: controller,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.books.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        //ebooks
                                        InkWell(
                                            onTap: () {
                                              Get.toNamed(eBookDetails,
                                                  parameters: {
                                                    'book_id':
                                                        state.books[index].id ??
                                                            ''
                                                  });
                                            },
                                            child: index ==
                                                    state.books.length - 1
                                                ? Column(
                                                    children: [
                                                      EbookCard(
                                                          book: state
                                                              .books[index]),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.1,
                                                      ),
                                                    ],
                                                  )
                                                : EbookCard(
                                                    book: state.books[index]))
                                        //end ebooks
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: state.loadMore ? loadingCenter() : Container(),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
