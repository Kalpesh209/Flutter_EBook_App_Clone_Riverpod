import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';
import '../../../common/widgets/favorite_screen.dart';
import '../../../common/widgets/rating.dart';
import '../../../common/widgets/tag.dart';
import '../../../config/app_text_styles.dart';
import '../home/models/home_literarypicks_model.dart';
import '../home/providers/home_new_provider.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  final String title;
  final String type;

  const HistoryScreen({super.key, required this.title, required this.type});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class HistoryScreenState extends ConsumerState<HistoryScreen> {
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(homeProviderNew).allBookByType(widget.type, "1");
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
          backgroundColor: Colors.white,
          appBar: widget.title == 'History'
              ? AppBar(
                  title: Text(widget.title),
                  centerTitle: true,
                  actions: [
                    SizedBox(width: Get.width * 0.04),
                    InkWell(
                      onTap: () {
                        showMemberMenu();
                      },
                      child:
                          Assets.icons.cil_filter.image(width: actionBtnWidth),
                    ),
                    SizedBox(width: Get.width * 0.04),
                  ],
                )
              : AppBar(
                  title: Text(widget.title),
                  centerTitle: true,
                ),
          body: state.loading
              ? loadingCenter()
              : state.listBookByType!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.auth.images.notificationempty
                              .image(width: 200, height: 150),
                          const Text(
                            'No history getting',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                // width: double.maxFinite,
                                // width: 350.w,
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                    /* color: FPcolors.colorF2F4F5,*/
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
                              child: ListView.builder(
                                itemCount: state.listBookByType!.length,
                                itemBuilder: (ctx, index) {
                                  HomeLiteraryPicks topPicksList =
                                      state.listBookByType![index];
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                          "book id: 583fdef7-bc77-4e40-b83b-a16217f36048");
                                      if (topPicksList?.bookUsage ==
                                          "EBOOK_ONLY") {
                                        Get.toNamed(eBookDetails, parameters: {
                                          'book_id': topPicksList!.id.toString()
                                        });
                                      } else {
                                        Get.toNamed(bookDetails, parameters: {
                                          'book_id': topPicksList!.id.toString()
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Get.width * 0.05,
                                          bottom: Get.width * 0.02,
                                          right: Get.width * 0.05),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04),
                                        border: Border.all(
                                            color: FPcolors.greyBorder),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03,
                                                top: Get.width * 0.03,
                                                bottom: Get.width * 0.03),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Get.width * 0.03),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: topPicksList
                                                                .coverImage !=
                                                            null
                                                        ? FancyShimmerImage(
                                                            imageUrl: topPicksList
                                                                    .coverImage ??
                                                                '',
                                                            height: 100,
                                                            width: 80,
                                                          ) /*Image.network(
                                                      topPicksList
                                                          .coverImage ??
                                                          '',
                                                      height: 100,
                                                      width: 80,
                                                      fit: BoxFit
                                                          .cover,
                                                    )*/
                                                        : SvgPicture.asset(Assets
                                                            .settings
                                                            .svg
                                                            .emptyimage), /*Image.network(
                                                      "https://via.placeholder.com/288x188",
                                                      height: 100,
                                                      width: 80,
                                                      fit: BoxFit.cover,
                                                    ),*/
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                                vertical: 1.h,
                                              ),
                                              child: SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        topPicksList
                                                                .bookTitle ??
                                                            '',
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'DM Sans',
                                                          color: FPcolors
                                                              .colorBlack,
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        topPicksList
                                                                .authorName ??
                                                            "",
                                                        style: AppStyles
                                                            .slideSubTitleStyle,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            Get.width * 0.01),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 70.w,
                                                          child: TagWidget(
                                                            tag: topPicksList
                                                                    .contentType ??
                                                                '',
                                                          ),
                                                        ),
                                                        const RatingWidget(
                                                          rating: 3.5,
                                                          bookId: "1",
                                                          provider: null,
                                                        ),
                                                        // if (slide.cornerIcon != null) slide.cornerIcon!
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                topPicksList.isRead == true
                                                    ? SizedBox(
                                                        width: 90.w,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                // notificationData.isRead = !(notificationData.isRead ?? false);
                                                                // ref.watch(notificationProvider).addRemoveFromSelect(notificationData.id);
                                                                ref
                                                                    .watch(
                                                                        homeProviderNew)
                                                                    .removeFromCart(
                                                                        topPicksList
                                                                            ?.id);
                                                                ref
                                                                    .watch(
                                                                        homeProviderNew)
                                                                    .addRemoveFromSelect(
                                                                        topPicksList
                                                                            ?.id);

                                                                topPicksList
                                                                        .isRead =
                                                                    false;
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                Assets.icons
                                                                    .tick2,
                                                                width:
                                                                    Get.width *
                                                                        0.08,
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                    : widget.title ==
                                                            'Continue Reading'
                                                        ? SizedBox(
                                                            height: Get.width *
                                                                0.01)
                                                        : SizedBox(
                                                            width: 90.w,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                OutlinedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    // notificationData.isRead = !(notificationData.isRead ?? false);
                                                                    //ref.watch(notificationProvider).addRemoveFromSelect(notificationData.id);

                                                                    ref
                                                                        .watch(
                                                                            homeProviderNew)
                                                                        .addToCart(
                                                                            topPicksList?.id);
                                                                    ref
                                                                        .watch(
                                                                            homeProviderNew)
                                                                        .addRemoveFromSelect(
                                                                            topPicksList?.id);
                                                                    topPicksList
                                                                            .isRead =
                                                                        true;
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'Rent'),
                                                                ),
                                                              ],
                                                            ))
                                              ])
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
          bottomNavigationBar: widget.title == 'History'
              ? SizedBox(
                  height: Get.height * 0.10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: FpElevatedButton(
                          buttonTitle: 'Add to Cart',
                          onPressed: () async {},
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: Get.height * 0.01,
                ),
        )
      ],
    );
  }

  void showMemberMenu() async {
    await showMenu(
      context: context,
      color: FPcolors.colorffffff,
      position: const RelativeRect.fromLTRB(200, 50, 40, 100),
      items: [
        PopupMenuItem(
          value: 1,
          child: Text(
            "English Books",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'DM Sans',
                color: FPcolors.fpPrimary),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Gujrati Books",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'DM Sans',
                color: FPcolors.color6C7072),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Marathi Books",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'DM Sans',
                color: FPcolors.color6C7072),
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }
}

void doNothing(BuildContext context) {}
