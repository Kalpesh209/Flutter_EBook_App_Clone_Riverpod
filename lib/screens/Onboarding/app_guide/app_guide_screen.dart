import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/app_guide/app_guide_provider.dart';
import 'package:get/get.dart';

class AppGuideScreen extends ConsumerWidget {
  const AppGuideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(launchScreenProvider);

    return Scaffold(
      backgroundColor: FPcolors.colorFFECE5,
      appBar: AppBar(
        actions: [
          if (state.currentPage != 4)
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 22.0, top: 8.0, bottom: 8.0),
              child: InkWell(
                onTap: () {
                  state.onSkip;
                  state.onLogIn();
                },
                child: Text(
                  'SKIP',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: FPcolors.fpPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )

          // const SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider(
            carouselController: state.carouselController,
            disableGesture: false,
            items: state.screenItems
                .map(
                  (item) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 83),
                          SvgPicture.asset(Assets.icons.icWhiteSun),
                        ],
                      ),
                      SizedBox(
                        height: 300.h,
                        child: Image.asset(
                          item['image'] ?? '',
                          fit: BoxFit.fitWidth,
                        ),
                        /* child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(item['image'] ?? '',fit: BoxFit.fitWidth,),
                        ),*/
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 350,
                        child: Text(
                          item['heading'] ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: item['index'] == 0 || item['index'] == 4
                                ? FPcolors.fpPrimary
                                : FPcolors.color934231,
                            fontSize: item['index'] == 0 || item['index'] == 4
                                ? 32
                                : 20,
                            // fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                          ),
                        ).marginSymmetric(horizontal: 12),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 330,
                        child: Text(
                          item['sub_heading'] ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // the white space between letter, default is 0.0
                            color: FPcolors.color934231,
                            fontSize: 16,
                            // fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),
                      const Spacer(),
                      if (state.currentPage != 4)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              state.screenItems1.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => state.carouselController
                                  .animateToPage(entry.key),
                              child: Container(
                                width: 16.w,
                                height: 16.h,
                                margin: EdgeInsets.only(right: 15.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: state.currentPage == entry.key
                                      ? FPcolors.colorC74225
                                      : FPcolors.colorD9D9D9,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: state.onPageChanged,
              height: Platform.isAndroid
                  ? MediaQuery.sizeOf(context).height / 1.15
                  : MediaQuery.sizeOf(context).height / 1.20,
              autoPlay: false,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
            ),
          ),
        ],
      ),
    );
  }
}
