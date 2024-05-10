import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/top_picks/seachbook_screen.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/components.dart';
import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../notification/notification_provider.dart';
import '../../notification/notificaton_response.dart';
import '../book_challenge/screens/select_book_search_screen.dart';
import '../models/home_literarypicks_model.dart';
import '../providers/home_new_provider.dart';

class TopPicksScreen extends ConsumerStatefulWidget {
  final String title;
  final String type;

  const TopPicksScreen({super.key, required this.title, required this.type});

  @override
  TopPicksScreenState createState() => TopPicksScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class TopPicksScreenState extends ConsumerState<TopPicksScreen> {
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(homeProviderNew).allBookByType(widget.type, "1");
    });
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
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            actions: [
              SizedBox(width: Get.width * 0.04),
              InkWell(
                onTap: () {
                  Get.to(() => const SelectBookSearchScreen(
                        type: 'Library',
                      ));
                },
                child: Assets.icons.search.image(width: actionBtnWidth),
              ),
              SizedBox(width: Get.width * 0.04),
            ],
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
                            'No data getting',
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
                            SizedBox(height: Get.width * 0.04),
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.listBookByType?.length,
                                itemBuilder: (ctx, index) {
                                  HomeLiteraryPicks topPicksList =
                                      state.listBookByType![index];
                                  return InkWell(
                                      onTap: () {
                                        if (topPicksList.bookUsage ==
                                            "EBOOK_ONLY") {
                                          Get.toNamed(eBookDetails,
                                              parameters: {
                                                'book_id':
                                                    topPicksList!.id.toString()
                                              });
                                        } else {
                                          Get.toNamed(bookDetails, parameters: {
                                            'book_id':
                                                topPicksList!.id.toString()
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
                                                    child: SizedBox(
                                                      height: 100,
                                                      width: 80,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: topPicksList
                                                                    .coverImage !=
                                                                null
                                                            ? FancyShimmerImage(
                                                                imageUrl:
                                                                    topPicksList
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
                                                            : SvgPicture.asset(
                                                                Assets
                                                                    .settings
                                                                    .svg
                                                                    .emptyimage),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 1.w),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 1.h,
                                                ),
                                                child: SizedBox(
                                                  width: 125.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        child: Text(
                                                          topPicksList
                                                                  .bookTitle ??
                                                              '',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                'DM Sans',
                                                            color: FPcolors
                                                                .colorBlack,
                                                          ),
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        child: Text(
                                                          topPicksList
                                                                  .authorName ??
                                                              "",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                'DM Sans',
                                                            color: FPcolors
                                                                .color6C7072,
                                                          ),
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
                                                          RatingWidget(
                                                            rating: topPicksList
                                                                .rating,
                                                            bookId:
                                                                topPicksList.id,
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
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
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
                                                                child:
                                                                    SvgPicture
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
                                                              height:
                                                                  Get.width *
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
                                                                    child: const Text(
                                                                        'Rent'),
                                                                  ),
                                                                ],
                                                              ))
                                                ])
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            )
                          ]),
                    ),
          bottomNavigationBar: widget.title == 'Top Picks'
              ? FilledButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ).marginSymmetric(
                  horizontal: 16.w,
                  vertical: 24.h,
                )
              : SizedBox(height: Get.width * 0.01),
        )
      ],
    );
  }
}
