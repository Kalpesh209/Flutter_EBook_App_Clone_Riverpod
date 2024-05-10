import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/widgets/e_book_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

// import '../../timer_service_provider.dart';

class ContinueReadingScreen extends ConsumerStatefulWidget {
  const ContinueReadingScreen(
      {Key? key, required this.books, required this.itemCount})
      : super(key: key);

  final List<BookDetailsModal?> books;
  final int itemCount;

  @override
  ContinueReadingScreenState createState() => ContinueReadingScreenState();
}

class ContinueReadingScreenState extends ConsumerState<ContinueReadingScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'open_books_screen');
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWithTopLogo(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('E-Books'),
          centerTitle: true,
          actions: [
            // InkWell(
            //   onTap: () {
            //     // state.getEbooksByLanguage();
            //   },
            //   child: Assets.icons.search.image(width: Get.width * 0.06),
            // ),
            SizedBox(
              width: Get.width * 0.04,
            )
          ],
        ),
        body: widget.books.isEmpty
            ? const Center(child: Text("No books Available"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: widget.itemCount,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.toNamed(eBookDetails, parameters: {
                                'book_id': widget.books[index]?.id ?? ''
                              });
                            },
                            child: index == widget.books.length - 1
                                ? Column(
                                    children: [
                                      EbookCard(book: widget.books[index]),
                                      SizedBox(
                                        height: Get.height * 0.1,
                                      ),
                                    ],
                                  )
                                : EbookCard(book: widget.books[index])),
                      ),
                    ),
                  ],
                ),
              ),
        // Column(
        //   children: widget.books
        //       .map(
        //         (e) => Column(
        //           children: [
        //             //ebooks
        //             InkWell(
        //                 onTap: () {
        //                   Get.to(() => EbookDetail(book: e));
        //                 },
        //                 child: EbookCard(book: e))
        //             //end ebooks
        //           ],
        //         ),
        //       )
        //       .toList(),
        // ),
      ),
    );
  }
}
