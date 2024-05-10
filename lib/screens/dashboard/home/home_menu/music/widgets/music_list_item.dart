import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class MusicListItem extends StatelessWidget {
  final BookDetailsModal album;
  final Function() onTap;

  const MusicListItem({
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
                    imageUrl: album.image ?? '',
                    height: Get.width * 0.4,
                    width: Get.width * 0.4,
                  ),
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 32.r,
                ).paddingAll(Get.width * 0.02)
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: Get.width * 0.4,
              child: Text(
                album.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              album.category ?? '',
              style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
            ),
          ],
        ).marginOnly(left: Get.width * 0.04),
      ),
    );
  }
}
