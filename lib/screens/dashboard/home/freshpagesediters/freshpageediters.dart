import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/literarypicks/providers/litterarypicks_slider_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/providers/home_new_provider.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../config/size/size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helper/ClipPad.dart';
import '../models/book_details_modal.dart';
import '../models/home_literarypicks_model.dart';
import '../providers/top_slider_provider.dart';
import 'freshpagesliderprovider.dart';

class FreshPageEditers extends ConsumerWidget /*ConsumerStatefulWidget*/ {
  final List<HomeLiteraryPicks?> slides;

  // const ExploreCategories({Key? key}) : super(key: key);
  const FreshPageEditers({super.key, required this.slides});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homeProviderNew);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          slides.length,
          (index) => SizedBox(
            height: 210.h,
            width: 150.w,
            child: InkWell(
              onTap: () {
                //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
              },
              child: ClipRect(
                  clipper: const ClipPad(
                      padding: EdgeInsets.only(
                          left: 2, top: 5, right: 2, bottom: 5)),
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
                          if (slides[index]!.chapter.toString() != "0") {
                            Get.toNamed(eBookDetails, parameters: {
                              'book_id': slides[index]!.id.toString() ?? ''
                            });
                          } else {
                            Get.toNamed(bookDetails, parameters: {
                              'book_id': slides[index]!.id.toString() ?? ''
                            });
                          }
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
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
                                    child: slides[index]!.coverImage != "null"
                                        ? FancyShimmerImage(
                                            imageUrl:
                                                slides[index]!.coverImage ?? '',
                                            height: 115,
                                            width: 150,
                                          )
                                        : SvgPicture.asset(
                                            Assets.settings.svg.emptyimage),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              SizedBox(
                                width: Get.width * 0.4,
                                child: Text(
                                  slides[index]!.bookTitle.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      fontFamily: 'DM Sans'),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              !slides[index]!.isRead!
                                  ? OutlinedButton(
                                      onPressed: () async {
                                        ref.watch(homeProviderNew).addToCart(
                                            slides[index]!.id.toString());
                                        ref
                                            .watch(homeProviderNew)
                                            .addRemoveFromSelect(
                                                slides[index]!.id.toString());
                                        slides[index]!.isRead = true;
                                      },
                                      child: const Text('Rent'),
                                    )
                                  : OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: FPcolors.fpPrimary,
                                        side: BorderSide(
                                          width: 1.0,
                                          color: FPcolors.fpPrimary,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      onPressed: () async {
                                        ref
                                            .watch(homeProviderNew)
                                            .removeFromCart(slides[index]!.id);
                                        ref
                                            .watch(homeProviderNew)
                                            .addRemoveFromSelect(
                                                slides[index]!.id);
                                        slides[index]!.isRead = false;
                                      },
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
                                          defaultSpacerHorizontalTiny,
                                          SvgPicture.asset(
                                              Assets.settings.svg.iconSelected),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        )),
                  )),

              /*  Material(
                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  shadowColor: FPcolors.color303030,
                  child: InkWell(
                      onTap: () {
                        if (slides[index]!.chapter.toString() != "0") {
                          Get.toNamed(eBookDetails,
                              parameters: {'book_id': slides[index]!.id.toString() ?? ''});
                        } else {
                          Get.toNamed(bookDetails,
                              parameters: {'book_id': slides[index]!.id.toString() ?? ''});
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                                  child: slides[index]!.coverImage != "null"
                                      ? FancyShimmerImage(
                                    imageUrl: slides[index]!.coverImage ?? '',
                                    height: 115,
                                    width: 150,
                                  )
                                      : SvgPicture.asset(Assets.settings.svg.emptyimage),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              width: Get.width * 0.4,
                              child:  Text(
                                slides[index]!.bookTitle.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'DM Sans'),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            !slides[index]!.isRead!
                                ? OutlinedButton(
                              onPressed: () async {
                                ref.watch(homeProviderNew).addToCart(slides[index]!.id.toString());
                                ref.watch(homeProviderNew).addRemoveFromSelect(slides[index]!.id.toString());
                                slides[index]!.isRead = true;
                              },
                              child: const Text('Rent'),
                            )
                                : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: FPcolors.fpPrimary,
                                side: BorderSide(
                                  width: 1.0,
                                  color: FPcolors.fpPrimary,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              onPressed: () async {
                                ref.watch(homeProviderNew).removeFromCart(slides[index]!.id);
                                ref.watch(homeProviderNew).addRemoveFromSelect(slides[index]!.id);
                                slides[index]!.isRead = false;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Rent",
                                      style: TextStyle(
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          color: FPcolors.colorWhite, fontSize: 12)),
                                  defaultSpacerHorizontalTiny,
                                  SvgPicture.asset(Assets.settings.svg.iconSelected),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )))*/ /*FreshPageSliderProvider(
                  id: slides[index]!.id.toString(),
                  image: slides[index]!.coverImage.toString(),
                  title: slides[index]!.bookTitle.toString(), flagRent: slides[index]!.id.toString(),coverCount: slides[index]!.chapter.toString(),isRead:slides[index]!.isRead
              )*/
            ).paddingOnly(left: Get.width * 0.01),
          ),
        ).toList(),
      ),
    );
  }

/*  @override
  FreshPageEditersState createState() => FreshPageEditersState();*/
}

/*class FreshPageEditersState extends ConsumerState<FreshPageEditers> {
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
            height: 210.h,
            width: 150.w,
            child: InkWell(
              onTap: () {
                //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
              },
              child: FreshPageSliderProvider(
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
