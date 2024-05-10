import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/literarypicks/providers/litterarypicks_slider_provider.dart';
import 'package:get/get.dart';

import '../../../../config/route/route_names.dart';
import '../../home/models/book_details_modal.dart';
import '../../home/models/home_literarypicks_model.dart';
import '../../home/providers/top_slider_provider.dart';
import 'ebookhistorysliderprovider.dart';

class EbookHistoryPicks extends StatelessWidget {
  final List<HomeLiteraryPicks?> slides;

  // const ExploreCategories({Key? key}) : super(key: key);
  const EbookHistoryPicks({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    String chapterId;
    bool containsChapterId = false;
    String bookId;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          slides.length,
          (index) => SizedBox(
            height: 200.h,
            width: 120.w,
            child: InkWell(
              onTap: () {
                debugPrint(
                    "Last chapter id ${slides[index]?.lastReadChapterId}");

                if (slides[index]!.lastReadChapterId == null) {
                  Get.toNamed(chapterReadDirect, parameters: {
                    'book_id': slides[index]!.id.toString(),
                    'chapterId': slides[index]!.lastReadChapterId.toString(),
                    'bookName': slides[index]!.bookTitle.toString()
                  });
                } else {
                  Get.toNamed(eBookDetails, parameters: {
                    'book_id': slides[index]?.id ?? '',
                    'chapterId': slides[index]?.lastReadChapterId ?? ''
                  });
                }
              },
              child: EbookHistoryliderProvider(
                image: slides[index]!.coverImage.toString(),
                title: slides[index]!.bookTitle.toString(),
                id: slides[index]!.id.toString(),
                chapter: slides[index]!.chapter,
                flagRent: "true",
                lastReadChapterId: slides[index]!.lastReadChapterId.toString(),
              ).paddingOnly(left: Get.width * 0.01),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
