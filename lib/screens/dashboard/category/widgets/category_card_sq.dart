import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';

class CategoryCardSquare extends StatelessWidget {
  final String title;
  final String image;
  final Function? onTap;
  const CategoryCardSquare(
      {Key? key, required this.title, required this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Get.width * 0.04),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shadowColor: Colors.grey.shade300.withOpacity(0.4),
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: Container(
          padding: EdgeInsets.all(Get.width * 0.08),
          child: Column(children: [
            Image.asset(
              image,
              width: title == "E-Book" ? Get.width * 0.18 : Get.width * 0.13,
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  color: FPcolors.color6D6D71,
                ),
            )
          ]),
        ),
      ),
    );
  }
}
