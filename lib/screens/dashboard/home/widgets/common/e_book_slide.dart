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

class EbookSlide extends StatelessWidget {
  final BookDetailsModal? slide;
  final bool invert;

  const EbookSlide({super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("book id: ${slide!.id}");
        Get.toNamed(eBookDetails, parameters: {'book_id': slide?.id ?? ''});
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
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
                Image(
                  image: const AssetImage('assets/icons/book_white.png'),
                  height: 40.h,
                  width: 40.w,
                )
              ],
            ),
            Container(
              width: 192.w,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slide?.bookTitle ?? '',
                    maxLines: 1,
                    style: AppStyles.titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    slide?.authorName ?? '',
                    style: AppStyles.slideSubTitleStyle,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10.h),
                  RatingWidget(
                    rating: slide?.rating,
                    bookId: slide?.id,
                    provider: null,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: TagWidget(
                          tag: slide?.bookTag == null || slide?.bookTag == ''
                              ? "Art"
                              : slide?.bookTag ?? '',
                        ),
                      ),
                      // Image.asset(
                      //   Assets.icons.audio.keyName,
                      //   height: 28.h,
                      //   color: Colors.black,
                      // )
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
