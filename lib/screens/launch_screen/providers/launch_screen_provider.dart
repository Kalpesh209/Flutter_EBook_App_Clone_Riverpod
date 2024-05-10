import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../helper/IsFirstTime.dart';
import '../../../update_dialog.dart';

class LaunchScreenState extends ChangeNotifier {
  String version = "";
  bool isShowUpdate = true;
  bool isLoadOnce = true;

  loadSavedUsed() async {
    await authService.loadUser();
    debugPrint("loadSavedUsed: called");
    debugPrint("token getting ${authService.user?.token}");
    if (authService.user?.token != null) {
      Timer(
        const Duration(seconds: 3),
        () async {
          debugPrint("loadSavedUsed inside timer1: called");
          globals.token = authService.user?.token;
          if (authService.user?.isVerified == true) {
            return Get.offAllNamed(dashboard);
          } else {
            return Get.offAllNamed(loginRegister);
          }
        },
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () async {
          debugPrint("loadSavedUsed inside timer2: called");
          var alreadyAUser = await IsFirstTime().getOnce();
          switch (alreadyAUser) {
            case 0:
              return Get.offAllNamed(appGuide);
            case 1:
              return Get.offAllNamed(loginRegister);
          }
        },
      );

      //  7984274657 Get.offAllNamed(loginRegister);
      // Get.offAllNamed(register);
    }
  }

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    version = packageInfo.version;
  }

  void checkVersion(NewVersionPlus newVersion, BuildContext context) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint('Version: ${status.originalStoreVersion}');
      debugPrint('Can Update Version: ${status.canUpdate}');
      debugPrint('local version: ${status.localVersion}');
      if (status.canUpdate && isShowUpdate == true) {
        if (!context.mounted) return;
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return UpdateDialog(
                originalStoreVersion: status.originalStoreVersion!,
                applink: status.appStoreLink,
                nothanks: () => loadSavedUsednew());
          },
        );
      } else {
        debugPrint("token 1 ${authService.user?.token}");
        if (isLoadOnce == true) {
          loadSavedUsed();
        }
        isLoadOnce = false;
      }
    } else {
      debugPrint("token 2 ${authService.user?.token}");

      loadSavedUsed();
    }
  }

  loadSavedUsednew() async {
    await authService.loadUser();
    debugPrint("loadSavedUsednew: called");
    debugPrint("token getting ${authService.user?.token}");
    if (authService.user?.token != null) {
      globals.token = authService.user?.token;
      if (authService.user?.isVerified == true) {
        return Get.offAllNamed(dashboard);
      } else {
        return Get.offAllNamed(loginRegister);
      }
    } else {
      var alreadyAUser = await IsFirstTime().getOnce();
      switch (alreadyAUser) {
        case 0:
          return Get.offAllNamed(appGuide);
        case 1:
          return Get.offAllNamed(loginRegister);
      }

      //  7984274657 Get.offAllNamed(loginRegister);
      // Get.offAllNamed(register);
    }
  }

// getVerify() async {
//   return "verified";
//   Response<dynamic> response =
//       await dioService.get('user/invite-code-verify-check');
//   Map<String, dynamic> res = response.data;
//   debugPrint('res $res');
//
//   if (res["data"]["is_verified"] == true) {
//     return "verified";
//   } else {
//     if (res["success"] == false) {
//       return "issue";
//     } else {
//       return "notverified";
//     }
//   }
// }

// loadSavedUsed() async {
//   // loadSavedUsed();
//
//   await authService.loadUser();
//   String? res;
//   try {
//     res = await getVerify();
//   } catch (E) {
//     Get.offAllNamed(register);
//   }
//
//   if (authService.user == null || res == "issue") {
//     Get.offAllNamed(register);
//   } else {
//     if (res == "verified") {
//       if (authService.user?.token != null) {
//         globals.token = authService.user?.token;
//         Get.offAllNamed(dashboard);
//       } else {
//         Get.offAllNamed(register);
//       }
//     } else {
//       globals.token = authService.user?.token;
//
//       if (authService.user?.token != null && res == "notverified") {
//         Get.offAllNamed(register);
//         // Get.offAllNamed(DASHBOARD);
//       } else {
//         globals.token = authService.user?.token;
//         Get.offAllNamed(dashboard);
//       }
//     }
//   }
// }
}

final launchScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  /* var state = LaunchScreenState();
  state.loadSavedUsed();*/
  return LaunchScreenState();
});
