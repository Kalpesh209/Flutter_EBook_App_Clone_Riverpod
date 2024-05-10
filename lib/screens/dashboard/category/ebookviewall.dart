import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/providers/category_provider.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../common/widgets/rating.dart';
import '../../../common/widgets/tag.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/colors/colors.dart';
import '../../../helper/refreshpage.dart';
import '../home/book_challenge/screens/select_book_search_screen.dart';
import '../home/models/book_details_modal.dart';
import '../home/widgets/home_widgets.dart';

class EbookViewAllScreen extends ConsumerStatefulWidget {
  const EbookViewAllScreen({Key? key}) : super(key: key);

  @override
  EbookViewAllScreenState createState() => EbookViewAllScreenState();
}

class EbookViewAllScreenState extends ConsumerState<EbookViewAllScreen>
    with WidgetsBindingObserver {
  List<BookDetailsModal> books = [];
  List<BookDetailsModal> categoryList = [];

  @override
  void initState() {
    super.initState();
    // setVersion();
    WidgetsBinding.instance.addObserver(this);
    // checkPageRefresh();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getEBookList();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint("Call back recoved ");
      ref.watch(categoryProviderNew).getEBookList();
    }
  }

  final TextEditingController searchController = TextEditingController();

  String? version;

  Future<void> _pullRefresh() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getEBookList();
    });
    setState(() {});
    // why use freshNumbers var? https://stackoverflow.com/a/52992836/2301224
  }

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    setState(() {
      version = packageInfo.version;
    });
  }

  void checkPageRefresh() {
    Future.delayed(const Duration(seconds: 2), () async {
      var alreadyAUser = await RefreshPage().getOnce();
      debugPrint('book_id :call back $alreadyAUser');
      if (alreadyAUser == 1) {
        ref.watch(categoryProviderNew).getEBookList();
        RefreshPage().once(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var actionBtnWidth = Get.width * 0.08;
    var state = ref.watch(categoryProviderNew);
    List colors = [
      const Color.fromRGBO(148, 235, 255, 1),
      const Color.fromRGBO(148, 235, 255, 1),
      const Color.fromRGBO(255, 216, 61, 0.6),
      const Color.fromRGBO(83, 236, 172, 1),
      const Color.fromRGBO(148, 235, 255, 1),
      const Color.fromRGBO(241, 208, 201, 1),
      const Color.fromRGBO(250, 115, 45, 0.5),
      const Color.fromRGBO(148, 235, 255, 1),
      const Color.fromRGBO(83, 236, 172, 1),
      const Color.fromRGBO(255, 216, 61, 0.6),
      const Color.fromRGBO(255, 216, 61, 0.6),
      Colors.green,
      Colors.yellow
    ];

    // checkPageRefresh();
    return Stack(children: <Widget>[
      Positioned(
        right: 0,
        top: 0,
        child: Image.asset(
          Assets.background.bgTopCorner.keyName,
          width: Get.width / 1.6,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent, //FPcolors.colorWhite,
        body: state.loading
            ? const Center(child: CircularProgressIndicator())
            : /* RefreshIndicator(
                color: Colors.transparent,
                onRefresh: () async {
                  state.getEBookList();
                },
                child:*/
            RefreshIndicator(
                onRefresh: _pullRefresh,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(Get.width * 0.02),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: InkWell(
                                    onTap: () => {
                                      Get.to(() => const SelectBookSearchScreen(
                                            type: 'Book',
                                          ))
                                    },
                                    child: Container(
                                      // width: double.maxFinite,
                                      margin: const EdgeInsets.only(left: 7.0),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                          color: FPcolors.colorD9D9D9,
                                          border: Border.all(
                                            color: FPcolors.colorD9D9D9,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Row(
                                        children: [
                                          Assets.icons.search
                                              .image(width: actionBtnWidth),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Search books',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w500,
                                              color: FPcolors.color676F74,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        state.continueReadingList.isNotEmpty
                            ? categoryaudioView(state.continueReadingList,
                                state.loading, "Book For You", "e_books")
                            : SizedBox(
                                width: 5.w,
                              ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20.w,
                            right: 16.w,
                            bottom: 1.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Feature Books",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      fontFamily: 'DM Sans',
                                      color: FPcolors.colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 1,
                          ),
                          child: state.featureBooksList.isNotEmpty
                              ? CarouselSlider.builder(
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    height: 150.h,
                                    enlargeCenterPage: false,
                                    enableInfiniteScroll: false,
                                    padEnds: false,
                                    autoPlay: false,
                                  ),
                                  itemCount: state.featureBooksList.length,
                                  itemBuilder: (context, index, realIdx) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        GlobalKey widgetKey = GlobalKey();
                                        var album =
                                            state.featureBooksList[index];
                                        int randomNumber =
                                            Random().nextInt(9) + 1;
                                        return Container(
                                          key: widgetKey,
                                          child: InkWell(
                                            onTap: () => {
                                              Get.toNamed(eBookDetails,
                                                  parameters: {
                                                    'book_id':
                                                        album.id.toString()
                                                  }),
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: Get.width * 0.039,
                                                  right: Get.width * 0.02),
                                              decoration: BoxDecoration(
                                                color: index == 0
                                                    ? Colors
                                                        .yellow //Color.fromRGBO(191, 109, 255, 0.35)
                                                    : index == 1
                                                        ? colors[
                                                            randomNumber] //const Color.fromRGBO(255, 216, 61, 0.6)
                                                        : index == 2
                                                            ? colors[
                                                                randomNumber] //const Color.fromRGBO(83, 236, 172, 1)
                                                            : index == 3
                                                                ? colors[
                                                                    randomNumber] //const Color.fromRGBO(148, 235, 255, 1)
                                                                : index == 4
                                                                    ? colors[
                                                                        randomNumber] //const Color.fromRGBO(241, 208, 201, 1)
                                                                    : index == 5
                                                                        ? colors[
                                                                            randomNumber] //const Color.fromRGBO(250, 115, 45, 0.5)
                                                                        : index ==
                                                                                6
                                                                            ? colors[randomNumber] //const Color.fromRGBO(191, 109, 255, 0.35)
                                                                            : index == 7
                                                                                ? colors[randomNumber] //const Color.fromRGBO(83, 236, 172, 1)
                                                                                : index == 8
                                                                                    ? colors[randomNumber] //const Color.fromRGBO(255, 216, 61, 0.6)
                                                                                    : index == 9
                                                                                        ? colors[randomNumber] //const Color.fromRGBO(255, 216, 61, 0.6)
                                                                                        : const Color.fromRGBO(255, 216, 61, 0.6),
                                                //FPcolors.colorFBDB6A,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Get.width * 0.04),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.all(
                                                        Get.width * 0.03),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Get.width * 0.04),
                                                      border: Border.all(
                                                          color: FPcolors
                                                              .colorWhite),
                                                    ),
                                                    child: Material(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Get.width *
                                                                    0.04),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        elevation: 4,
                                                        shadowColor: FPcolors
                                                            .color303030,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      Get.width *
                                                                          0.04),
                                                          child: album.coverImage !=
                                                                  null
                                                              ? FancyShimmerImage(
                                                                  imageUrl:
                                                                      album.coverImage ??
                                                                          '',
                                                                  height: 120,
                                                                  width: 180,
                                                                  boxFit: BoxFit
                                                                      .cover,
                                                                )
                                                              /*Image.network(
                                                                      album.coverImage ??
                                                                          '',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height: 120,
                                                                      width: 180,
                                                                      errorBuilder:
                                                                          (context,
                                                                              error,
                                                                              stackTrace) {
                                                                        return SvgPicture.asset(Assets
                                                                            .settings
                                                                            .svg
                                                                            .emptyimage);
                                                                      },
                                                                    )*/
                                                              : SvgPicture
                                                                  .asset(Assets
                                                                      .settings
                                                                      .svg
                                                                      .emptyimage),
                                                        )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 1.w),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        SizedBox(
                                                          width: 120.w,
                                                          child: Text(
                                                            album.bookTitle ??
                                                                '',
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 14.sp,
                                                              fontFamily:
                                                                  'DM Sans',
                                                              color: FPcolors
                                                                  .colorBlack,
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 120.w,
                                                          child: Text(
                                                            album.authorName ??
                                                                '',
                                                            style: AppStyles
                                                                .slideSubTitleStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: Get.width *
                                                                0.02),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 70.w,
                                                              child: TagWidget(
                                                                tag: album
                                                                    .contentType,
                                                              ),
                                                            ),
                                                            RatingWidget(
                                                              rating:
                                                                  album.rating,
                                                              bookId: album.id,
                                                              provider: null,
                                                            ),
                                                            // if (slide.cornerIcon != null) slide.cornerIcon!
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })
                              : SizedBox(height: 1.h),
                        ),
                        /*
                            state.featureBooksList.isNotEmpty ?
                            InkWell(
                                    onTap: () => {
                                      Get.toNamed(eBookDetails, parameters: {
                                        'book_id': state.featureBooksList[0].id
                                            .toString()
                                      }),
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Get.width * 0.039,
                                          right: Get.width * 0.02),
                                      decoration: BoxDecoration(
                                        color: FPcolors.colorFBDB6A,
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(Get.width * 0.03),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                  Get.width * 0.04),
                                              border: Border.all(
                                                  color: FPcolors.colorWhite),
                                            ),
                                            child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Get.width * 0.04),
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 4,
                                                shadowColor: FPcolors.color303030,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(Get.width * 0.04),
                                                  child:
                                                      state.featureBooksList[0]
                                                                  .coverImage !=
                                                              null
                                                          ? Image.network(
                                                              state.featureBooksList[0].coverImage ??
                                                                  '',
                                                              fit: BoxFit.cover,
                                                              height: 120,
                                                              width: 189,
                                                              errorBuilder:
                                                                  (context, error,
                                                                      stackTrace) {
                                                                return SvgPicture
                                                                    .asset(Assets
                                                                        .settings
                                                                        .svg
                                                                        .emptyimage);
                                                              },
                                                            )
                                                          : SvgPicture.asset(
                                                              Assets.settings.svg
                                                                  .emptyimage),
                                                )),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 1.w),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 1.h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  width: 120.w,
                                                  child: Text(
                                                    state.featureBooksList[0]
                                                            .bookTitle ??
                                                        '',
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'DM Sans',
                                                      color: FPcolors.colorBlack,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 120.w,
                                                  child: Text(
                                                    state.featureBooksList[0]
                                                            .authorName ??
                                                        '',
                                                    style: AppStyles
                                                        .slideSubTitleStyle,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: Get.width * 0.02),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: TagWidget(
                                                        tag: state
                                                            .featureBooksList[0]
                                                            .contentType,
                                                      ),
                                                    ),
                                                    RatingWidget(
                                                      rating: state
                                                          .featureBooksList[0]
                                                          .rating,
                                                      bookId: state
                                                          .featureBooksList[0]
                                                          .id,
                                                      provider: null,
                                                    ),
                                                    // if (slide.cornerIcon != null) slide.cornerIcon!
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Get.width * 0.01),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ) : SizedBox(height: 1.h),*/
                        const SizedBox(height: 10),
                        state.categoryList.isNotEmpty
                            ? categoryView(state.categoryList, state.loading,
                                "Categories", "")
                            : const SizedBox(
                                width: 10,
                              ),
                        SizedBox(height: Get.width * 0.05),
                        state.historyEBook.isNotEmpty
                            ? ebookHistory(state.historyEBook, state.loading,
                                "History", "")
                            : const SizedBox(
                                width: 10,
                              ),
                        // SizedBox(height: Get.width * 0.02),
                        state.hinduLibraryList.isNotEmpty
                            ? hinduLibrary(state.hinduLibraryList,
                                state.loading, "Hindu Library", "")
                            : const SizedBox(
                                width: 10,
                              ),
                        state.sportLibraryList.isNotEmpty
                            ? ebookHistory(state.sportLibraryList,
                                state.loading, "Sport", "")
                            : const SizedBox(
                                width: 10,
                              ),
                        state.spiritualLibraryList.isNotEmpty
                            ? hinduLibrary(state.spiritualLibraryList,
                                state.loading, "Spiritual", "")
                            : const SizedBox(
                                width: 10,
                              ),
                        state.freedomFighterlistList.isNotEmpty
                            ? hinduLibrary(state.freedomFighterlistList,
                                state.loading, "Freedom Fighter", "")
                            : const SizedBox(
                                width: 10,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    ]);
  }
}
