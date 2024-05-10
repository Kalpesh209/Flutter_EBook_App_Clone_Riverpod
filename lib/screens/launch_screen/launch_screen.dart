import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/launch_screen/providers/launch_screen_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../gen/assets.gen.dart';

class LaunchScreen extends ConsumerStatefulWidget {
  const LaunchScreen({super.key});

  @override
  LaunchScreenState createState() => LaunchScreenState();
}

class LaunchScreenState extends ConsumerState<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("addPostFrameCallback: called");
      ref.watch(launchScreenProvider).checkVersion(newversion, context);
      // setVersion();
    });

    debugPrint("initstate: called");
    setVersion();
  }

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    //setState(() {
    version = packageInfo.version;
    //});
  }

  String version = "";

  @override
  Widget build(BuildContext context) {
    ref.watch(launchScreenProvider);
    debugPrint("build method splash called: ");
    // WidgetsBinding.instance.addPostFrameCallback((d) {
    //   Future.delayed(
    //       const Duration(seconds: 3), () => Get.toNamed(WELCOME_PAGE));
    // });
    return UpgradeAlert(
        upgrader: Upgrader(
          debugDisplayAlways: false,
          showLater: false,
          showIgnore: false,
          showReleaseNotes: false,
          dialogStyle: Platform.isAndroid
              ? UpgradeDialogStyle.material
              : UpgradeDialogStyle.cupertino,
          minAppVersion: version,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: themeColor,
            image: DecorationImage(
                image: Assets.auth.images.bigLogo.image().image,
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.auth.images.logo
                    .image(width: MediaQuery.of(context).size.width * 0.5),
                // Text(MediaQuery.of(context).size.width.toString())
              ],
            ),
          ),
        ));
  }
}
