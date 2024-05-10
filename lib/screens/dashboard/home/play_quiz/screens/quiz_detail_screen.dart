import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

class QuizDetailScreen extends ConsumerStatefulWidget {
  const QuizDetailScreen({super.key});

  @override
  QuizDetailScreenState createState() => QuizDetailScreenState();
}

class QuizDetailScreenState extends ConsumerState<QuizDetailScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'quiz_details_screen');
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
            icon: const Icon(Icons.close),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.icons.icStar),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.icons.icMore),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Container(
                width: double.maxFinite,
                height: 230.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/382x230"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Text(
                'Having Fun & Always Smile!',
                style: TextStyle(
                  color: FPcolors.color212121,
                  fontSize: 24.sp,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w700,
                ),
              ).marginSymmetric(vertical: 20.h),
              Divider(color: FPcolors.colorEEEEEE),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              '26',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: FPcolors.color212121,
                                fontSize: 20.sp,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Questions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color616161,
                              fontSize: 16.sp,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2.w,
                      height: 58.h,
                      color: FPcolors.colorEEEEEE,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '18.5K',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color212121,
                              fontSize: 20,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Played',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color616161,
                              fontSize: 16.sp,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2.w,
                      height: 58.h,
                      color: FPcolors.colorEEEEEE,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '925',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color212121,
                              fontSize: 20,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Favorited',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color616161,
                              fontSize: 16,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2.w,
                      height: 58.h,
                      color: FPcolors.colorEEEEEE,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '256',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color212121,
                              fontSize: 20.sp,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Shared',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color616161,
                              fontSize: 16,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: FPcolors.colorEEEEEE),
              Row(
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
                  ).marginOnly(right: 20.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daryl Nehls',
                          style: TextStyle(
                            color: FPcolors.color212121,
                            fontSize: 18.sp,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w700,
                          ),
                        ).marginOnly(bottom: 4.h),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '@daryl_nehls',
                            style: TextStyle(
                              color: FPcolors.color616161,
                              fontSize: 14.sp,
                              fontFamily: fontFamilyNunitoRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).marginSymmetric(vertical: 20.h),
              Text(
                'Description',
                style: TextStyle(
                  color: FPcolors.color212121,
                  fontSize: 20.sp,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w700,
                ),
              ).marginOnly(bottom: 12.h),
              Text(
                'Invite your friends to play quiz together!',
                style: TextStyle(
                  color: FPcolors.color424242,
                  fontSize: 18,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 118,
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 36,
          ),
          decoration: BoxDecoration(color: FPcolors.colorWhite),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Get.toNamed(quizLoadingScreen),
                  child: Container(
                    height: 58,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: FPcolors.colorF0EDFF,
                      borderRadius: BorderRadius.circular(100),
                      border: Border(
                        top: BorderSide(width: 0, color: FPcolors.colorFF725E),
                        bottom:
                            BorderSide(width: 5, color: FPcolors.colorFF725E),
                        left: BorderSide(color: FPcolors.colorFF725E),
                        right: BorderSide(color: FPcolors.colorFF725E),
                      ),
                    ),
                    child: Text(
                      'Play Solo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: FPcolors.colorC74225,
                        fontSize: 16.sp,
                        fontFamily: fontFamilyNunitoRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     height: 58,
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 16,
              //       vertical: 18,
              //     ),
              //     decoration: BoxDecoration(
              //       color: FPcolors.colorC74225,
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Expanded(
              //       child: Text(
              //         'Play with Friends',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 16.sp,
              //           fontFamily: fontFamilyNunitoRegular,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ).marginOnly(left: 16.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemView() {
    return InkWell(
      onTap: () {
        Get.toNamed(quizLoadingScreen);
      },
      child: Container(
        height: 111,
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 140,
                      height: 111,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          bottomLeft: Radius.circular(12.r),
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/140x111"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 79,
                    top: 73,
                    child: Container(
                      width: 50,
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
            Expanded(
              child: Container(
                height: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Get Smarter with Prod...',
                        style: TextStyle(
                          color: FPcolors.color212121,
                          fontSize: 18,
                          fontFamily: fontFamilyNunitoRegular,
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '2 months ago',
                          style: TextStyle(
                            color: FPcolors.color616161,
                            fontSize: 10,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '•',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: FPcolors.color616161,
                            fontSize: 10.sp,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '5.6K plays',
                          style: TextStyle(
                            color: FPcolors.color616161,
                            fontSize: 10,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        const SizedBox(width: 8),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Titus Kitamura',
                              style: TextStyle(
                                color: FPcolors.color424242,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
