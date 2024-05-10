import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/play_quiz_widgets.dart';
import 'package:get/get.dart';

class PlayQuizDashboard extends ConsumerStatefulWidget {
  const PlayQuizDashboard({super.key});

  @override
  PlayQuizDashboardState createState() => PlayQuizDashboardState();
}

class PlayQuizDashboardState extends ConsumerState<PlayQuizDashboard> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'play_quiz_dashboard');
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
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: SvgPicture.asset(
              Assets.icons.icQLogo,
            ),
          ),
          leadingWidth: 42.w,
          title: Text(
            'FreshPage',
            style: TextStyle(
              color: FPcolors.color212121,
              fontSize: 24,
              fontFamily: fontFamilyNunitoRegular,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.icons.icSearch,
                height: 28.w,
                width: 28.w,
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.icons.icNotification,
                height: 28.w,
                width: 28.w,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.images.imgQuizCard.keyName,
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(28.h),
                    margin: EdgeInsets.only(bottom: 24.h),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Play quiz together with your friends now!',
                          style: TextStyle(
                            color: FPcolors.colorWhite,
                            fontSize: 20.sp,
                            fontFamily: fontFamilyNunitoRegular,
                            fontWeight: FontWeight.w700,
                          ),
                        ).paddingOnly(right: 100.w),
                        SizedBox(height: 16.h),
                        InkWell(
                          onTap: () => Get.toNamed(findFriendsScreen),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 6.h),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              'Find Friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: FPcolors.colorC74225,
                                fontSize: 14.sp,
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
                ],
              ),
              headingViewAll('Discover').marginOnly(bottom: 16.h),
              Container(
                height: 260,
                margin: EdgeInsets.only(bottom: 24.h),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemView();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Collections',
                    style: TextStyle(
                      color: FPcolors.color212121,
                      fontSize: 24.sp,
                      fontFamily: fontFamilyNunitoRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(collectionListScreen),
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
              ).marginOnly(bottom: 16.h),
              Container(
                height: 120.h,
                margin: EdgeInsets.only(bottom: 24.h),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemViewTopCollections();
                  },
                ),
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return itemViewCategory(
                    'Trending Quiz',
                    () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
