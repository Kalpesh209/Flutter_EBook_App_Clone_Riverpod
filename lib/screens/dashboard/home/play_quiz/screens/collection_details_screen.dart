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

class CollectionDetailsScreen extends ConsumerStatefulWidget {
  const CollectionDetailsScreen({super.key});

  @override
  CollectionDetailsScreenState createState() => CollectionDetailsScreenState();
}

class CollectionDetailsScreenState
    extends ConsumerState<CollectionDetailsScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'collection_list_screen');
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Education',
                        style: TextStyle(
                          color: FPcolors.color212121,
                          fontSize: 24,
                          fontFamily: fontFamilyNunitoRegular,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.icons.icSearch,
                          height: 28.w,
                          width: 28.w,
                        ),
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                ],
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '245 Quizzo',
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
                          'Default',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: FPcolors.colorC74225,
                            fontSize: 18.sp,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w700,
                          ),
                        ).marginOnly(right: 12.w),
                        SvgPicture.asset(
                          Assets.icons.icSort,
                          colorFilter: ColorFilter.mode(
                              FPcolors.colorC74225, BlendMode.srcIn),
                          height: 14.w,
                          width: 16.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ).marginSymmetric(vertical: 24.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(
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
