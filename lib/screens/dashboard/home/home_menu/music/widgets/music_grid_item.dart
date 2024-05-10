import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class MusicGridItem extends StatelessWidget {
  final String fromScreen;
  final BookDetailsModal album;
  final Function() onTap;

  const MusicGridItem({
    super.key,
    required this.fromScreen,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  height: Get.width / 2,
                  width: Get.width / 2,
                ),
              ),
              fromScreen == 'music'
                  ? SvgPicture.asset(Assets.icons.note)
                      .paddingAll(Get.width * 0.04)
                  : Container()
            ],
          ),
          SizedBox(height: Get.height * 0.005),
          Text(
            album.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text(
            album.subTitle ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
          ),
        ],
      ),
    );
  }
}
