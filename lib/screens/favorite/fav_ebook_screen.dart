import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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

class FavEBookScreen extends ConsumerWidget {
  final FavouriteBookPicks? album;
  final Function() onTap;

  const FavEBookScreen({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var state = ref.watch(homeProviderNew);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(Get.width * 0.04),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: Get.width * 0.03),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width * 0.03),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: album?.coverImage != null
                            ? FancyShimmerImage(
                                imageUrl: album?.coverImage ?? '',
                                height: 141,
                                width: 104,
                                boxFit: BoxFit.cover,
                              ) /*Image.network(
                                album?.coverImage ?? '',
                                height: 141,
                                width: 104,
                                fit: BoxFit.cover,
                              )*/
                            : SvgPicture.asset(Assets.settings.svg.emptyimage),
                      ),
                    ),
                    /*Padding(
                      padding:
                      EdgeInsets.all(Get.width * 0.02),
                      child: Assets.icons.favorite_fill
                          .image(width: 25),
                    ),*/
                    Padding(
                      padding: EdgeInsets.all(Get.width * 0.02),
                      child: Icon(
                        Icons.favorite,
                        color: FPcolors.colorBlack,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 90.w,
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
                width: 90,
                child: Text(
                  album?.authorName ?? "",
                  style: AppStyles.slideSubTitleStyle,
                  maxLines: 1,
                ),
              ),
              /*  SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
