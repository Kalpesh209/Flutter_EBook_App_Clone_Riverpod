import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/continue_listening_audio.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/providers/audiobooks_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/audiobook_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/audiobook_slider_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/my_points_widget.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/home_section_title.dart';
import 'package:get/get.dart';

import 'audio_book_viewcat.dart';

class AudioBookScreen extends ConsumerStatefulWidget {
  const AudioBookScreen({Key? key}) : super(key: key);

  @override
  AudioBookScreenState createState() => AudioBookScreenState();
}

class AudioBookScreenState extends ConsumerState<AudioBookScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance
        .logEvent(name: 'open_Audiobooks_screen')
        .then((value) => null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(audiobooksScreenProvider).getBooksByCategory();
      ref.read(audiobooksScreenProvider).continueReading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(audiobooksScreenProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(audiobooksScreenProvider).getBooksByCategory();
        ref.read(audiobooksScreenProvider).continueReading();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Audio Books'),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen(
                      type: "Audio",
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
                const ABookSlider(),
                // TopCarouselSlider(
                //   '',
                //   'Audio',
                //       (bookDetailsModal) {
                //     Get.to(() => AudiobookDetail(book: bookDetailsModal));
                //   },
                // ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                const MyPointsWidget(1000),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                state.loading2
                    ? const Text("Loading...")
                    : state.continueReadingBooks.isNotEmpty
                        ? Column(
                            children: [
                              //audiobooks
                              SizedBox(height: Get.height * 0.03),
                              HomeSectionTitle(
                                  showView: true,
                                  title: "Continue Listening",
                                  onTap: () {
                                    Get.to(
                                      () => ContinueListeningAudioScreen(
                                          books: state.continueReadingBooks,
                                          itemCount: state
                                              .continueReadingBooks.length),
                                    );
                                  }),
                              SizedBox(height: Get.height * 0.01),
                              AudiobookSliderList(
                                slides: state.continueReadingBooks.reversed
                                    .toList(),
                                itemCount: state.continueReadingBooks.length,
                              ),
                              //end audiobooks
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
                                      //audiobooks
                                      SizedBox(height: Get.height * 0.03),
                                      HomeSectionTitle(
                                          showView: true,
                                          title: e.categoryName,
                                          onTap: () {
                                            debugPrint(
                                                "categoryid: ${e.categoryId}");
                                            Get.to(
                                              () => AudiobookViewScreen(
                                                  category: e),
                                            );
                                          }),
                                      SizedBox(height: Get.height * 0.02),
                                      AudiobookSliderList(
                                        slides: e.books,
                                        itemCount: e.books.length,
                                      ),
                                      //end books
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
