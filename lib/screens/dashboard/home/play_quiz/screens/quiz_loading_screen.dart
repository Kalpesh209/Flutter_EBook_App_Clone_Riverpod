import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

class QuizLoadingScreen extends ConsumerStatefulWidget {
  const QuizLoadingScreen({super.key});

  @override
  QuizLoadingScreenState createState() => QuizLoadingScreenState();
}

class QuizLoadingScreenState extends ConsumerState<QuizLoadingScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'quiz_loading_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.watch(selectBookDashboardProvider).getBookReadingChallenge();
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.toNamed(quizQuestionsScreen);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.background.bgQuiz.keyName,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 60,
          child: Text(
            'Quizzo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontFamily: fontFamilyNunitoRegular,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite),
            Image.asset(
              Assets.icons.icQuizLoadingLogo.keyName,
              height: 140.w,
              width: 140.w,
            ),
            Text(
              'Loading...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontFamily: fontFamilyNunitoRegular,
                fontWeight: FontWeight.w700,
              ),
            ).marginSymmetric(vertical: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: LinearProgressIndicator(
                minHeight: 20.h,
                borderRadius: BorderRadius.circular(100),
                color: FPcolors.colorFFC107,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
