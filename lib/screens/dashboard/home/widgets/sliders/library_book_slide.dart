import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class LibraryBookSlide extends StatelessWidget {
  final BookDetailsModal slide;
  final bool invert;

  const LibraryBookSlide({super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("Book sds id: ${slide.id} ");
        debugPrint("Book About: ${slide.about} ");
        //Get.to(() => LibraryBook(slide));
        Get.toNamed(libraryDetails, parameters: {'book_id': slide.id ?? ''});
      },
      child: Container(
        margin: EdgeInsets.only(left: 8.w, right: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              width: 192.w,
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slide.title ?? '',
                    maxLines: 1,
                    style: AppStyles.titleStyle,
                  ),
                  Text(
                    slide.authorName ?? '',
                    style: AppStyles.slideSubTitleStyle,
                    maxLines: 1,
                  ),
                  SizedBox(height: Get.width * 0.09),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TagWidget(
                          tag: slide.bookTag == null || slide.bookTag == ""
                              ? "Art"
                              : slide.bookTag ?? ''),
                      RatingWidget(
                        rating: slide.rating,
                        bookId: slide.id,
                        provider: null,
                      ),
                    ],
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Get.width * 0.04),
                bottomRight: Radius.circular(Get.width * 0.04),
              ),
              child: AspectRatio(
                aspectRatio: 14 / 19,
                child: Image.network(
                  slide.coverImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text("No Image");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
