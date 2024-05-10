import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/square_slide_model.dart';
import 'package:get/get.dart';

class SquareImgSlide extends StatelessWidget {
  final SquareSlideModel slide;

  const SquareImgSlide({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
              ),
              child: Image.network(slide.image),
            ),
            slide.icon,
          ],
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          slide.title,
          maxLines: 1,
          style: AppStyles.titleStyle,
        ),
        Text(
          slide.subTitle,
          style: AppStyles.slideSubTitleStyle,
        ),
      ],
    );
  }
}
