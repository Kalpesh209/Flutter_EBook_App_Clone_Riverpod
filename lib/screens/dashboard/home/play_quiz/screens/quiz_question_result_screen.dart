import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:get/get.dart';

class QuizQuestionResultScreen extends ConsumerStatefulWidget {
  const QuizQuestionResultScreen({super.key});

  @override
  QuizQuestionResultScreenState createState() =>
      QuizQuestionResultScreenState();
}

class QuizQuestionResultScreenState
    extends ConsumerState<QuizQuestionResultScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'quiz_categories_screen');
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
        body: Column(
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
                      'Questions',
                      style: TextStyle(
                        color: FPcolors.color212121,
                        fontSize: 24,
                        fontFamily: fontFamilyNunitoRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        height: 105.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: FPcolors
                      .color12D18E, //Correct color12D18E Wrong colorF75555
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 105,
                      decoration: BoxDecoration(
                        color: FPcolors.colorBDBDBD,
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/140x105"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 - Quiz',
                              style: TextStyle(
                                color: FPcolors.color212121,
                                fontSize: 18,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w700,
                              ),
                            ).marginOnly(bottom: 8.h),
                            Text(
                              '....... do you get to school?\nby bus?',
                              style: TextStyle(
                                color: FPcolors.color424242,
                                fontSize: 16,
                                fontFamily: fontFamilyNunitoRegular,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).marginOnly(bottom: 16.h);
  }
}
