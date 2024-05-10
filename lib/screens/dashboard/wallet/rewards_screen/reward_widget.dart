import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

Widget inviteView() {
  return Container(
    height: 200,
    width: Get.width,
    decoration: BoxDecoration(
      color: FPcolors.colorWhite,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: FPcolors.colorD8D5D5,
        width: 1.w,
      ),
    ),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 0,
          child: Image.asset(
            Assets.images.imgInvite.keyName,
            height: 266.h,
            width: Get.width * 0.5,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  'Invite your 10 friends',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Get 500 points',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ).marginSymmetric(vertical: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: FPcolors.fpPrimary,
                ),
                onPressed: () {},
                child: Text(
                  'Invite',
                  style: TextStyle(
                    color: FPcolors.colorWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ).marginSymmetric(
    horizontal: 16.w,
    vertical: 8.h,
  );
}

Widget earnMorePoints() {
  return Container(
    height: 170,
    width: Get.width,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment(0, 1),
        end: Alignment(0, 0.4),
        colors: [
          Colors.white,
          colorFFE3DC,
        ],
      ),
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: FPcolors.colorD8D5D5,
        width: 1.w,
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 16.h,
      horizontal: 16.w,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earn more points',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '50 points',
              style: TextStyle(
                fontSize: 26.sp,
                color: FPcolors.fpPrimary,
                fontWeight: FontWeight.w700,
              ),
            ).marginSymmetric(vertical: 20),
            SizedBox(height: 20.h),
            Text(
              'Watch ad to earn 10 points',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: FPcolors.fpPrimary,
          ),
          onPressed: () {},
          child: Text(
            'Watch now',
            style: TextStyle(
              color: FPcolors.colorWhite,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  ).marginSymmetric(
    horizontal: 16.w,
    vertical: 8.h,
  );
}
