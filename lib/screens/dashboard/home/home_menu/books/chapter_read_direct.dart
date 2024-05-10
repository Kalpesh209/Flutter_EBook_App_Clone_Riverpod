import 'dart:math' as math;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/route/route_names.dart';
import '../../../../Books/providers/chapter_screen_provider.dart';
import '../../../../Onboarding/steps/widgets/step_progress.dart';

class ChapterReadDirect extends ConsumerStatefulWidget {
  const ChapterReadDirect({Key? key}) : super(key: key);

  @override
  ChapterReadDirectState createState() => ChapterReadDirectState();
}

class ChapterReadDirectState extends ConsumerState<ChapterReadDirect> {
  String chapterId = Get.parameters['chapterId'] ?? '';
  String bookId = Get.parameters['book_id'] ?? '';
  String bookName = Get.parameters['bookName'] ?? '';

  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    debugPrint('book_id :$bookId');
    debugPrint('ChapterId :$chapterId');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chapterProvider).getChaptersById(bookId, chapterId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(chapterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(bookName),
        /*actions: [
          InkWell(
            onTap: () {},
            child: Assets.icons.moreVertical
                .image(width: Get.width * 0.06)
                .paddingAll(Get.width * 0.03),
          )
        ],*/
      ),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : state.chapters.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Get.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0${state.currentIndex + 1}',
                              style: const TextStyle(
                                color: Color(0xff707070),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Chapter ${state.currentIndex + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: themeColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.03),
                            child: Image.network(
                              '${state.currentChapter.coverImage}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(child: Text("No Image"));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        //  Text(
                        //   ,
                        //   style:const TextStyle(
                        //     height: 1.6,
                        //     fontSize: 16,
                        //     color: Color(0xff6C7072),
                        //   ),
                        // )
                        Center(
                          child: state.currentChapter.chapterContent.isNull
                              ? const Text(
                                  'No data found') // Load HTML content if not empty
                              : Html(data: state.currentChapter.chapterContent),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StepProgress(
            value: (state.currentIndex + 1) / 10,
            minVal: 0.1,
            maxVal: (state.chapters.length) / 10,
          ),
          Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                state.currentIndex == 0
                    ? const SizedBox(
                        width: 10,
                      )
                    : InkWell(
                        onTap: () {
                          if (state.currentIndex > 0) {
                            int newIndex = state.currentIndex - 1;
                            state.setIndex(newIndex);
                            state.setCurrentChapter(
                                state.chapters[newIndex], bookId);
                            FirebaseAnalytics.instance.logEvent(
                                name: 'open_book_chapter',
                                parameters: {
                                  'book_id': bookId,
                                  'chapter_id': newIndex,
                                }).then((n) => null);
                          }
                        },
                        child: Transform.rotate(
                          angle: math.pi * 45,
                          child: Assets.icons.arrowRight
                              .image(width: Get.width * 0.08),
                        ),
                      ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '0${state.currentIndex + 1}',
                      style: const TextStyle(
                          color: Color(0xff707070), fontSize: 12),
                    ),
                    Text(
                      'Chapter ${state.currentIndex + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (state.currentIndex < state.chapters.length - 1) {
                      int newIndex = state.currentIndex + 1;
                      state.setIndex(newIndex);
                      state.setCurrentChapter(state.chapters[newIndex], bookId);
                      FirebaseAnalytics.instance
                          .logEvent(name: 'open_book_chapter', parameters: {
                        'book_id': bookId,
                        'chapter_id': newIndex,
                      }).then((n) => null);
                    } else {
                      // Get.to(() => const ThankYouScreen(),);
                      Get.toNamed(thankYouScreen,
                          parameters: {'bookName': bookName.toString()});
                      //Get.offAllNamed(thankYouScreen,parameters: {'bookName': bookName.toString()});
                    }
                  },
                  child: Transform.rotate(
                    angle: math.pi * 90,
                    child:
                        Assets.icons.arrowRight.image(width: Get.width * 0.08),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
