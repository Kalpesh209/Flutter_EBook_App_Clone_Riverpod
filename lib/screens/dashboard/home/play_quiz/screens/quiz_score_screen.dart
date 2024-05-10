import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

class QuizScoreScreen extends ConsumerStatefulWidget {
  const QuizScoreScreen({super.key});

  @override
  QuizScoreScreenState createState() => QuizScoreScreenState();
}

class QuizScoreScreenState extends ConsumerState<QuizScoreScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'quiz_score_screen');
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
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.background.bgQuiz.keyName,
            fit: BoxFit.fitWidth,
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: FPcolors.colorWhite,
                ),
              ),
              title: Text(
                'Scoreboard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(width: double.maxFinite),
                Divider(
                  color: FPcolors.colorEB996E,
                ).paddingSymmetric(horizontal: 16.w),
                Container(
                  height: 84,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: FPcolors.colorWhite),
                  child: itemView(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    itemBuilder: (context, index) {
                      return itemView().marginSymmetric(vertical: 12.h);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget itemView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 32,
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: FPcolors.color212121,
              fontSize: 20.sp,
              fontFamily: fontFamilyNunitoRegular,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://via.placeholder.com/60x60"),
              fit: BoxFit.fill,
            ),
            shape: OvalBorder(),
          ),
        ).marginOnly(right: 20.w),
        Expanded(
          child: Text(
            'Andrew',
            style: TextStyle(
              color: FPcolors.color212121,
              fontSize: 20.sp,
              fontFamily: fontFamilyNunitoRegular,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          '945',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: FPcolors.color212121,
            fontSize: 20,
            fontFamily: fontFamilyNunitoRegular,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
