import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

Widget headingViewAll(String heading) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        heading,
        style: TextStyle(
          color: FPcolors.color212121,
          fontSize: 24.sp,
          fontFamily: fontFamilyNunitoRegular,
          fontWeight: FontWeight.w700,
        ),
      ),
      InkWell(
        onTap: () => Get.toNamed(quizCategoriesScreen),
        child: Row(
          children: [
            Text(
              'View all',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: FPcolors.colorC74225,
                fontSize: 18.sp,
                fontFamily: fontFamilyNunitoRegular,
                fontWeight: FontWeight.w700,
              ),
            ).marginOnly(right: 12.w),
            SvgPicture.asset(
              Assets.icons.arrowRight2,
              colorFilter:
                  ColorFilter.mode(FPcolors.colorC74225, BlendMode.srcIn),
              height: 14.w,
              width: 16.w,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget itemView() {
  return Padding(
    padding: EdgeInsets.all(6.w),
    child: InkWell(
      onTap: () {
        Get.toNamed(quizDetailScreen);
      },
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 140,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 200,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/200x140"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 139,
                    top: 102,
                    child: Container(
                      width: 49,
                      height: 26,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: ShapeDecoration(
                        color: FPcolors.colorC74225,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Text(
                        '16 Qs',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontFamily: fontFamilyNunitoRegular,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Smarter with Productivity Quizz...',
                    style: TextStyle(
                      color: FPcolors.color212121,
                      fontSize: 18.sp,
                      fontFamily: fontFamilyNunitoRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/20x20"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      SizedBox(width: 8.h),
                      Text(
                        'Titus Kitamura',
                        style: TextStyle(
                          color: FPcolors.color424242,
                          fontSize: 10.sp,
                          fontFamily: fontFamilyNunitoRegular,
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ).marginOnly(right: 16.w);
}

Widget itemViewTopCollections() {
  return InkWell(
    onTap: () => Get.toNamed(collectionDetailsScreen),
    child: Container(
      width: 180,
      height: 120,
      margin: EdgeInsets.only(right: 16.w),
      decoration: ShapeDecoration(
        color: FPcolors.colorBDBDBD,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 180,
              height: 120,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/180x120"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 86,
            child: Text(
              'Education',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: fontFamilyNunitoRegular,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget itemViewCategory(
  String categoryName,
  Function() onViewAll,
) {
  return Column(
    children: [
      headingViewAll(categoryName).marginOnly(bottom: 16.h),
      itemView().marginOnly(bottom: 24.h),
    ],
  );
}
