import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';

import '../../../common/widgets/rating.dart';
import '../../../common/widgets/tag.dart';
import '../../../config/app_text_styles.dart';
import '../../common_model/favourite_book_model.dart';
import '../dashboard/home/models/home_literarypicks_model.dart';

class AudioFavBookScreen extends ConsumerWidget {
  final FavouriteBookPicks? album;
  final Function() onTap;

  const AudioFavBookScreen({
    super.key,
    required this.album,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var state = ref.watch(homeProviderNew);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            left: Get.width * 0.05,
            right: Get.width * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Get.width * 0.04),
            /* border: Border.all(color: FPcolors.greyBorder),*/
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.03,
                    top: Get.width * 0.03,
                    bottom: Get.width * 0.03),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width * 0.03),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: album?.coverImage != null
                            ? Image.network(
                                album?.coverImage ?? '',
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.asset(Assets.settings.svg.emptyimage),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: Get.width * 0.035,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.w,
                    vertical: 1.h,
                  ),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            album?.bookTitle ?? '',
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
                          child: Text(
                            album?.authorName ?? "",
                            style: AppStyles.slideSubTitleStyle,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 90.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                                onTap: () async {
                                  /* ref.watch(homeProviderNew).removeFromCart(album?.id);
                                ref.watch(homeProviderNew).addRemoveFromSelect(album?.id);*/
                                },
                                child: Assets.icons.favorite_fill
                                    .image(width: Get.width * 0.06))
                          ],
                        ))
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
