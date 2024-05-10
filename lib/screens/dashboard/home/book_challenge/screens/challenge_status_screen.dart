import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:get/get.dart';

import '../../../../../config/route/route_names.dart';
import '../modals/book_challenges_status_response.dart';
import '../providers/challenge_status_provider.dart';

class ChallengeStatusScreen extends ConsumerStatefulWidget {
  const ChallengeStatusScreen({super.key});

  @override
  ChallengeStatusScreenState createState() => ChallengeStatusScreenState();
}

class ChallengeStatusScreenState extends ConsumerState<ChallengeStatusScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabFilterController;

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'challenge_status_screen');
    _tabController = TabController(vsync: this, length: 2);
    _tabFilterController = TabController(vsync: this, length: 3);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(challengeStatusScreenProvider)
          .onMyChallengeStatus("10", "1", "latest");
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabFilterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(challengeStatusScreenProvider);
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Challenges Status'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(
                    Assets.icons.icFilter.keyName,
                    height: 24.0,
                    width: 24.0,
                  ).paddingOnly(left: 10),
                  onPressed: state.onTapFilter,
                ),
                Container(
                  width: Get.width * 0.85,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: FPcolors.colorWhite,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: FPcolors.colorD8D5D5,
                      //                   <--- border color
                      width: 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  /* constraints:
                    BoxConstraints(maxHeight: 160.0, maxWidth: Get.width * 08),*/
                  child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                      Tab(text: 'My Challenge'),
                      Tab(text: 'Friends Challenge'),
                    ],
                    onTap: state.onTabChange,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Visibility(
              visible: state.isFilter,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: SizedBox(
                  width: Get.width,
                  child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    dividerColor: FPcolors.colorWhite,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    /*  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    // Creates border
                    color: FPcolors.fpPrimary,
                  ),*/
                    labelColor: FPcolors.fpPrimary,
                    unselectedLabelColor: FPcolors.color6C7072,
                    controller: _tabFilterController,
                    tabs: const [
                      Tab(text: 'Latest'),
                      Tab(text: 'Pending'),
                      Tab(text: 'Complete'),
                    ],
                    onTap: state.onTabStatusChange,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            state.loading
                ? loadingCenter()
                : state.listOfInvitationsStatus.isEmpty
                    ? const Center(
                        child: Text("You don't accept any challenge"),
                      ).marginSymmetric(vertical: 12.h)
                    : Expanded(
                        child: ListView.builder(
                          itemCount: state.listOfInvitationsStatus.length,
                          itemBuilder: (context, index) {
                            return itemListView(
                                state.listOfInvitationsStatus[index], index);
                          },
                        ).marginOnly(top: 24.h, left: 16.w, right: 16.w),
                      ),
          ],
        ));
  }

  itemListView(StatusInvitations invitationData, int index) {
    var state = ref.watch(challengeStatusScreenProvider);
    return InkWell(
      onTap: () {
        Get.toNamed(challengeDetailScreen, arguments: {
          'invitation_data': invitationData,
          "color": state.listOfColor[index % state.listOfColor.length]
        });
      },
      child: Padding(
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
                      color:
                          state.listOfColor[index % state.listOfColor.length],
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
                                "${invitationData.challenger?.firstName ?? ""} ${invitationData.challenger?.lastName ?? ""}",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: FPcolors.colorWhite),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${invitationData.pointValue} Point",
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
                                  invitationData.challenger?.profileImage ?? "",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
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
                              invitationData.challengeBooks)) /
                      double.parse(
                          invitationData.challengeBooks?.length.toString() ??
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
                          .outOffBooks(invitationData.challengeBooks),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: FPcolors.colorF35A38,
                      ),
                    ),
                    Text(
                      ref
                          .watch(challengeStatusScreenProvider)
                          .timeAgo(invitationData.challengeEndAt),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: FPcolors.color616161,
                      ),
                    ),
                  ],
                ),
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
              SizedBox(height: 16.h),
              /*Divider(
                height: 1,
                color: FPcolors.colorEEEEEE,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
