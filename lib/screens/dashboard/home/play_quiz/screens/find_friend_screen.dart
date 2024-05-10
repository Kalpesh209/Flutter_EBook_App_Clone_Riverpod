import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

class FindFriendScreen extends ConsumerStatefulWidget {
  const FindFriendScreen({super.key});

  @override
  FindFriendScreenState createState() => FindFriendScreenState();
}

class FindFriendScreenState extends ConsumerState<FindFriendScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'find_friend_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.watch(selectBookDashboardProvider).getBookReadingChallenge();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'Find Friends',
            style: TextStyle(
              color: FPcolors.color212121,
              fontSize: 24,
              fontFamily: fontFamilyNunitoRegular,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: ShapeDecoration(
                color: FPcolors.colorF5F5F5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icSearch,
                    height: 16.h,
                    width: 16.w,
                    colorFilter:
                        ColorFilter.mode(FPcolors.colorBDBDBD, BlendMode.srcIn),
                  ).marginOnly(right: 12.w),
                  Expanded(
                    child: Text(
                      'Search email, name, or phone number',
                      style: TextStyle(
                        color: FPcolors.colorBDBDBD,
                        fontSize: 16.sp,
                        fontFamily: fontFamilyNunitoRegular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: FPcolors.colorWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  left: BorderSide(width: 1, color: FPcolors.colorE0E0E0),
                  top: BorderSide(width: 1, color: FPcolors.colorE0E0E0),
                  right: BorderSide(width: 1, color: FPcolors.colorE0E0E0),
                  bottom: BorderSide(width: 4, color: FPcolors.colorE0E0E0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icBook,
                        height: 60.h,
                        width: 60.w,
                      ).marginOnly(right: 20.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Search Contact',
                              style: TextStyle(
                                color: FPcolors.color212121,
                                fontSize: 20.sp,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'Find friends by phone number',
                              style: TextStyle(
                                color: FPcolors.color616161,
                                fontSize: 16.sp,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: FPcolors.colorEEEEEE,
                  ).marginSymmetric(vertical: 24.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icFeather,
                        height: 60.h,
                        width: 60.w,
                      ).marginOnly(right: 20.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Invite Friends',
                                style: TextStyle(
                                  color: FPcolors.color212121,
                                  fontSize: 20,
                                  fontFamily: fontFamilyNunitoRegular,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'Invite friends to play together',
                              style: TextStyle(
                                color: FPcolors.color616161,
                                fontSize: 16.sp,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'People you may know',
                  style: TextStyle(
                    color: FPcolors.color212121,
                    fontSize: 24.sp,
                    fontFamily: fontFamilyNunitoRegular,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                        colorFilter: ColorFilter.mode(
                            FPcolors.colorC74225, BlendMode.srcIn),
                        height: 14.w,
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 24.w),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                itemBuilder: (context, index) {
                  return itemView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemView() {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/60x60"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Maryland Winkles',
                      style: TextStyle(
                        color: FPcolors.color212121,
                        fontSize: 18.sp,
                        fontFamily: fontFamilyNunitoRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: ShapeDecoration(
                color: FPcolors.colorC74225,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'Challenge',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FPcolors.colorWhite,
                  fontSize: 14.sp,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ).marginOnly(bottom: 16.h);
  }
}
