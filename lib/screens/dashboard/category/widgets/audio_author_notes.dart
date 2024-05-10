import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../home/models/home_literarypicks_model.dart';
import '../../home/widgets/top_slider/top_slider_slide.dart';
import '../models/audio_auther_model.dart';

class AudioAuthorsItem extends StatelessWidget {
  final List<AuthorNotes?> album;
  final Function() onTap;

  const AudioAuthorsItem({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            album.length,
            (index) => SizedBox(
                  width: Get.width / 4,
                  child: InkWell(
                    onTap: () {
                      //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.w),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(
                                width: 1, //
                              )),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              radius: 18,
                              child: ClipOval(
                                child: album[index]?.image != "null"
                                    ? Image.network(
                                        color: FPcolors.colorWhite,
                                        album[index]?.image ?? '',
                                        width: 200.w,
                                        height: 200.w,
                                        fit: BoxFit.fill,
                                      )
                                    : SvgPicture.asset(
                                        Assets.settings.svg.emptyimage),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          height: 1,
                          child: const Text(
                            '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                )).toList(),
      ),
    );
  }
}
