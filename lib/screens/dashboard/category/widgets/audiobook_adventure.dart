import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../home/models/home_literarypicks_model.dart';

class AudioBookAdventureItem extends StatelessWidget {
  final HomeLiteraryPicks album;
  final Function() onTap;

  const AudioBookAdventureItem({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width * 0.4,
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
                Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 40.r,
                )
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: Get.width * 0.4,
              child: Text(
                album.bookTitle ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              album.contentType ?? '',
              style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
            ),
            SizedBox(height: Get.height * 0.005),
            Container(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: FPcolors.fpPrimary),
                ),
                child: Text(
                  'Play Now',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      color: FPcolors.fpPrimary,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ).marginOnly(left: Get.width * 0.04),
      ),
    );
  }
}
