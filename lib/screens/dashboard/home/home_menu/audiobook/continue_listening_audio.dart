import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/audio_book_slider.dart';
import 'package:get/get.dart';

class ContinueListeningAudioScreen extends ConsumerStatefulWidget {
  const ContinueListeningAudioScreen(
      {Key? key, required this.books, required this.itemCount})
      : super(key: key);

  final List<BookDetailsModal?> books;
  final int itemCount;

  @override
  ContinueReadingScreenState createState() => ContinueReadingScreenState();
}

class ContinueReadingScreenState
    extends ConsumerState<ContinueListeningAudioScreen> {
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
          title: const Text('Audio Books'),
          centerTitle: true,
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
                        itemBuilder: (context, index) => SizedBox(
                          height: 154.h,
                          child: AudiobookSlide(slide: widget.books[index]),
                        ).marginOnly(bottom: 16.h),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
