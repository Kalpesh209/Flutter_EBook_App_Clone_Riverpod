import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/rating.dart';
import '../../../../../common/widgets/tag.dart';
import '../modals/book_challenges_status_response.dart';
import '../providers/challenge_detail_provider.dart';
import '../providers/challenge_status_provider.dart';

class ChallengedDetailsScreen extends ConsumerStatefulWidget {
  const ChallengedDetailsScreen({super.key});

  @override
  ChallengeStatusScreenState createState() => ChallengeStatusScreenState();
}

class ChallengeStatusScreenState
    extends ConsumerState<ChallengedDetailsScreen> {
  dynamic argumentData = Get.arguments;
  StatusInvitations? invitation;
  late Color seletedColore;

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'challenge_detail_screen');
    if (argumentData != null) {
      invitation = argumentData['invitation_data'];
      seletedColore = argumentData['color'];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(challengeDetailsScreenProvider);
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Challenge Details'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Container(
                decoration: BoxDecoration(
                    color: FPcolors.colorWhite,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: FPcolors.colorEEEEEE)),
                //padding: EdgeInsets.all(24.h),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: seletedColore,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18.r),
                              topLeft: Radius.circular(18.r),
                            ),
                          ),
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${invitation?.challenger?.firstName ?? ""} ${invitation?.challenger?.lastName ?? ""}",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                          color: FPcolors.colorWhite),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "${invitation?.pointValue} Point",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w900,
                                          color: FPcolors.colorWhite),
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      // BorderRadius.circular(Get.width * 0.04),
                                      child: Image.network(
                                        invitation?.challenger?.profileImage ??
                                            "",
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.network(
                                            "https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                                            width: 80.w, //Get.width * 0.18,
                                            height: 80.h, //Get.height * 0.11,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Center(
                                                  child: Text("No Image"));
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, right: 13.w),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(12.r),
                        backgroundColor: FPcolors.colorEEEEEE,
                        minHeight: 16.h,
                        value: (double.parse(ref
                                .watch(challengeStatusScreenProvider)
                                .outOffBooksForSlider(
                                    invitation?.challengeBooks)) /
                            double.parse(
                                invitation?.challengeBooks?.length.toString() ??
                                    "0")),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, right: 13.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ref
                                .watch(challengeStatusScreenProvider)
                                .outOffBooks(invitation?.challengeBooks),
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: FPcolors.colorF35A38,
                            ),
                          ),
                          Text(
                            ref
                                .watch(challengeStatusScreenProvider)
                                .timeAgo(invitation?.challengeEndAt),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: FPcolors.color616161,
                            ),
                          ),
                        ],
                      ),
                    ).marginOnly(bottom: 20.h),
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
            ).marginOnly(top: 24.h, left: 16.w, right: 16.w),
            Expanded(
              child: ListView.builder(
                itemCount: invitation?.challengeBooks?.length,
                itemBuilder: (context, index) {
                  return itemView(invitation!.challengeBooks![index]);
                },
              ).marginOnly(top: 24.h, left: 20.w, right: 20.w),
            ),
          ],
        ));
  }

  itemView(ChallengeBooks book) {
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
              book.book?.coverImage ?? "",
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
                  book.book?.bookTitle ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  book.book?.authorMaster?.authorName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
                ),
                SizedBox(height: Get.height * 0.01),
                Row(
                  children: [
                    const TagWidget(tag: 'Art'),
                    RatingWidget(
                      rating: book.book?.rating?.toDouble() ?? 0.0,
                      bookId: book.id ?? '',
                      provider: null,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: Get.width * 0.02),
        ],
      ),
    );
  }
}
