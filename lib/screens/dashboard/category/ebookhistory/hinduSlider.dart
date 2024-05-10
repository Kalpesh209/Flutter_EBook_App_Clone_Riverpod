import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../home/models/home_literarypicks_model.dart';

class HinduLibrarySlide extends StatelessWidget {
  final HomeLiteraryPicks? slide;
  final bool invert;

  const HinduLibrarySlide(
      {super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("book id: ${slide!.id}");
        Get.toNamed(eBookDetails, parameters: {'book_id': slide?.id ?? ''});

        /* if(slide?.isAudioBook != null) {
          Get.toNamed(audioDetails, parameters: {'book_id': slide?.id ?? ''});
        }else{
          if(slide?.chapter != 0) {
            Get.toNamed(eBookDetails, parameters: {
              'book_id': slide?.id ?? ''
            });
          }else{
            Get.toNamed(bookDetails, parameters: {
              'book_id': slide?.id ?? ''
            });
          }
        }*/
      },
      child: Container(
        margin:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: FPcolors.color6C7072),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                          ? FancyShimmerImage(
                              imageUrl: slide?.coverImage ?? '',
                            )
                          /* Image.network(
                        slide?.coverImage ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(Assets.settings.svg.emptyimage);
                        },
                      )*/
                          : SvgPicture.asset(Assets.settings.svg.emptyimage),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.w),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 1.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      slide?.bookTitle ?? '',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        fontFamily: 'DM Sans',
                        color: FPcolors.colorBlack,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      slide?.authorName ?? '',
                      style: AppStyles.slideSubTitleStyle,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: Get.width * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: TagWidget(
                          tag: slide?.contentType ?? '',
                        ),
                      ),
                      RatingWidget(
                        rating: slide?.rating,
                        bookId: slide?.id,
                        provider: null,
                      ),
                      // if (slide.cornerIcon != null) slide.cornerIcon!
                    ],
                  ),
                  SizedBox(height: Get.width * 0.01),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
