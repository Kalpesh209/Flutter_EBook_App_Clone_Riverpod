import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/common_widgets.dart';
import '../modals/book_invitation_status.response.dart';
import '../providers/book_invitations_status_provider.dart';

class InvitationsStatusScreen extends ConsumerStatefulWidget {
  const InvitationsStatusScreen({super.key});

  @override
  InvitationsStatusScreenState createState() => InvitationsStatusScreenState();
}

class InvitationsStatusScreenState
    extends ConsumerState<InvitationsStatusScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabFilterController;

  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logEvent(name: 'book_invitation_status_screen');
    _tabController = TabController(vsync: this, length: 2);
    _tabFilterController = TabController(vsync: this, length: 3);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(invitationsStatusScreenProvider)
          .onMyChallengeStatus("10", "1", "latest");
    });
    print("New InvitationsStatusScreen");
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabFilterController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(invitationsStatusScreenProvider);
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Invitations Status'),
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
                      width: 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 5.h,
                  ),
                  /* constraints:
                    BoxConstraints(maxHeight: 160.0, maxWidth: Get.width * 08),*/
                  child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                      Tab(text: 'My Invitations'),
                      Tab(text: 'Friends Invitations'),
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
                      Tab(text: 'Accepted'),
                      Tab(text: 'Rejected'),
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
                            return itemInvitationView(
                                state.listOfInvitationsStatus[index], index);
                          },
                        ).marginOnly(top: 24.h, left: 16.w, right: 16.w),
                      ),
          ],
        ));
  }

  itemInvitationView(InvitationsStatus invitationsData, int index) {
    return Container(
      //margin: EdgeInsets.only(bottom: 16.h),
      // padding: EdgeInsets.all(Get.width * 0.04),
      padding: EdgeInsets.only(
          left: Get.width * 0.01, right: Get.width * 0.01, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width * 0.10,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // BorderRadius.circular(Get.width * 0.04),
                  child: Image.network(
                    invitationsData.challenger?.profileImage ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                        width: 40.w, //Get.width * 0.18,
                        height: 40.h, //Get.height * 0.11,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Text("No Image"));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: Get.width * 0.01),
          SizedBox(
            width: Get.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${invitationsData.challenger?.firstName ?? ""} ${invitationsData.challenger?.lastName ?? ""}",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: FPcolors.color090A0A),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Inviting to reading challenge',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: FPcolors.color494949),
                ),
                SizedBox(
                  height: 2.h,
                ),
                invitationsData.challengeBooks!.length > 1
                    ? Text(
                        '${invitationsData.challengeBooks![0].book?.bookTitle ?? ""} +',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: FPcolors.color494949),
                      )
                    : Text(
                        invitationsData.challengeBooks![0].book?.bookTitle ??
                            "",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: FPcolors.color494949),
                      ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
