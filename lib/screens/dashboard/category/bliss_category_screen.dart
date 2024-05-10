import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/providers/category_provider.dart';
import 'package:get/get.dart';

import '../home/home_category/category_view_screen.dart';
import '../notification/notification_provider.dart';

class BlissCategoryScreen extends ConsumerStatefulWidget {
  // const BookDetailsScreen({super.key});
  const BlissCategoryScreen({Key? key}) : super(key: key);

  @override
  BlissCategoryState createState() => BlissCategoryState();
}

class BlissCategoryState extends ConsumerState<BlissCategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getAllAudioBookCategoryList("1");
    });
    FirebaseAnalytics.instance.logEvent(name: notificationScreen);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(categoryProviderNew);
    var actionBtnWidth = Get.width * 0.06;

    return Stack(
      children: [
        Container(
          height: 193.0,
          color: FPcolors.colorF1CFC8,
        ),
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
            title: const Text('Category'),
            centerTitle: true,
            actions: [
              SizedBox(width: Get.width * 0.04),
              /*InkWell(
                onTap: () {

                },
                child: Assets.icons.cil_filter.image(width: actionBtnWidth),

              ),*/
              SizedBox(width: Get.width * 0.04),
            ],
          ),
          body: state.loading
              ? loadingCenter()
              : state.allAudioCategory!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.auth.images.notificationempty
                              .image(width: 200, height: 150),
                          const Text(
                            'No Category getting',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                // width: double.maxFinite,
                                // width: 350.w,
                                margin: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                    color: FPcolors.colorF2F4F5,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Row(
                                  children: [
                                    Assets.icons.search
                                        .image(width: actionBtnWidth),
                                    SizedBox(width: 10.w),
                                    Text(
                                      'Search Category',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                        color: FPcolors.color676F74,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Get.width * 0.04),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 3,
                                children: List.generate(
                                    state.allAudioCategory!.length, (index) {
                                  var pos = 0;
                                  var pos2 = 9;
                                  if (index < 9) {
                                    pos = index;
                                    pos2 = index;
                                  } else {
                                    pos = index - pos2;
                                  }

                                  var notificationData =
                                      state.allAudioCategory?[index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: Get.width * 0.02,
                                        bottom: Get.width * 0.02,
                                        right: Get.width * 0.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Get.width * 0.04),
                                    ),
                                    child: Column(children: [
                                      Expanded(
                                          child: Material(
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04),
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 6,
                                        shadowColor: Colors.grey.shade300
                                            .withOpacity(0.4),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => CategoryViewScreen(
                                                  title: notificationData!.type
                                                      .toString(),
                                                  categoryId: notificationData
                                                      .id
                                                      .toString(),
                                                  type: 'AUDIO_BOOK',
                                                ));
                                          },
                                          child: SizedBox(
                                            width: 90.w,
                                            height: 90.h,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: notificationData?.image !=
                                                      null
                                                  ? Image.asset(
                                                      notificationData?.image ??
                                                          '',
                                                      height: 30,
                                                      width: 30,
                                                    )
                                                  : SvgPicture.asset(
                                                      Assets.settings.svg
                                                          .emptyimage,
                                                      height: 30,
                                                      width: 30,
                                                    ), /*Image.asset(
                                                  notificationData?.image ?? '',
                                                  height: 35,
                                                  width: 35,
                                                ),*/
                                              // Image.asset(notificationData['image'] ?? '', width: Get.width * 0.10,),
                                            ),
                                          ),
                                        ),
                                      )),
                                      SizedBox(height: Get.height * 0.01),
                                      Text(
                                        notificationData?.type ?? '',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                          color: FPcolors.color6D6D71,
                                        ),
                                      )
                                    ]),
                                  );
                                }),
                              ),
                            ),
                          ]),
                    ),
        )
      ],
    );
  }
}

void doNothing(BuildContext context) {}
