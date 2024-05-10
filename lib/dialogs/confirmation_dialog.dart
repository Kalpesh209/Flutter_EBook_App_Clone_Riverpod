import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';

import '../adhelper.dart';
import '../utils.dart';

confirmationDialog(
  String title,
  String msg,
) {
  return Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.color72777A,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Yes'),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

thanksForSubscriptionDialog(int amount) {
  return Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '₹ $amount',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Thanks For Subscription',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Subscription plan is auto renewal until you cancel ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.color72777A,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Icon(
              Icons.add,
              size: 32,
              color: FPcolors.fpPrimary,
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Rs. 500 is Refundable deposits ,   you will receive back  subscription cancel  ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.colorBlack,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

notEnoughPointsDialog() {
  return Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Not enough',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "You don't have enough points get more points below",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.color72777A,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Buy points'),
              ),
            ),
            Text(
              'Or',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.colorBlack,
                fontSize: 16.sp,
              ),
            ).marginSymmetric(vertical: Get.height * 0.02),
            Text(
              'Watch ad to get 100 more points',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.colorBlack,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  //Add mob
                  //  loadRewardedAd(AdHelper.rewardedAdUnitIdForMyRewards);
                  // showAdmob();
                  Get.back(result: true);
                },
                child: const Text('Play ad'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

successDialog(
  String title,
  String msg,
  String buttonText,
  Function() onPressed,
) {
  return Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FPcolors.color72777A,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
