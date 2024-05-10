import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/components.dart';
import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../book_challenge/screens/select_book_search_screen.dart';
import '../models/home_literarypicks_model.dart';
import '../providers/home_new_provider.dart';

class CategoryViewScreen extends ConsumerStatefulWidget {
  final String title;
  final String categoryId;
  final String type;

  const CategoryViewScreen(
      {super.key,
      required this.title,
      required this.categoryId,
      required this.type});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends ConsumerState<CategoryViewScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("Category Id ${widget.categoryId}");

      ref
          .watch(homeProviderNew)
          .getBookCategoryWise(widget.categoryId, widget.type);
    });
    // FirebaseAnalytics.instance.logEvent(name: notificationScreen);
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
          // backgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            actions: [
              SizedBox(width: Get.width * 0.04),
              InkWell(
                onTap: () {
                  Get.to(() => const SelectBookSearchScreen(
                        type: 'history',
                      ));
                },
                child: Assets.icons.search.image(width: actionBtnWidth),
              ),
              SizedBox(width: Get.width * 0.04),
            ],
          ),
          body: state.loading
              ? loadingCenter()
              : state.listBookCategoryWise!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.auth.images.notificationempty
                              .image(width: 200, height: 150),
                          const Text(
                            'No Data Found',
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
                            /* InkWell(
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
                            SizedBox(height: Get.width * 0.04),*/
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.listBookCategoryWise?.length,
                                itemBuilder: (ctx, index) {
                                  HomeLiteraryPicks? notificationData =
                                      state.listBookCategoryWise?[index];
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                          "book id: 583fdef7-bc77-4e40-b83b-a16217f36048");
                                      Get.toNamed(eBookDetails, parameters: {
                                        'book_id':
                                            notificationData!.id.toString()
                                      });

                                      /*  if(notificationData?.bookUsage == "EBOOK_ONLY"){
                                      Get.toNamed(eBookDetails, parameters: {'book_id':notificationData!.id.toString() });
                                    }else{
                                      Get.toNamed(bookDetails, parameters: {'book_id':notificationData!.id.toString() });
                                    }*/
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
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                    child: notificationData
                                                                ?.coverImage !=
                                                            null
                                                        ? FancyShimmerImage(
                                                            imageUrl:
                                                                notificationData
                                                                        ?.coverImage ??
                                                                    "",
                                                            height: 100,
                                                            width: 80,
                                                          )
                                                        /* Image.network(
                                                    notificationData?.coverImage ?? '',
                                                    height: 100,
                                                    width: 80,
                                                    fit: BoxFit.cover,
                                                  )*/
                                                        : SvgPicture.asset(
                                                            Assets.settings.svg
                                                                .emptyimage,
                                                            height: 100,
                                                            width: 80,
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                                vertical: 1.h,
                                              ),
                                              child: SizedBox(
                                                width: 125.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        notificationData
                                                                ?.bookTitle ??
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
                                                      child: Text(
                                                        notificationData
                                                                ?.authorName ??
                                                            '',
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
                                                        notificationData
                                                                    ?.contentType !=
                                                                null
                                                            ? SizedBox(
                                                                width: 70.w,
                                                                child:
                                                                    TagWidget(
                                                                  tag: notificationData
                                                                          ?.contentType ??
                                                                      '',
                                                                ),
                                                              )
                                                            : SizedBox(
                                                                height:
                                                                    Get.width *
                                                                        0.01),
                                                        RatingWidget(
                                                          rating:
                                                              notificationData
                                                                  ?.rating,
                                                          bookId:
                                                              notificationData
                                                                  ?.id,
                                                          provider: null,
                                                        ),
                                                        // if (slide.cornerIcon != null) slide.cornerIcon!
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          /* Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              notificationData?.isRead == true
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
                                                          ref.watch(homeProviderNew).removeFromCart(notificationData?.id);
                                                          ref.watch(homeProviderNew).addRemoveFromSelect(notificationData?.id);

                                                          notificationData?.isRead = false;
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
                                                              notificationData?.id);
                                                          ref
                                                              .watch(
                                                              homeProviderNew)
                                                              .addRemoveFromSelect(
                                                              notificationData?.id);
                                                          notificationData?.isRead = true;
                                                        },
                                                        child: const Text(
                                                            'Rent'),
                                                      ),
                                                    ],
                                                  ))
                                            ])*/
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
        )
      ],
    );
  }
}

void doNothing(BuildContext context) {}
