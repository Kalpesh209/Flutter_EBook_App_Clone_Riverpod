import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/providers/category_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/checkout/checkout_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/books.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/widgets/category_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/widgets/category_card_sq.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/audio_books_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/library.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/meditation_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_screen.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../../config/colors/colors.dart';
import '../../common_widgets/common_widgets.dart';
import '../home/book_challenge/screens/select_book_search_screen.dart';
import '../home/home_category/category_view_screen.dart';
import '../home/models/book_details_modal.dart';
import '../home/providers/home_new_provider.dart';
import '../home/widgets/home_widgets.dart';
import '../notification/notification_provider.dart';

class EBookCategoryScreen extends ConsumerStatefulWidget {
  const EBookCategoryScreen({Key? key}) : super(key: key);

  @override
  EBookCategoryScreenState createState() => EBookCategoryScreenState();
}

class EBookCategoryScreenState extends ConsumerState<EBookCategoryScreen> {


  @override
  void initState() {
    super.initState();
    //setVersion();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getEBookCategoryList("1");
    });
  }

  final TextEditingController searchController = TextEditingController();

  String? version;

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(categoryProviderNew);
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
          backgroundColor: Colors.white,
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
                    onTap: ()=>{
                      Get.to(() => const SelectBookSearchScreen(
                        type: 'Book',
                      ))
                    },
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
                          Assets.icons.search.image(width: actionBtnWidth),
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
                  SizedBox(
                    height: Get.width * 1.6,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (100.w / 40.h),
                      children: List.generate(
                          state.allCategory!.length, (index) {
                        var pos = 0;
                        var pos2 = 9;
                        if (index < 9) {
                          pos = index;
                          pos2 = index;
                        } else {
                          pos = index - pos2;
                        }
                        print("postion value $pos");

                        var categoryItem = state.allCategory?[index];
                        return Container(
                          margin: EdgeInsets.only(
                              left: Get.width * 0.02,
                              bottom: Get.width * 0.03,
                              right: Get.width * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Get.width * 0.04),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(
                                Get.width * 0.04),
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
                            shadowColor: Colors.grey.shade300.withOpacity(
                                0.4),
                            child: InkWell(
                              onTap: () {
                                Get.to(() =>
                                    CategoryViewScreen(
                                      title: categoryItem!.type.toString(),
                                      categoryId: categoryItem!.id
                                          .toString(),type: "EBOOK_ONLY",));
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80.w,
                                        child:  Text(
                                          categoryItem?.type ?? "",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w700,
                                            color: FPcolors.color6D6D71,
                                          ),
                                        ),
                                      ),

                                      // Image.asset(notificationData['image'] ?? '', width: Get.width * 0.10,),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius
                                                .circular(30.r)),
                                        child: categoryItem?.image != null ?
                                        Image.asset(
                                          categoryItem?.image ?? '',
                                          height: 30,
                                          width: 30,
                                        ):SvgPicture.asset(Assets.settings.svg.emptyimage, height: 30,width: 30,),/*Image.asset(
                                          categoryItem?.type ?? "",
                                          height: 30,
                                          width: 30,
                                        )*/
                                      ),
                                    ]),
                              ),
                            ),
                          ),
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
