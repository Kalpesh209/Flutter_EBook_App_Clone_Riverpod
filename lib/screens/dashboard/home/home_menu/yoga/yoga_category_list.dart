import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/provider/yoga_category_list_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_list_item.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import 'modals/yoga_category_response.dart';

class YogaCategoryList extends ConsumerWidget {
  final ContentType category;
  final bool hideTitle;

  const YogaCategoryList(this.category, {Key? key, this.hideTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(yogaCategoryListProvider(category));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hideTitle == false)
          titleSection(((state.albums.length ?? 0) > 0)
              ? (state.albums[0].id ?? '')
              : ''),
        if (hideTitle == false) SizedBox(height: Get.height * 0.01),
        SizedBox(
          height: 240.h,
          child: state.loading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          height: Get.width * 0.4,
                          width: Get.width * 0.6,
                        ),
                      ).paddingOnly(left: 10),
                    ],
                  ),
                )
              : state.albums.isEmpty
                  ? Container(
                      margin: EdgeInsets.all(Get.width * 0.04),
                      decoration: BoxDecoration(
                        color: FPcolors.fpPrimaryLight1,
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                      ),
                      child: const Center(
                        child: Text('No Albums Found'),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.albums.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        var album = state.albums[index];
                        return YogaListItem(
                          album: album,
                          onTap: () {
                            album.categoryId = category.categoryId ?? '';
                            Get.toNamed(
                              yogaDetails,
                              parameters: {'book_id': album.id ?? ''},
                            );
                            // ref
                            //     .watch(musicScreenProvider)
                            //     .addLastPlayedId(album.id!);
                          },
                        );
                      },
                    ),
        )
      ],
    );
  }

  Widget titleSection(String bookId) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category.categoryName ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(32.r),
            onTap: () {
              // Get.to(() => YogaPlayerScreen(
              //     BookDetailsModal(categoryId: category.categoryId ?? '')));
              // todo sid
              Get.toNamed(
                yogaDetails,
                parameters: {'book_id': bookId},
              );
            },
            child: Image.asset(
              Assets.icons.icPlayCircle.keyName,
              height: 32.h,
              width: 32.h,
            ),
          ),
          //.paddingAll(Get.width * 0.04)
        ],
      ),
    );
  }
}
