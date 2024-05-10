import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/providers/category_provider.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../common/widgets/rating.dart';
import '../../../common/widgets/tag.dart';
import '../../../config/colors/colors.dart';
import '../home/models/book_details_modal.dart';
import '../home/models/home_literarypicks_model.dart';
import '../home/widgets/home_widgets.dart';
import 'bliss_category_screen.dart';

class AudioViewAllScreen extends ConsumerStatefulWidget {
  const AudioViewAllScreen({Key? key}) : super(key: key);

  @override
  AudioViewAllScreenState createState() => AudioViewAllScreenState();
}

class AudioViewAllScreenState extends ConsumerState<AudioViewAllScreen> {
  List<BookDetailsModal> books = [];
  List<BookDetailsModal> categoryList = [];

  @override
  void initState() {
    super.initState();
    // setVersion();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getAudioList();
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

    Widget Spacer = SizedBox(height: Get.height * 0.03);
    return Scaffold(
      backgroundColor: FPcolors.colorWhite,
      appBar: AppBar(
        // foregroundColor: paleBg,
        centerTitle: false,
        title: Text(
          'Audio Books',
          style: TextStyle(fontSize: 18, color: FPcolors.colorBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.01),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          controller: searchController,
                          onChanged: (searchTerm) {},
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            filled: true,
                            fillColor: FPcolors.colorD9D9D9,
                            hintText: "Search books",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: FPcolors.colorD9D9D9,
                                width: 1,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                              color: Color(0xff090A0A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer,
              audiobookAdventure(state.audioBookAdventure, state.loading,
                  "Audiobook Adventure", "audiobook_adventure"),
              SizedBox(height: Get.width * 0.02),
              headingTitleCategory(
                "Category Bliss",
                "",
                () => Get.to(() => const BlissCategoryScreen()),
              ),
              SizedBox(
                height: 5,
              ),
              // Audiobook Adventure
              state.audioCategoryList!.isNotEmpty
                  ? CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        height: 150.h,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        padEnds: false,
                        autoPlay: false,
                      ),
                      itemCount: state.audioCategoryList?.length,
                      itemBuilder: (context, index, realIdx) {
                        return Builder(
                          builder: (BuildContext context) {
                            GlobalKey widgetKey = GlobalKey();

                            HomeLiteraryPicks? data =
                                state.audioCategoryList?[index];
                            int randomNumber = Random().nextInt(9) + 1;
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Container(
                                margin:
                                    EdgeInsets.only(right: Get.width * 0.02),
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
                                                          : index == 6
                                                              ? colors[
                                                                  randomNumber] //const Color.fromRGBO(191, 109, 255, 0.35)
                                                              : index == 7
                                                                  ? colors[
                                                                      randomNumber] //const Color.fromRGBO(83, 236, 172, 1)
                                                                  : index == 8
                                                                      ? colors[
                                                                          randomNumber] //const Color.fromRGBO(255, 216, 61, 0.6)
                                                                      : index ==
                                                                              9
                                                                          ? colors[
                                                                              randomNumber] //const Color.fromRGBO(255, 216, 61, 0.6)
                                                                          : const Color
                                                                              .fromRGBO(
                                                                              255,
                                                                              216,
                                                                              61,
                                                                              0.6),
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.04),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(Get.width * 0.04),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04),
                                        border: Border.all(
                                            color: FPcolors.colorWhite),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Get.width * 0.04),
                                            child: FancyShimmerImage(
                                              imageUrl:
                                                  data!.coverImage.toString(),
                                              height: 145,
                                              width: 90,
                                            ),
                                          ),
                                          Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 40.r,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1.w),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 1.h,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              data.bookTitle ?? '',
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
                                            width: 120.w,
                                            child: Text(
                                              data.authorName ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                fontFamily: 'DM Sans',
                                                color: FPcolors.color6C7072,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(height: Get.width * 0.02),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 70.w,
                                                child: TagWidget(
                                                  tag: data.contentType,
                                                ),
                                              ),
                                              RatingWidget(
                                                rating: data.rating,
                                                bookId: data.id,
                                                provider: null,
                                              ),
                                              // if (slide.cornerIcon != null) slide.cornerIcon!
                                            ],
                                          ),
                                          SizedBox(height: Get.width * 0.05),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  Assets.icons.audioplay),
                                              SizedBox(width: Get.width * 0.01),
                                              Text(
                                                'Play now',
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'DM Sans',
                                                  color: FPcolors.colorBlack,
                                                ),
                                                maxLines: 1,
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
                            );
                          },
                        );
                      })
                  : const SizedBox(
                      width: 1,
                    ),
              SizedBox(height: Get.width * 0.03),
              audioAuthorsNotes(
                  state.authorNotesList, state.loading, "Author’s Notes", ""),
              audiobookRegional(
                  state.regionalList, state.loading, "Regional", "Regional"),
              audiobookAdventure(state.literatureList, state.loading,
                  "Literature", "audiobook_adventure"),
            ],
          ),
        ),
      ),
    );
  }
}
