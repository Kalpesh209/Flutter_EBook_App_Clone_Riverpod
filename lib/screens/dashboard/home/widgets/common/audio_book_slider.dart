import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';

class AudiobookSlide extends StatelessWidget {
  final BookDetailsModal? slide;
  final bool invert;

  const AudiobookSlide({super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("book id: ${slide!.id}");
        Get.toNamed(audioDetails, parameters: {'book_id': slide?.id ?? ''});
      },
      child: Container(
        margin:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.03,
                  top: Get.width * 0.03,
                  bottom: Get.width * 0.03),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Get.width * 0.03),
                    child: AspectRatio(
                      aspectRatio: 14 / 19,
                      child: slide?.coverImage != null
                          ? Image.network(
                              slide?.coverImage ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SvgPicture.asset(
                                    Assets.settings.svg.emptyimage);
                              },
                            )
                          : SvgPicture.asset(Assets.settings.svg.emptyimage),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Image(
                        image: const AssetImage('assets/icons/audio_white.png'),
                        height: 25.h,
                        width: 25.w,
                      ))
                ],
              ),
            ),
            Container(
              width: 198.w,
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slide?.title == null
                        ? (slide?.bookTitle ?? '')
                        : slide?.title ?? '',
                    maxLines: 1,
                    style: AppStyles.titleStyle,
                  ),
                  Text(
                    slide?.authorName ?? '',
                    style: AppStyles.slideSubTitleStyle,
                    maxLines: 1,
                  ),
                  SizedBox(height: Get.width * 0.028),
                  RatingWidget(
                    rating: slide?.rating,
                    bookId: slide?.id,
                    provider: null,
                  ),
                  SizedBox(height: Get.width * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: TagWidget(
                          tag: slide?.bookTag == null || slide?.bookTag == ''
                              ? "Art"
                              : slide?.bookTag ?? '',
                        ),
                      ),
                      // if (slide.cornerIcon != null) slide.cornerIcon!
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
