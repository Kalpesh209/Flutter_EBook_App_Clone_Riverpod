import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';

import '../../../../../gen/assets.gen.dart';

class TopSliderSlide extends StatelessWidget {
  final String image;
  final String title;

  const TopSliderSlide({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("image url $image");

    return Material(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  width: 1, //
                )),
            child: AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: image != "null"
                      ? Image.network(
                          color: FPcolors.colorWhite,
                          image,
                          width: 84.w,
                          height: 84.w,
                          fit: BoxFit.fill,
                        )
                      : SvgPicture.asset(Assets.settings.svg.emptyimage),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: FPcolors.fpPrimary,
              fontSize: 16,
              // fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
