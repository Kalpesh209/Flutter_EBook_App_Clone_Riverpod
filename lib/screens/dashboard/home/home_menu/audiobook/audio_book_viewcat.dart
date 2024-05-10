import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/fonts/fonts.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/models/audioooksCategory/audiobooks_category_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/providers/audiobooks_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/audio_book_card.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class AudiobookViewScreen extends ConsumerStatefulWidget {
  const AudiobookViewScreen({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  AudiobookViewScreenState createState() => AudiobookViewScreenState();
}

class AudiobookViewScreenState extends ConsumerState<AudiobookViewScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'open_books_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(audiobooksScreenProvider).setBooksEmpty();
      ref.watch(audiobooksScreenProvider).setPageNo();
      ref.watch(audiobooksScreenProvider).setId(widget.category.categoryId);
      ref.watch(audiobooksScreenProvider).getBooks();
    });
  }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(audiobooksScreenProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.watch(audiobooksScreenProvider).setBooksEmpty();
        ref.watch(audiobooksScreenProvider).setPageNo();
        ref.watch(audiobooksScreenProvider).setId(widget.category.categoryId);
        ref.watch(audiobooksScreenProvider).getBooks();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.category.categoryName),
            centerTitle: true,
          ),
          body: state.loading
              ? Center(
                  child: Text(
                    "Loading...",
                    style: FPfonts.body16Primary.copyWith(color: Colors.black),
                  ),
                )
              : state.books.isEmpty
                  ? const Center(child: Text("No books Available"))
                  : SingleChildScrollView(
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
                                await Future.delayed(const Duration(
                                    seconds: 0, milliseconds: 100));
                                state.getBooks();
                                return true;
                              },
                              child: ListView.builder(
                                controller: controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: state.books.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      //ebooks
                                      InkWell(
                                          onTap: () {
                                            Get.toNamed(audioDetails,
                                                parameters: {
                                                  'book_id':
                                                      state.books[index].id ??
                                                          ''
                                                });
                                          },
                                          child: index == state.books.length - 1
                                              ? Column(
                                                  children: [
                                                    AudiobookCard(
                                                        book:
                                                            state.books[index]),
                                                    SizedBox(
                                                      height: Get.height * 0.1,
                                                    ),
                                                  ],
                                                )
                                              : AudiobookCard(
                                                  book: state.books[index]))
                                      //end ebooks
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
