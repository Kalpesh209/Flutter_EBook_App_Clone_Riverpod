import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../invitation_screen/providers/invitation_screen_provider.dart';

class WaitList extends ConsumerWidget {
  const WaitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(invitationScreenProvider);
    double height = Get.size.height;
    double width = Get.size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: height * 0.2),
                    Assets.auth.images.waitlist.image(width: width * 0.3),
                    Column(
                      children: [
                        Text(
                          'You’re in line! Stay Patient !!',
                          style: Get.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.1),
                        Text(state.aa[0],
                            style: Get.textTheme.bodyLarge
                                ?.copyWith(color: themeColor, fontSize: 28)),
                        SizedBox(height: height * 0.01),
                        Text('Ahead of you', style: Get.textTheme.bodyLarge),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.back();
                        // Get.back();
                      },
                      child: Text(
                        'Thanks for showing \n interest',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(color: themeColor),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.08, vertical: height * 0.05),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: themeColor,
                      ),
                      child: const Text(
                        'Enter Code',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Assets.auth.images.cornerLogo
          //     .image(width: width * 0.7, height: width * 0.7, fit: BoxFit.cover)
        ],
      ),
    );
  }
}
