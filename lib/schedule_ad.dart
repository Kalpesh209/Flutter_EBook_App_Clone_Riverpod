import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/interstitial_ad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleAd {
  Future<bool> isFirstLaunchOfTheDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String lastLaunchDate = prefs.getString('last_launch_date') ?? '';
    // print("lastLaunchDate: $lastLaunchDate");
    // print("NowLaunchDate: ${now.toString().substring(0, 10)}");

    bool isFirstLaunch = lastLaunchDate != now.toString().substring(0, 10);
    if (isFirstLaunch) {
      await prefs.setString(
          'last_launch_date', now.toString().substring(0, 10));
    }

    return isFirstLaunch;
  }

  void scheduleAndDisplayAds(BuildContext context, Interstitialad ad) async {
    // print('Launch ad start');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    bool isFirstLaunch = await isFirstLaunchOfTheDay();
    if (isFirstLaunch) {
      log("FIRST LAUNCH");
    }
    bool shouldDisplayAd = true;

    if (!isFirstLaunch) {
      String lastLaunchTimeString = prefs.getString('last_launch_time') ?? '';
      DateTime lastLaunchTime = DateTime.parse(lastLaunchTimeString);
      DateTime currentTime = DateTime.now();
      String last = lastLaunchTime.toString().substring(11, 13);
      String curr = currentTime.toString().substring(11, 13);
      // print(" Launch time last: $lastLaunchTimeString");
      // print(" Launch time current: $currentTime");
      // print("diff: ${(int.parse(curr) - int.parse(last)).abs()}");
      if ((int.parse(curr) - int.parse(last)).abs() == 0) {
        shouldDisplayAd = false;
      }
    }
    /* ads changes if (shouldDisplayAd) {
      log("DISPALYing Ad");
      ad.loadAd();

      Future.delayed(const Duration(seconds: 5), () {
        ad.showAd();
      });

      await prefs.setString('last_launch_time', DateTime.now().toString());
    }*/

    // await prefs.setString('last_launch_time', '2023-07-10 10:26:31.443995');
    // await prefs.setString('last_launch_date', "2023-07-08");
  }
}
