import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../config/size/size.dart';
import '../../../../gen/assets.gen.dart';
import '../providers/home_new_provider.dart';

class FreshPageSliderProvider extends ConsumerWidget {
  final String id;
  final String image;
  final String title;
  final String flagRent;
  final String coverCount;
  final bool? isRead;

  const FreshPageSliderProvider({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.flagRent,
    required this.coverCount,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shadowColor: FPcolors.color303030,
        child: InkWell(
            onTap: () {
              if (coverCount != "0") {
                Get.toNamed(eBookDetails,
                    parameters: {'book_id': flagRent ?? ''});
              } else {
                Get.toNamed(bookDetails,
                    parameters: {'book_id': flagRent ?? ''});
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
                        child: image != "null"
                            ? FancyShimmerImage(
                          imageUrl: image ?? '',
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
                      title.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          fontFamily: 'DM Sans'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  !isRead!
                      ? OutlinedButton(
                    onPressed: () async {
                      ref.watch(homeProviderNew).removeFromCart(id);
                      ref.watch(homeProviderNew).addRemoveFromSelect(id);
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
                      ref.watch(homeProviderNew).removeFromCart(id);
                      ref.watch(homeProviderNew).addRemoveFromSelect(id);
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
            )));
  }
}
