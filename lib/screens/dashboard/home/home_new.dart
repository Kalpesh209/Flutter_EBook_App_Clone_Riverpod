import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/providers/home_new_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/top_picks/top_picks_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/home_widgets.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';

import '../../../config/colors/colors.dart';
import '../checkout/checkout_screen.dart';
import 'models/home_literarypicks_model.dart';

class HomeNewScreen extends ConsumerStatefulWidget {
  const HomeNewScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeNewScreen> {
  bool ispicked = true;

  @override
  void initState() {
    super.initState();
    launchAdOnStart();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(homeProviderNew).getHomePageDetails();
      // setVersion();
    });
    FirebaseAnalytics.instance
        .logEvent(name: 'open_home_screen')
        .then((value) => null);

    //  FirebasePerformance.instance.newHttpMetric("http://64.227.137.175:3004/api/v1/bookuser/user/homepage", HttpMethod.Get).start;
  }

  launchAdOnStart() {}

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeProviderNew);
    debugPrint('listOfLibrary ${state.listOfLibrary?.length}');
    debugPrint('listOfEbook ${state.listOfLibrary?.length}');
    debugPrint('listOfYoga ${state.listOfLibrary?.length}');
    debugPrint('loading ${state.loading}');
    final controller = SwiperController();

    var count = state.notificationList?.length.toInt();
    if (count != 0) {
      debugPrint('ispicked ${state.notificationList?.length}');
      ispicked = false;
    }
    debugPrint('ispicked ${ispicked}');

    var actionBtnWidth = Get.width * 0.06;
    var actionBtnWidth1 = Get.width * 0.045;

    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.background.bgTopCorner.keyName,
            width: Get.width / 1.6,
          ),
        ),
        RefreshIndicator(
          // color: FPcolors.colorffffff,
          color: Colors.transparent,
          onRefresh: () async {
            state.onReload();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Swipe notification
                SizedBox(height: 50.h),
                state.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.notificationList!.isNotEmpty
                        ? Swiper(
                            controller: controller,
                            itemBuilder: (BuildContext context, int index) {
                              var post = state.notificationList!.length - 1;
                              return Container(
                                // width: double.maxFinite,
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: FPcolors.colorbfbfbf),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Container(
                                  // width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 1.h,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: FPcolors.color393939),
                                      color: FPcolors.colorC74225,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3.0,
                                              top: 12.0,
                                            ),
                                            // Adjust the left padding as needed
                                            child: Text(
                                              "$post/${state.notificationList!.length}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: () {
                                                // controller.move(0);
                                                state.onTapNotification(state
                                                    .notificationList![index]);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 3.0,
                                                  top: 10.0,
                                                ),
                                                // Adjust the left padding as needed
                                                child: Assets.icons.cancelIcon
                                                    .image(
                                                        width: actionBtnWidth1,
                                                        color: FPcolors
                                                            .colorWhite),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 1.0,
                                        ),
                                        child: Text(
                                          state.notificationList![index]
                                                  .title ??
                                              'Community Book Exchange Hub',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w700,
                                            color: FPcolors.colorWhite,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      SizedBox(
                                        height: 30.h,
                                        child: Text(
                                          state.notificationList![index].body ??
                                              'A shared space where literary adventues find new homes.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w400,
                                            color: FPcolors.colorWhite,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            onIndexChanged: (int index) {
                              if (index == 0) {
                                state.onTapNotification(
                                    state.notificationList![index]);
                              }
                            },
                            autoplay: true,
                            loop: false,
                            //this is the property that prevents the swiper from looping
                            autoplayDelay: 100,
                            scale: .01,
                            viewportFraction: 1,
                            itemCount: 1,
                            itemWidth: 400.0,
                            itemHeight: 100.0,
                            layout: SwiperLayout.TINDER,
                          )
                        : SizedBox(height: 1.h),
                // Explore Categories
                SizedBox(height: 5.h),
                state.homeCategory!.isNotEmpty
                    ? exploreCategoriesView(
                        state.homeCategory ?? [], state.loading)
                    : SizedBox(height: 1.h),

                state.homeLiteraryPicks!.isNotEmpty
                    ? literaryPicks(state.homeLiteraryPicks ?? [],
                        state.loading, "literary_picks")
                    : SizedBox(height: 1.h),
                SizedBox(height: 15.h), // Editor Choice

                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.05),
                  child: state.homeSliderOne!.isNotEmpty
                      ? CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            height: 200.h,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            padEnds: false,
                            autoPlay: false,
                          ),
                          itemCount: state.homeSliderOne?.length,
                          itemBuilder: (context, index, realIdx) {
                            return Builder(
                              builder: (BuildContext context) {
                                GlobalKey widgetKey = GlobalKey();

                                HomeLiteraryPicks? data =
                                    state.homeSliderOne?[index];
                                return Container(
                                  key: widgetKey,
                                  margin: const EdgeInsets.only(
                                      bottom: 10.0, left: 5),
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 6,
                                    shadowColor: FPcolors.color303030,
                                    child: GestureDetector(
                                      onTap: () => {
                                        if (index == 0)
                                          {
                                            Get.to(() => TopPicksScreen(
                                                  title: data!.mainTitle
                                                      .toString(),
                                                  type: "editor_choice",
                                                ))
                                          }
                                        else
                                          {
                                            Get.to(() => TopPicksScreen(
                                                  title: data!.mainTitle
                                                      .toString(),
                                                  type: "new_picks",
                                                ))
                                          }
                                      },
                                      child: ClipRRect(
                                        child: SizedBox(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: FPcolors.colorfeddd8,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15,
                                                        top: Get.width * 0.03),
                                                    child: Text(
                                                      data!.mainTitle
                                                          .toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 18.sp,
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            FPcolors.colorBlack,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 5),
                                                    child: Text(
                                                      "Fresh Arrivals Await!",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: FPcolors
                                                            .color6C7072,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 15,
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  Get.width *
                                                                      0.3,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        Get.width *
                                                                            0.04),
                                                                child:
                                                                    FancyShimmerImage(
                                                                  imageUrl: data!
                                                                      .coverImage
                                                                      .toString(),
                                                                  //   height: Get.width * 0.3,
                                                                  width:
                                                                      Get.width *
                                                                          0.3,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 158.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 9,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              data.bookTitle
                                                                  .toString(),
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: FPcolors
                                                                    .colorBlack,
                                                              ),
                                                            ),
                                                            Text(
                                                              data.authorName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: FPcolors
                                                                    .color6C7072,
                                                              ),
                                                              maxLines: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 40.h,
                                                              child: Html(
                                                                data: data!
                                                                    .aboutUs
                                                                    .toString(),
                                                                style: {
                                                                  "body": Style(
                                                                    fontSize:
                                                                        FontSize(
                                                                            12.0),
                                                                    maxLines: 1,
                                                                    color: FPcolors
                                                                        .color6C7072,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                if (data.isRead ==
                                                                    true) {
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .removeFromCart(
                                                                          data.id);
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addRemoveFromSelect(
                                                                          data.id);
                                                                } else {
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addToCart(
                                                                          data.id);

                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addRemoveFromSelect(
                                                                          data.id);
                                                                }
                                                                state
                                                                    .getHomePageDetails();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  border: Border.all(
                                                                      color: FPcolors
                                                                          .fpPrimary),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Assets.icons
                                                                        .plushIcon
                                                                        .image(
                                                                            width:
                                                                                20,
                                                                            height:
                                                                                20),
                                                                    SizedBox(
                                                                        width: Get.width *
                                                                            0.05),
                                                                    Text(
                                                                        'Rent Now',
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12.sp,
                                                                          fontFamily:
                                                                              'DM Sans',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              FPcolors.fpPrimary,
                                                                        ))
                                                                  ],
                                                                ).paddingSymmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        5),
                                                              ),
                                                            ),

                                                            // SizedBox(height: Get.width * 0.028),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                      : SizedBox(height: 1.h),
                ),
                SizedBox(height: 15.h),
                state.homeGenreYouLoved!.isNotEmpty
                    ? basedGenreloved(
                        state.homeGenreYouLoved ?? [],
                        state.loading,
                        "Based on the Genre you loved",
                        "Read and explore new books")
                    : SizedBox(height: 1.h),
                SizedBox(height: 8.h),
                state.homeTopPicks!.isNotEmpty
                    ? Material(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        color: FPcolors.colorf7e4e0,
                        shadowColor: FPcolors.colorf7e4e0,
                        child: topPicks(
                            state.homeTopPicks ?? [],
                            state.loading,
                            "Top Picks",
                            "Listen to the voices who changed the world.",
                            onTap: () {
                          if (state.homeTopPicks![0].isRead == false) {
                            ref
                                .watch(homeProviderNew)
                                .addToCart(state.homeTopPicks![0].id);
                            ref
                                .watch(homeProviderNew)
                                .addRemoveFromSelect(state.homeTopPicks![0].id);
                          } else {
                            ref
                                .watch(homeProviderNew)
                                .removeFromCart(state.homeTopPicks![0].id);
                            ref
                                .watch(homeProviderNew)
                                .addRemoveFromSelect(state.homeTopPicks![0].id);
                          }
                        }),
                      )
                    : SizedBox(height: 1.h),
                SizedBox(height: 10.h),
                state.homeFreshPageEdits!.isNotEmpty
                    ? freshpageEdits(
                        state.homeFreshPageEdits ?? [],
                        state.loading,
                        "Freshpage’s Edits",
                        "Page-turners that promise an immersive reading experience")
                    : SizedBox(height: 1.h),
                SizedBox(height: 5.h),
                state.homeTrendingBook!.isNotEmpty
                    ? basedGenreloved(
                        state.homeTrendingBook ?? [],
                        state.loading,
                        "Trending now",
                        "Stay updated with the Trends")
                    : SizedBox(height: 1.h),

                SizedBox(height: 5.h),
                state.homeSimilartitles!.isNotEmpty
                    ? Material(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        color: FPcolors.colorf7e4e0,
                        shadowColor: FPcolors.colorf7e4e0,
                        child: topPicks(
                            state.homeSimilartitles ?? [],
                            state.loading,
                            "Similar Titles",
                            " Books similar to those you have previously enjoyed.",
                            onTap: () {
                          if (state.homeSimilartitles![0].isRead == false) {
                            ref
                                .watch(homeProviderNew)
                                .addToCart(state.homeSimilartitles![0].id);
                            ref.watch(homeProviderNew).addRemoveFromSelect(
                                state.homeSimilartitles![0].id);
                          } else {
                            ref
                                .watch(homeProviderNew)
                                .removeFromCart(state.homeSimilartitles![0].id);
                            ref.watch(homeProviderNew).addRemoveFromSelect(
                                state.homeSimilartitles![0].id);
                          }
                        }),
                      )
                    : SizedBox(height: 1.h),
                SizedBox(height: 10.h),
                state.homeStaffPicks!.isNotEmpty
                    ? staffPicks(
                        state.homeStaffPicks ?? [],
                        state.loading,
                        "Staff Picks",
                        "Curated recommendations from library staff members")
                    : SizedBox(height: 1.h),

                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.05),
                  child: state.homeSliderTwo!.isNotEmpty
                      ? CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            height: 200.h,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            padEnds: false,
                            autoPlay: false,
                          ),
                          itemCount: state.homeSliderTwo?.length,
                          itemBuilder: (context, index, realIdx) {
                            return Builder(
                              builder: (BuildContext context) {
                                HomeLiteraryPicks? data =
                                    state.homeSliderTwo?[index];
                                return Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10.0, left: 5),
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 6,
                                    shadowColor: FPcolors.color303030,
                                    child: GestureDetector(
                                      onTap: () => {
                                        Get.to(() => TopPicksScreen(
                                              title: data!.mainTitle.toString(),
                                              type: "editor_choice",
                                            ))
                                      },
                                      child: ClipRRect(
                                        child: SizedBox(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: FPcolors.colorfeddd8,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15,
                                                        top: Get.width * 0.03),
                                                    child: Text(
                                                      data!.mainTitle
                                                          .toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 18.sp,
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            FPcolors.colorBlack,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 5),
                                                    child: Text(
                                                      "Fresh Arrivals Await!",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: FPcolors
                                                            .color6C7072,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                bottom:
                                                                    Get.width *
                                                                        0.03),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      Get.width *
                                                                          0.04),
                                                              child:
                                                                  FancyShimmerImage(
                                                                imageUrl: data!
                                                                    .coverImage
                                                                    .toString(),
                                                                height: 115.h,
                                                                width: 120.w,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 158.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 9,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              data.bookTitle
                                                                  .toString(),
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: FPcolors
                                                                    .colorBlack,
                                                              ),
                                                            ),
                                                            Text(
                                                              data.bookTag
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: FPcolors
                                                                    .color6C7072,
                                                              ),
                                                              maxLines: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 50.h,
                                                              child: Html(
                                                                data: data
                                                                    .aboutUs
                                                                    .toString()
                                                                    .replaceAll(
                                                                        "&nbsp;",
                                                                        ""),
                                                                style: {
                                                                  "body": Style(
                                                                    fontSize:
                                                                        FontSize(
                                                                            12.0),
                                                                    maxLines: 1,
                                                                    color: FPcolors
                                                                        .color6C7072,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                },
                                                              ),
                                                            ),

                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                if (data.isRead ==
                                                                    true) {
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .removeFromCart(
                                                                          data.id);
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addRemoveFromSelect(
                                                                          data.id);
                                                                } else {
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addToCart(
                                                                          data.id);
                                                                  ref
                                                                      .watch(
                                                                          homeProviderNew)
                                                                      .addRemoveFromSelect(
                                                                          data.id);
                                                                }
                                                                state
                                                                    .getHomePageDetails();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  border: Border.all(
                                                                      color: FPcolors
                                                                          .fpPrimary),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Assets.icons
                                                                        .plushIcon
                                                                        .image(
                                                                            width:
                                                                                20,
                                                                            height:
                                                                                20),
                                                                    SizedBox(
                                                                        width: Get.width *
                                                                            0.05),
                                                                    Text(
                                                                        'Rent Now',
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12.sp,
                                                                          fontFamily:
                                                                              'DM Sans',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              FPcolors.fpPrimary,
                                                                        ))
                                                                  ],
                                                                ).paddingSymmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        5),
                                                              ),
                                                            ),

                                                            /*  SizedBox(
                                                      width:
                                                      double.infinity,
                                                      child:
                                                      OutlinedButton(
                                                        onPressed: () async {
                                                          if (data.isRead == true) {
                                                            ref.watch(homeProviderNew).removeFromCart(data.id);
                                                            ref.watch(homeProviderNew).addRemoveFromSelect(data.id);
                                                          } else {
                                                            ref.watch(homeProviderNew).addToCart(data.id);
                                                            ref.watch(homeProviderNew).addRemoveFromSelect(data.id);
                                                          }
                                                          state.getHomePageDetails();
                                                        },
                                                        child: data.isRead == true ? Row(mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            const Icon(Icons.check),
                                                            SizedBox(height: Get.width * 0.015),
                                                            Text('Rent Now', style:
                                                            TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'DM Sans',
                                                              fontWeight: FontWeight.w500,
                                                              color: FPcolors.fpPrimary,
                                                            ))
                                                          ],
                                                        ).paddingSymmetric(vertical: getx.Get.height * 0.01)
                                                            :
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Assets.icons.plushIcon.image(width: 20,height: 20),
                                                            SizedBox(height: Get.width * 0.01),
                                                            Text('Rent Now', style:
                                                            TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'DM Sans',
                                                              fontWeight: FontWeight.w500,
                                                              color: FPcolors.fpPrimary,
                                                            ))
                                                          ],
                                                        ).paddingSymmetric(vertical: 5),
                                                      ),
                                                    ),*/
                                                            // SizedBox(height: Get.width * 0.028),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                      : SizedBox(height: 1.h),
                ),
                SizedBox(height: 8.h),
                state.homeHistory!.isNotEmpty
                    ? freshpageEdits(
                        state.homeHistory ?? [],
                        state.loading,
                        "History",
                        "Curated recommendations from library staff members")
                    : SizedBox(height: 1.h),
                // SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
        Container(
          color: FPcolors.colorffffff,
          height: 50.h,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      // width: double.maxFinite,
                      width: 310.w,
                      margin: const EdgeInsets.only(left: 18.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                          color: FPcolors.colorffffff,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        children: [
                          Assets.icons.search.image(width: actionBtnWidth),
                          SizedBox(width: 10.w),
                          Text(
                            'Search',
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
                  InkWell(
                    onTap: () {
                      Get.to(() => const CheckOutScreen());
                    },
                    child: Container(
                      // width: double.maxFinite,
                      margin: const EdgeInsets.only(right: 20.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        children: [
                          state.books.isNotEmpty
                              ? Assets.icons.icon_cart_fill
                                  .image(width: actionBtnWidth)
                              : Assets.icons.cart.image(width: actionBtnWidth),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
