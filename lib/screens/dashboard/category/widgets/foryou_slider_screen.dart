import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../home/models/home_literarypicks_model.dart';

class ForYouSliderItem extends StatelessWidget {
  final HomeLiteraryPicks album;
  final int postion;
  final Function() onTap;

  const ForYouSliderItem({
    super.key,
    required this.album,
    required this.postion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                postion % 2 == 0
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                        child: FancyShimmerImage(
                          imageUrl: album.coverImage ?? '',
                          height: Get.width * 0.3,
                          width: Get.width * 0.6,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                        child: FancyShimmerImage(
                          imageUrl: album.coverImage ?? '',
                          height: Get.width * 0.3,
                          width: Get.width * 0.6,
                        ),
                      ),
              ],
            ),
          ],
        ).marginOnly(left: Get.width * 0.04, top: Get.width * 0.02),
      ),
    );
  }
}
