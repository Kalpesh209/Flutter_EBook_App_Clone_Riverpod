import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/top_picks/seachbook_screen.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../home/widgets/home_widgets.dart';
import '../../notification/notification_provider.dart';
import '../../notification/notificaton_response.dart';
import '../providers/category_provider.dart';

class RecentBooksScreen extends ConsumerStatefulWidget {
  const RecentBooksScreen({super.key});

  @override
  RecentBooksScreenState createState() => RecentBooksScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class RecentBooksScreenState extends ConsumerState<RecentBooksScreen> {
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getRecentReadBook("1");
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(categoryProviderNew);
    var actionBtnWidth = Get.width * 0.06;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: state.loading
              ? loadingCenter()
              : state.recentReadBookList!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 220,
                              height: 60,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: FPcolors.fpPrimary),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        Assets.icons.iconPlusDiscover),
                                    SizedBox(width: Get.width * 0.05),
                                    Text('Discover books',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          color: FPcolors.fpPrimary,
                                        ))
                                  ],
                                ).paddingSymmetric(vertical: 4, horizontal: 5),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(height: Get.width * 0.04),
                            Container(
                              margin: EdgeInsets.only(
                                left: 20.w,
                                right: 16.w,
                                bottom: 1.h,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Recent Reads",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          // fontFamily: 'DM Sans',
                                          color: FPcolors.colorBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            state.recentReadBookList!.isNotEmpty
                                ? recentReads(state.recentReadBookList,
                                    state.loading, "Recent Reads", "")
                                : const SizedBox(
                                    width: 10,
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SizedBox(
                                width: 220,
                                height: 60,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: FPcolors.fpPrimary),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          Assets.icons.iconPlusDiscover),
                                      SizedBox(width: Get.width * 0.05),
                                      Text('Discover books',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            color: FPcolors.fpPrimary,
                                          ))
                                    ],
                                  ).paddingSymmetric(
                                      vertical: 4, horizontal: 5),
                                ),
                              ),
                            )
                          ]),
                    ),
        )
      ],
    );
  }
}
