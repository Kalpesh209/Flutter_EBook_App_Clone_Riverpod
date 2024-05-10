import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/providers/select_book_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class SelectBookScreen extends ConsumerStatefulWidget {
  const SelectBookScreen({super.key});

  @override
  SelectBookScreenState createState() => SelectBookScreenState();
}

class SelectBookScreenState extends ConsumerState<SelectBookScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  dynamic argumentData = Get.arguments;
  String? myPoints = '';

  @override
  void initState() {
    super.initState();
    if (argumentData != null) {
      myPoints = argumentData['my_points'];
    }
    FirebaseAnalytics.instance
        .logEvent(name: 'open_select_book_for_challenge_screen');
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    ref.watch(selectBookScreenProvider).listOfBooks = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(selectBookScreenProvider);

    return Stack(
      children: [
        Positioned.fill(child: Container(color: FPcolors.fpPrimaryLight1)),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.background.bgTopCorner.keyName,
            width: Get.width / 1.6,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Select Book'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width * 0.95,
                height: 45.h,
                decoration: BoxDecoration(
                  color: FPcolors.colorWhite,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: FPcolors.colorD8D5D5,
                    width: 0.5,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                /*      constraints:
                    BoxConstraints(maxHeight: 160.0, maxWidth: Get.width * 08),*/
                child: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  dividerColor: FPcolors.colorWhite,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    // Creates border
                    color: FPcolors.fpPrimary,
                  ),
                  labelColor: FPcolors.colorWhite,
                  unselectedLabelColor: FPcolors.fpPrimary,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Library book'),
                    Tab(text: 'E-book'),
                  ],
                  onTap: state.onTabChange,
                ),
              ),
              InkWell(
                onTap: () => state.searchBook(_tabController.index),
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(
                    vertical: 24.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                      color: FPcolors.colorF2F4F5,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Row(
                    children: [
                      const Icon(Icons.search_rounded),
                      SizedBox(width: 16.w),
                      Text(
                        'Search book to challenge',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: FPcolors.colorC0C0C0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: FPcolors.colorWhite,
                    borderRadius: BorderRadius.circular(12.r)),
                padding: EdgeInsets.all(24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12.r),
                      backgroundColor: FPcolors.colorEEEEEE,
                      minHeight: 16.h,
                      value: state.listOfBooks.length >=
                              (state.isLibrarySelected ? 10 : 1)
                          ? 1
                          : (state.listOfBooks.length / 10),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.listOfBooks.length} / ${state.isLibrarySelected ? '10' : '1'} Books',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: FPcolors.colorF35A38,
                          ),
                        ),
                        Text(
                          '${(state.listOfBooks.length) <= 10 ? (state.listOfBooks.length * 5) : 50} Days',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: FPcolors.color616161,
                          ),
                        ),
                      ],
                    ),
                    state.showBookSelectErr
                        ? Text(
                            state.errMsg,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: FPcolors.colorF35A38,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.listOfBooks.length,
                  itemBuilder: (context, index) {
                    return itemView(state.listOfBooks[index]);
                  },
                ).marginOnly(top: 24.h),
              ),
            ],
          ).paddingSymmetric(horizontal: 16.w),
          bottomNavigationBar: FilledButton(
            onPressed: () => state.onNext(myPoints),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ).marginSymmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
        )
      ],
    );
  }

  itemView(BookDetailsModal book) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        color: FPcolors.colorWhite,
        border: Border.all(
          color: FPcolors.greyBorder,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Get.width * 0.04),
            child: Image.network(
              book.coverImage!,
              width: Get.width * 0.18,
              height: Get.height * 0.11,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text("No Image"));
              },
            ),
          ),
          SizedBox(width: Get.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookTitle ?? book.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  book.authorName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
                ),
                SizedBox(height: Get.height * 0.01),
                Row(
                  children: [
                    const TagWidget(tag: 'Art'),
                    RatingWidget(
                      rating: book.rating,
                      bookId: book.id ?? '',
                      provider: null,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          IconButton(
            onPressed: () {
              ref.watch(selectBookScreenProvider).removeFromList(book);
            },
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
    );
  }
}
