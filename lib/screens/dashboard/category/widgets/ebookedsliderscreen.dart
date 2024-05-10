import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../home/models/home_literarypicks_model.dart';

class EBookedscreenSlide extends StatelessWidget {
  final HomeLiteraryPicks? slide;
  final bool invert;

  const EBookedscreenSlide(
      {super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("book id: ${slide!.id}");
        // Get.toNamed(audioDetails, parameters: {'book_id': slide?.id ?? ''});

        Get.toNamed(eBookDetails,
            parameters: {'book_id': slide!.id.toString()});

        /*   if (slide?.chapter != 0) {
          Get.toNamed(eBookDetails,
              parameters: {
                'book_id':
                slide!.id.toString()
              });
        } else {
          Get.toNamed(bookDetails, parameters: {
            'book_id':
            slide!.id.toString()
          });
        }*/
      },
      child: Container(
        margin:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: FPcolors.greyBorder),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.00,
                  top: Get.width * 0.00,
                  bottom: Get.width * 0.00),
              child: Stack(
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(Get.width * 0.03),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.width * 0.03),
                      bottomLeft: Radius.circular(Get.width * 0.03),
                    ),
                    child: AspectRatio(
                      aspectRatio: 14 / 19,
                      child: slide?.coverImage != null
                          ? Image.network(slide?.coverImage ?? '',
                              height: 100, width: 80, fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                              return SvgPicture.asset(
                                Assets.settings.svg.emptyimage,
                                height: 100,
                                width: 80,
                              );
                            })
                          : SvgPicture.asset(
                              Assets.settings.svg.emptyimage,
                              height: 100,
                              width: 80,
                            ),
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
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'By : ${slide?.authorName}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: 'DM Sans',
                        color: FPcolors.color6C7072,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: Get.width * 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingWidget(
                        rating: slide?.rating,
                        bookId: slide?.id,
                        provider: null,
                      ),
                      // if (slide.cornerIcon != null) slide.cornerIcon!
                    ],
                  ),
                  SizedBox(height: Get.width * 0.02),
                  SizedBox(
                    // width: 70.w,
                    child: TagWidget(
                      tag: slide?.bookTag,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
