
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../home/book_challenge/screens/select_book_search_screen.dart';
import '../../home/models/home_literarypicks_model.dart';
import '../../notification/notification_provider.dart';
import '../../notification/notificaton_response.dart';
import '../providers/category_provider.dart';

class AudioBookAdventureViewAllScreen extends ConsumerStatefulWidget {
  final String title;


  const AudioBookAdventureViewAllScreen({super.key, required this.title});

  @override
  AudioBookAdventureViewAllScreenState createState() => AudioBookAdventureViewAllScreenState();
}
enum SampleItem { itemOne, itemTwo, itemThree }

class AudioBookAdventureViewAllScreenState extends ConsumerState<AudioBookAdventureViewAllScreen> {

  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).audioBookView();
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
            title: Text(widget.title),
            centerTitle: true,
            actions: [
              SizedBox(width: Get.width * 0.04),
              InkWell(
                onTap: () {
                  Get.to(() => const SelectBookSearchScreen(
                    type: 'book',
                  ));
                },
                child: Assets.icons.search.image(width: actionBtnWidth),

              ),
              SizedBox(width: Get.width * 0.04),
            ],
          ),
          body: state.loading
              ? loadingCenter()
              : state.audioBookViewAll!.isEmpty
              ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.auth.images.notificationempty.image(width: 200, height: 150),
                const Text(
                  'No TopPicks getting',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ) : Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children:<Widget> [
                  SizedBox(height: Get.width * 0.04),
                  Expanded(child: ListView.builder(
                    itemCount: state.audioBookViewAll?.length,
                    itemBuilder: (ctx, index) {
                      HomeLiteraryPicks audioBookViewAll = state.audioBookViewAll![index];
                      return
                        InkWell(
                            onTap: () {
                              Get.toNamed(audioDetails, parameters: {'book_id': audioBookViewAll.id.toString()});
                            },
                            child:Container( margin: EdgeInsets.only(
                                left: Get.width * 0.05,
                                bottom: Get.width * 0.02,
                                right: Get.width * 0.05),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(Get.width * 0.04),
                                border: Border.all(color: FPcolors.greyBorder),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.03,
                                        top: Get.width * 0.03,
                                        bottom: Get.width * 0.03),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Get.width * 0.03),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                            child:FancyShimmerImage(
                                              imageUrl:
                                              audioBookViewAll!.coverImage.toString(),
                                              height: 100,
                                              width: 80,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: 1.w),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 1.h,
                                      ),
                                      child: SizedBox(
                                        width: 125.w,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                audioBookViewAll.bookTitle ?? "",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'DM Sans',
                                                  color: FPcolors.colorBlack,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                audioBookViewAll.authorName ?? "",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'DM Sans',
                                                  color: FPcolors.color6C7072,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(height: Get.width * 0.01),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 70.w,
                                                  child:  TagWidget(
                                                    tag: audioBookViewAll.contentType,
                                                  ),
                                                ),
                                                 RatingWidget(
                                                  rating: audioBookViewAll.rating,
                                                  bookId: audioBookViewAll.id,
                                                  provider: null,
                                                ),
                                                // if (slide.cornerIcon != null) slide.cornerIcon!
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),

                                ],
                              ),)

                        );
                    },
                  ),)
                ]),
          ),

        )
      ],
    );
  }
}