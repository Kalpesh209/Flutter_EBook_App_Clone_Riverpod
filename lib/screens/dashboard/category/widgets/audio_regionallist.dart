import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../home/models/home_literarypicks_model.dart';

class AudioRegionalItem extends StatelessWidget {
  final HomeLiteraryPicks album;
  final Function() onTap;

  const AudioRegionalItem({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: FPcolors.colorD9D9D9,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 120.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Get.height * 0.01),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Get.width * 0.0),
                    child: FancyShimmerImage(
                      imageUrl: album.coverImage ?? '',
                      height: 102,
                      width: 77,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Stack(alignment: Alignment.bottomRight, children: [
                SizedBox(
                  width: Get.width * 0.4,
                  height: 40,
                  child: Text(
                    album.bookTitle ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30.r,
                  )
                ])
              ])
            ],
          ).marginOnly(left: Get.width * 0.04),
        ),
      ),
    );
  }
}
