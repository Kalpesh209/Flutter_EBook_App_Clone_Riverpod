import 'dart:math' as math;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/providers/chapter_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/thanks_book_reading.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/widgets/step_progress.dart';
import 'package:get/get.dart';

import '../../config/route/route_names.dart';

class BookChapter extends ConsumerStatefulWidget {
  const BookChapter(
      {Key? key,
      required this.chapters,
      required this.ref,
      required this.bookId,
      required this.index,
      required this.bookName})
      : super(key: key);

  final List<Chapter> chapters;
  final int index;
  final String bookName;
  final String bookId;
  final WidgetRef ref;

  @override
  BookChapterState createState() => BookChapterState();
}

class BookChapterState extends ConsumerState<BookChapter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(chapterProvider)
          .setCurrentChapter(widget.chapters[widget.index], widget.bookId);
      ref.read(chapterProvider).setIndex(widget.index);
      ref.read(chapterProvider).addBookId(widget.bookId);

      FirebaseAnalytics.instance
          .logEvent(name: 'open_book_chapter', parameters: {
        'book_id': widget.bookId,
        'chapter_id': widget.index,
      }).then((n) => debugPrint('Book_chapter'));
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(chapterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.bookName),
        /*actions: [
          InkWell(
            onTap: () {},
            child: Assets.icons.moreVertical
                .image(width: Get.width * 0.06)
                .paddingAll(Get.width * 0.03),
          )
        ],*/
      ),
      body: SingleChildScrollView(
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
                  borderRadius: BorderRadius.circular(Get.width * 0.03),
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
              Html(data: state.currentChapter.chapterContent)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StepProgress(
            value: (state.currentIndex + 1) / 10,
            minVal: 0.1,
            maxVal: (widget.chapters.length) / 10,
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
                                widget.chapters[newIndex], widget.bookId);
                            FirebaseAnalytics.instance.logEvent(
                                name: 'open_book_chapter',
                                parameters: {
                                  'book_id': widget.bookId,
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
                    if (state.currentIndex < widget.chapters.length - 1) {
                      int newIndex = state.currentIndex + 1;
                      state.setIndex(newIndex);
                      state.setCurrentChapter(
                          widget.chapters[newIndex], widget.bookId);
                      FirebaseAnalytics.instance
                          .logEvent(name: 'open_book_chapter', parameters: {
                        'book_id': widget.bookId,
                        'chapter_id': newIndex,
                      }).then((n) => null);
                    } else {
                      // Get.to(() => const ThankYouScreen(),);
                      Get.toNamed(thankYouScreen,
                          parameters: {'bookName': widget.bookName.toString()});
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
