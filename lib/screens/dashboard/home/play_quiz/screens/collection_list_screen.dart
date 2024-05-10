import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/font_constant.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';

class CollectionListScreen extends ConsumerStatefulWidget {
  const CollectionListScreen({super.key});

  @override
  CollectionListScreenState createState() => CollectionListScreenState();
}

class CollectionListScreenState extends ConsumerState<CollectionListScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'collection_list_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.watch(selectBookDashboardProvider).getBookReadingChallenge();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Top Collections',
                      style: TextStyle(
                        color: FPcolors.color212121,
                        fontSize: 24,
                        fontFamily: fontFamilyNunitoRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(quizScoreScreen);
                      },
                      child: SvgPicture.asset(
                        Assets.icons.icSearch,
                        height: 28.w,
                        width: 28.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                itemBuilder: (context, index) {
                  return itemViewTopCollections();
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemViewTopCollections() {
    return InkWell(
      onTap: () => Get.toNamed(collectionDetailsScreen),
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 180,
                height: 120,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/180x120"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 86,
              child: Text(
                'Education',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: fontFamilyNunitoRegular,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
