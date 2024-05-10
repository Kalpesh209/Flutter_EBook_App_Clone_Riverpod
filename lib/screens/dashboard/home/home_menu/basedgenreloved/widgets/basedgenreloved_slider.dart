import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../../../config/size/size.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../models/home_literarypicks_model.dart';
import '../../../providers/home_new_provider.dart';

class BaseGenrelovedSlide extends ConsumerWidget {
  final HomeLiteraryPicks? slide;
  final bool invert;

  const BaseGenrelovedSlide(
      {super.key, required this.slide, this.invert = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        debugPrint("book id: ${slide!.id}");

        if (slide?.isAudioBook == true) {
          Get.toNamed(audioDetails, parameters: {'book_id': slide?.id ?? ''});
        } else {
          if (slide!.bookUsage == "EBOOK_ONLY") {
            Get.toNamed(eBookDetails,
                parameters: {'book_id': slide?.id.toString() ?? ''});
          } else {
            Get.toNamed(bookDetails,
                parameters: {'book_id': slide?.id.toString() ?? ''});
          }
        }
      },
      child: Container(
        margin:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(color: FPcolors.color6C7072),
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
                          ? FancyShimmerImage(
                              imageUrl: slide?.coverImage ?? '',
                              height: Get.width * 0.33,
                              width: Get.width * 0.4,
                            )
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      slide!.bookTitle.toString(),
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
                        width: 80.w,
                        child: slide?.contentType != null
                            ? TagWidget(
                                tag: slide?.contentType.toString(),
                              )
                            : SizedBox(height: Get.width * 0.01),
                      ),
                      RatingWidget(
                        bookId: slide?.id,
                        rating: slide!.rating,
                        provider: null,
                      ),
                      // if (slide.cornerIcon != null) slide.cornerIcon!
                    ],
                  ),
                  SizedBox(height: Get.width * 0.01),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    SizedBox(
                        width: 140.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*OutlinedButton(
                              onPressed: () async {},
                              child: const Text('Rent'),
                            ),*/
                            slide!.isRead == false
                                ? OutlinedButton(
                                    onPressed: () async {
                                      ref
                                          .watch(homeProviderNew)
                                          .addToCart(slide?.id.toString());
                                      ref
                                          .watch(homeProviderNew)
                                          .addRemoveFromSelect(
                                              slide?.id.toString());

                                      slide!.isRead = true;
                                    },
                                    child: const Text('Rent'),
                                  )
                                : OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: FPcolors.fpPrimary,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: FPcolors.fpPrimary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    onPressed: () async {
                                      ref
                                          .watch(homeProviderNew)
                                          .removeFromCart(slide?.id.toString());
                                      ref
                                          .watch(homeProviderNew)
                                          .addRemoveFromSelect(
                                              slide?.id.toString());
                                      slide!.isRead = false;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Rent",
                                            style: TextStyle(
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w500,
                                                color: FPcolors.colorWhite,
                                                fontSize: 12)),
                                        defaultSpacerHorizontalSmall,
                                        SvgPicture.asset(
                                            Assets.settings.svg.iconSelected),
                                      ],
                                    ),
                                  ),
                          ],
                        ))
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
