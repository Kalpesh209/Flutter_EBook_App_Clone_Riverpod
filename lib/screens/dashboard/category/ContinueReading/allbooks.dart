import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../home/models/home_literarypicks_model.dart';
import '../providers/category_provider.dart';

class AllBooksScreen extends ConsumerStatefulWidget {
  const AllBooksScreen({super.key});

  @override
  AllBooksScreenState createState() => AllBooksScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class AllBooksScreenState extends ConsumerState<AllBooksScreen> {
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getAllReadBook("1");
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
              : state.allReadBookList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Assets.auth.images.notificationempty
                              .image(width: 200, height: 150),
                          const Text(
                            'No  Data found',
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
                                itemCount: state.allReadBookList?.length,
                                itemBuilder: (ctx, index) {
                                  HomeLiteraryPicks notificationData =
                                      state.allReadBookList![index];
                                  return InkWell(
                                      onTap: () {
                                        debugPrint(
                                            "book id: 583fdef7-bc77-4e40-b83b-a16217f36048");
                                        Get.toNamed(eBookDetails, parameters: {
                                          'book_id':
                                              notificationData!.id.toString()
                                        });
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
                                                                      '',
                                                              height: 100,
                                                              width: 80,
                                                            )
                                                          : SvgPicture.asset(
                                                              Assets
                                                                  .settings
                                                                  .svg
                                                                  .emptyimage,
                                                              width: 80,
                                                              height: 100,
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
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      SizedBox(
                                                        child: Text(
                                                          notificationData.bookTitle.toString(),
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
                                                          notificationData
                                                              .authorName
                                                              .toString(),
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
                                                              Get.width * 0.03),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 70.w,
                                                            child: TagWidget(
                                                              tag: notificationData
                                                                  .contentType,
                                                            ),
                                                          ),
                                                          RatingWidget(
                                                            rating:
                                                                notificationData
                                                                    .rating,
                                                            bookId:
                                                                notificationData
                                                                    .id,
                                                            provider: null,
                                                          ),
                                                          // if (slide.cornerIcon != null) slide.cornerIcon!
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ));
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
