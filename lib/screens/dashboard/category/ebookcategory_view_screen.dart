import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/components.dart';
import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../home/models/home_literarypicks_model.dart';
import '../home/providers/home_new_provider.dart';

class EbookCategoryViewScreen extends ConsumerStatefulWidget {
  final String title;
  final String categoryId;

  const EbookCategoryViewScreen(
      {super.key, required this.title, required this.categoryId});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends ConsumerState<EbookCategoryViewScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("Category Id ${widget.categoryId}");

      ref
          .watch(homeProviderNew)
          .getBookCategoryWise(widget.categoryId, "EBOOK_ONLY");
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
          backgroundColor: Colors.transparent,
          appBar: FpAppBar(title: widget.title, backButtonRequired: true),
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
                              child: ListView.builder(
                                itemCount: state.listBookCategoryWise?.length,
                                itemBuilder: (ctx, index) {
                                  HomeLiteraryPicks? notificationData =
                                      state.listBookCategoryWise?[index];
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                          "book id: 583fdef7-bc77-4e40-b83b-a16217f36048");

                                      if (notificationData?.chapter != 0) {
                                        Get.toNamed(eBookDetails, parameters: {
                                          'book_id':
                                              notificationData!.id.toString()
                                        });
                                      } else {
                                        Get.toNamed(bookDetails, parameters: {
                                          'book_id':
                                              notificationData!.id.toString()
                                        });
                                      }

                                      /*  widget.title == 'Continue Reading'?  Get.toNamed(eBookDetails, parameters: {'book_id': "583fdef7-bc77-4e40-b83b-a16217f36048"})
                                    : widget.title == "Maths"?Get.toNamed(audioDetails, parameters: {'book_id': "583fdef7-bc77-4e40-b83b-a16217f36048"})
                                        : Get.toNamed(bookDetails, parameters: {'book_id': "583fdef7-bc77-4e40-b83b-a16217f36048"});*/
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
                                                        ? Image.network(
                                                            notificationData
                                                                    ?.coverImage ??
                                                                '',
                                                            height: 100,
                                                            width: 80,
                                                            fit: BoxFit.cover,
                                                          )
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
                                                        notificationData?.tag ??
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
                                                        SizedBox(
                                                          width: 70.w,
                                                          child: TagWidget(
                                                            tag: notificationData
                                                                    ?.bookTag ??
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
