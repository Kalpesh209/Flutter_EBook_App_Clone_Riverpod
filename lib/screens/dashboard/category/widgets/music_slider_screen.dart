import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../home/models/home_literarypicks_model.dart';

class MusicSliderItem extends StatelessWidget {
  final HomeLiteraryPicks album;
  final String title1;
  final Function() onTap;

  const MusicSliderItem({
    super.key,
    required this.album,
    required this.title1,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                  child: FancyShimmerImage(
                    imageUrl: album.coverImage ?? '',
                    height: Get.width * 0.3,
                    width: Get.width * 0.3,
                  ),
                ),
                /* title1 == 'Continue Reading' ? SizedBox(height: Get.height * 0.01):
                Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 32.r,
                ).paddingAll(Get.width * 0.02)*/
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: Get.width * 0.3,
              child: Text(
                album.bookTitle ?? '',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            Text(
              album.authorName ?? '',
              style: TextStyle(
                  fontSize: 12, fontFamily: '', color: FPcolors.fpgreyText),
              maxLines: 1,
            ),
          ],
        ).marginOnly(left: Get.width * 0.04),
      ),
    );
  }
}
