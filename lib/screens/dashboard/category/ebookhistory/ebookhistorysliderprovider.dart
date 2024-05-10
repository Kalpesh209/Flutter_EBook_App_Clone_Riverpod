import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';

class EbookHistoryliderProvider extends StatelessWidget {
  final String image;
  final String title;
  final String id;
  final int? chapter;
  final String flagRent;
  final String lastReadChapterId;

  const EbookHistoryliderProvider({
    Key? key,
    required this.image,
    required this.title,
    required this.id,
    required this.chapter,
    required this.flagRent,
    required this.lastReadChapterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        clipBehavior: Clip.antiAlias,
        // elevation: 4,
        // shadowColor: FPcolors.color303030,
        child: InkWell(
            onTap: () {
             /* Get.toNamed(eBookDetails, parameters: {
                'book_id': id ?? ''
              });*/

              debugPrint("Last chapter id $lastReadChapterId");


              if(lastReadChapterId==null){
                Get.toNamed(chapterReadDirect, parameters: {
                  'book_id': id.toString(),
                  'chapterId': lastReadChapterId.toString(),
                  'bookName':title.toString()
                });
              }else{
                Get.toNamed(eBookDetails, parameters: {
                  'book_id': id ?? ''
                });
              }

            },
            child: Container(
              margin: const EdgeInsets.only(/*left: 8,*/right: 10,/*top: 8*/),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                        child: image != null ?FancyShimmerImage(
                          imageUrl: image ?? '',
                          height: Get.width * 0.33,
                          width: Get.width * 0.4,
                          boxFit: BoxFit.cover,
                        ): SvgPicture.asset(Assets.settings.svg.emptyimage),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  SizedBox(
                    width: 100,
                    child:  Text(
                      title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          fontFamily: 'DM Sans'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
