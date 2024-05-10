import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/literarypicks/providers/litterarypicks_slider_provider.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/route/route_names.dart';
import '../../../../../config/size/size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helper/ClipPad.dart';
import '../../models/book_details_modal.dart';
import '../../models/home_literarypicks_model.dart';
import '../../providers/home_new_provider.dart';
import '../../providers/top_slider_provider.dart';
import '../../widgets/top_slider/top_slider_slide.dart';

class LiteraryPicks extends /*StatelessWidget*/ ConsumerWidget {
  final List<HomeLiteraryPicks?> slides;

  // const ExploreCategories({Key? key}) : super(key: key);
  const LiteraryPicks({super.key, required this.slides});

/*  @override
  LiteraryPicksState createState() => LiteraryPicksState();*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homeProviderNew);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          slides.length,
          (index) => SizedBox(
            width: Get.width / 3.5,
            child: InkWell(
              onTap: () {
                if (slides[index]!.bookUsage == "EBOOK_ONLY") {
                  Get.toNamed(eBookDetails, parameters: {
                    'book_id': slides[index]!.id.toString() ?? ''
                  });
                } else {
                  Get.toNamed(bookDetails, parameters: {
                    'book_id': slides[index]!.id.toString() ?? ''
                  });
                }
              },
              child: ClipRect(
                  clipper: const ClipPad(
                      padding: EdgeInsets.only(
                          left: 2, top: 10, right: 2, bottom: 10)),
                  child: Container(
                    margin: const EdgeInsets.only(right: 3.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                        boxShadow: [
                          BoxShadow(
                            color: FPcolors.colorD9D9D9,
                            blurRadius: 10,
                          )
                        ]),
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(bookDetails, parameters: {
                            'book_id': slides[index]!.id.toString() ?? ''
                          });
                          /*if (slides[index]!.chapter.toString() != "0") {
                          Get.toNamed(eBookDetails, parameters: {
                            'book_id': slides[index]!.id.toString() ?? ''
                          });
                        } else {
                          Get.toNamed(bookDetails, parameters: {
                            'book_id': slides[index]!.id.toString() ?? ''
                          });
                        }*/
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 9, right: 7, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    child:
                                        slides[index]!.coverImage.toString() !=
                                                "null"
                                            ? FancyShimmerImage(
                                                imageUrl: slides[index]!
                                                        .coverImage
                                                        .toString() ??
                                                    '',
                                                height: Get.width * 0.33,
                                                width: Get.width * 0.4,
                                              )
                                            : SvgPicture.asset(
                                                Assets.settings.svg.emptyimage),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              SizedBox(
                                width: Get.width * 0.4,
                                height: 40,
                                child: Text(
                                  maxLines: 2,
                                  slides[index]!.bookTitle.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      fontFamily: 'DM Sans'),
                                ),
                              ),
                              !slides[index]!.isRead!
                                  ? OutlinedButton(
                                      onPressed: () async {
                                        state.addToCart(
                                            slides[index]!.id.toString());
                                        state.addRemoveFromSelect(
                                            slides[index]!.id.toString());

                                        slides[index]!.isRead = true;
                                      },
                                      child: const Text('Rent'),
                                    )
                                  : OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: FPcolors.fpPrimary,
                                        side: BorderSide(
                                          color: FPcolors.fpPrimary,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      onPressed: () async {
                                        state.removeFromCart(
                                            slides[index]!.id.toString());
                                        state.addRemoveFromSelect(
                                            slides[index]!.id.toString());
                                        slides[index]!.isRead = false;
                                      },
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Rent",
                                                style: TextStyle(
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w500,
                                                    color: FPcolors.colorWhite,
                                                    fontSize: 12)),
                                            SvgPicture.asset(Assets
                                                .settings.svg.iconSelected),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )),
                  )),

              /*  Material(
                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shadowColor: FPcolors.colorD9D9D9,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(bookDetails, parameters: {
                          'book_id': slides[index]!.id.toString() ?? ''
                        });
                        */
              /*if (slides[index]!.chapter.toString() != "0") {
                          Get.toNamed(eBookDetails, parameters: {
                            'book_id': slides[index]!.id.toString() ?? ''
                          });
                        } else {
                          Get.toNamed(bookDetails, parameters: {
                            'book_id': slides[index]!.id.toString() ?? ''
                          });
                        }*/
              /*
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 9, right: 7, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                                  child: slides[index]!.coverImage.toString() !=
                                          "null"
                                      ? FancyShimmerImage(
                                          imageUrl: slides[index]!
                                                  .coverImage
                                                  .toString() ??
                                              '',
                                          height: Get.width * 0.33,
                                          width: Get.width * 0.4,
                                        )
                                      : SvgPicture.asset(
                                          Assets.settings.svg.emptyimage),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              width: Get.width * 0.4,
                              height: 40,
                              child: Text(
                                maxLines: 2,
                                slides[index]!.bookTitle.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'DM Sans'),
                              ),
                            ),
                            !slides[index]!.isRead!
                                ? OutlinedButton(
                                    onPressed: () async {
                                      state.addToCart(
                                          slides[index]!.id.toString());
                                      state.addRemoveFromSelect(
                                          slides[index]!.id.toString());

                                      slides[index]!.isRead = true;
                                    },
                                    child: const Text('Rent'),
                                  )
                                : OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: FPcolors.fpPrimary,
                                      side: BorderSide(
                                        color: FPcolors.fpPrimary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    onPressed: () async {
                                      state.removeFromCart(
                                          slides[index]!.id.toString());
                                      state.addRemoveFromSelect(
                                          slides[index]!.id.toString());
                                      slides[index]!.isRead = false;
                                    },
                                  child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Rent",
                                              style: TextStyle(
                                                  fontFamily: 'DM Sans',
                                                  fontWeight: FontWeight.w500,
                                                  color: FPcolors.colorWhite,
                                                  fontSize: 12)),
                                          SvgPicture.asset(
                                              Assets.settings.svg.iconSelected),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ))),*/
            ).paddingOnly(left: 4, bottom: 10, top: 5),
          ),
        ).toList(),
      ),
    );
  }
}

/*class LiteraryPicksState extends ConsumerState<LiteraryPicks> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(topSliderProvider).getEbooksCarousel();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(topSliderProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          state.carouselBooks.length,
          (index) => SizedBox(
            height: 240.h,
            width: 120.w,
            child: InkWell(
              onTap: () {
                //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
              },
              child: LiteraryPicksSliderProvider(
                image: state.carouselBooks[index].coverImage!,
                title: state.carouselBooks[index].bookTitle!,
                flagRent: "true",
              ).paddingOnly(left: Get.width * 0.01),
            ),
          ),
        ).toList(),
      ),
    );
  }
}*/
