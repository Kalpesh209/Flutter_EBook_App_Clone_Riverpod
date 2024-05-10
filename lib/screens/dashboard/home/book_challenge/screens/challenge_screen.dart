import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/providers/chanllenge_provider.dart';
import 'package:get/get.dart';

class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  @override
  ChallengeScreenState createState() => ChallengeScreenState();
}

class ChallengeScreenState extends ConsumerState<ChallengeScreen>
    with SingleTickerProviderStateMixin {
  dynamic argumentData = Get.arguments;

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_challenge_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (argumentData != null) {
        String myPoints = argumentData['my_points'];
        debugPrint('myPoints $myPoints');
        ref.watch(challengeProvider).setPoints(myPoints);
        ref.watch(challengeProvider).listOfBooks =
            argumentData['list_of_books'];
        ref.watch(challengeProvider).setDays();
      }
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(challengeProvider);

    return Stack(
      children: [
        Positioned.fill(child: Container(color: FPcolors.fpPrimaryLight1)),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.background.bgTopCorner.keyName,
            width: Get.width / 1.6,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Challenge'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FPcolors.colorWhite,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 24.w,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                                height: 72.h,
                                width: 72.h,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'William',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'VS',
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: FPcolors.fpPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: state.onSelectUser,
                          child: Column(
                            children: [
                              state.isContactSelected
                                  ? Column(
                                      children: [
                                        state.selectedContact.photo != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.memory(
                                                  state.selectedContact.photo!,
                                                  height: 72,
                                                  width: 72,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      color:
                                                          FPcolors.colorEEEEEE,
                                                      height: 50,
                                                      width: 50,
                                                    );
                                                  },
                                                ),
                                              )
                                            : Container(
                                                height: 72,
                                                width: 72,
                                                decoration: BoxDecoration(
                                                  color: FPcolors.colorC9C9C9,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                        SizedBox(height: 24.h),
                                        Text(
                                          state.selectedContact.displayName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          height: 72,
                                          width: 72,
                                          decoration: BoxDecoration(
                                            color: FPcolors.colorC9C9C9,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: FPcolors.colorWhite,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 24.h),
                                        Text(
                                          'Select Friend',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                              state.isContactSelected
                                  ? Container()
                                  : Text(
                                      '*Please Select Friend ',
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: FPcolors.fpPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(bottom: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.icCoinSmall),
                    Text(
                      'Make bet',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ).marginSymmetric(horizontal: 8.w),
                    SvgPicture.asset(Assets.icons.icEditUnderscore),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.icCoinSmall),
                    Text(
                      '${state.selectedPoints.toInt()}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ).marginSymmetric(horizontal: 8.w),
                    Expanded(child: Container()),
                    SvgPicture.asset(Assets.icons.icCoinSmall),
                    Text(
                      '${state.maxPoints}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ).marginSymmetric(horizontal: 8.w),
                  ],
                ).marginSymmetric(horizontal: 16.w),
                Slider(
                  value: state.selectedPoints.toDouble(),
                  min: state.minPoints.toDouble(),
                  max: state.maxPoints.toDouble(),
                  thumbColor: FPcolors.fpPrimary,
                  activeColor: FPcolors.fpPrimary,
                  inactiveColor: FPcolors.colorEEEEEE,
                  onChanged: state.onChanged,
                ).paddingZero,
                SizedBox(
                  height: 200.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: Get.width * 0.8,
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
                                    onPressed: state.onTapInvite,
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
                      ).marginSymmetric(horizontal: 16.w),
                      Container(
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          color: FPcolors.colorWhite,
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
                              onPressed: state.onTapWatchNow,
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
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: FPcolors.colorWhite,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: FPcolors.colorD8D5D5,
                            width: 1.w,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Point',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ).marginOnly(bottom: 12),
                            Text(
                              '${state.selectedPoints.toInt()}',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: FPcolors.colorWhite,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: FPcolors.colorD8D5D5,
                            width: 1.w,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Days',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ).marginOnly(bottom: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: state.onDecreaseDays,
                                  child:
                                      SvgPicture.asset(Assets.icons.icRemove),
                                ),
                                Text(
                                  '${state.daysValue}',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: state.onIncreaseDays,
                                  child: SvgPicture.asset(Assets.icons.icAdd),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).marginSymmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
              ],
            ),
          ),
          bottomNavigationBar: FilledButton(
            onPressed: state.onStart,
            child: const Text('Start'),
          ).marginSymmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
        )
      ],
    );
  }
}
