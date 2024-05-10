import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/components.dart';
import '../../../../common/widgets/tag.dart';
import '../../category/widgets/category_card_sq.dart';
import '../../notification/notification_provider.dart';
import '../../notification/notificaton_response.dart';
import '../home_menu/library/providers/library_book_provider.dart';
import '../providers/home_new_provider.dart';
import 'category_view_screen.dart';

class HomeCategoryScreen extends ConsumerStatefulWidget {
  // const BookDetailsScreen({super.key});
  const HomeCategoryScreen({Key? key}) : super(key: key);

  @override
  HomeCategoryState createState() => HomeCategoryState();
}

class HomeCategoryState extends ConsumerState<HomeCategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(homeProviderNew).getallCategory("book","1");
    });
    FirebaseAnalytics.instance.logEvent(name: notificationScreen);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeProviderNew);
    var actionBtnWidth = Get.width * 0.06;

    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.background.bgTopCorner.keyName,
            width: Get.width / 1.6,
          ),
        ),
        Scaffold(
          // backgroundColor: FPcolors.colorWhite,
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
              : state.allCategory!.isEmpty
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
                                children: List.generate(state.allCategory!.length, (index) {
                                  var pos = 0;
                                  var pos2 = 9;
                                      if(index < 9){
                                        pos = index;
                                        pos2 = index;
                                      } else{
                                        pos = index - pos2;
                                      }
                                  print("postion value $pos");

                                  var categoryList = state.allCategory![index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: Get.width * 0.02,
                                        bottom: Get.width * 0.02,
                                        right: Get.width * 0.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Get.width * 0.04),
                                    ),
                                    child: Expanded(
                                        child: Material(
                                          borderRadius: BorderRadius.circular(Get.width * 0.04),
                                          color: pos == 0
                                          ? const Color.fromRGBO(191, 109, 255, 0.35)
                                           : pos == 1
                                          ? const Color.fromRGBO(255, 216, 61, 0.6)
                                          : pos == 2
                                          ? const Color.fromRGBO(83, 236, 172, 1)
                                          : pos == 3
                                          ? const Color.fromRGBO(148, 235, 255, 1)
                                          : pos == 4
                                          ? const Color.fromRGBO(241, 208, 201, 1)
                                          : pos == 5
                                          ? const Color.fromRGBO(250, 115, 45, 0.5)
                                          : pos == 6
                                          ? const Color.fromRGBO(191, 109, 255, 0.35)
                                          : pos == 7
                                          ? const Color.fromRGBO(83, 236, 172, 1)
                                          : pos == 8
                                          ? const Color.fromRGBO(255, 216, 61, 0.6)
                                          : pos == 9
                                          ? const Color.fromRGBO(255, 216, 61, 0.6)
                                          : const Color.fromRGBO(255, 216, 61, 0.6),
                                      //FPcolors.color53ECAC,
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 6,
                                      shadowColor: Colors.grey.shade300.withOpacity(0.4),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => CategoryViewScreen( title: categoryList.type.toString(), categoryId: categoryList.id.toString(),type:"LIBRARY_BOOK_ONLY"));
                                        },
                                        child: Container(
                                          padding:
                                          const EdgeInsets.only(top: 30.0),
                                          child: Column(children: [
                                            categoryList.image != null ?
                                            Image.asset(
                                              categoryList.image ?? '',
                                              height: 35,
                                              width: 35,
                                            ):SvgPicture.asset(Assets.settings.svg.emptyimage, height: 40),
                                            // Image.asset(notificationData['image'] ?? '', width: Get.width * 0.10,),
                                            SizedBox(height: Get.height * 0.02),

                                            Text(
                                              categoryList.type ?? '',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w700,
                                                color: FPcolors.color6D6D71,
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )),
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
