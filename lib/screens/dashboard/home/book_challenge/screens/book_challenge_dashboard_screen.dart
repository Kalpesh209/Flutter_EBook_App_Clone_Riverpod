import 'dart:io' show Platform;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/providers/book_challenge_dashboard_provider.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../adhelper.dart';
import '../modals/book_challenge_dashboard_response.dart';

class BookChallengeDashboardScreen extends ConsumerStatefulWidget {
  const BookChallengeDashboardScreen({super.key});

  @override
  BookChallengeDashboardScreenState createState() =>
      BookChallengeDashboardScreenState();
}

class BookChallengeDashboardScreenState
    extends ConsumerState<BookChallengeDashboardScreen> {
  late BannerAd bannerAd;

  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-4271697679357182~8328921318";

//test

  // TODO: Add _bannerAd
  BannerAd? _bannerAd;
  RewardedAd? _rewardedAd;

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                _rewardedAd = null;
              });
              // _loadRewardedAd();
            },
          );

          setState(() {
            _rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adUnit,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Error");
        }),
        request: const AdRequest());
    bannerAd.load();
  }

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_select_contact_screen');
    //   _loadRewardedAd();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(selectBookDashboardProvider).getBookReadingChallenge();
    });

    // TODO: Load a banner ad
    /*   BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();*/

    super.initState();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(selectBookDashboardProvider);
    return state.loading
        ? loadingCenter()
        : Stack(
            children: [
              //Positioned.fill(child: Container(color: FPcolors.colorFFE3DC)),
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  Assets.background.bgTopCorner.keyName,
                  width: Get.width / 1.6,
                ),
              ),
              Positioned.fill(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: FPcolors.color40FFE3DC,
                    title: const Text('Book Reading Challenge'),
                    centerTitle: true,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_bannerAd != null)
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
                          ),
                        ),
                      Container(
                        height: 150,
                        color: FPcolors.color40FFE3DC,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.h),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.w, right: 24.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    state.user?.profileImage ?? '',
                                    height: 74.h,
                                    width: 74.h,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text("No Image");
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.user?.name ?? "",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'My Points',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/ic_coin_small.svg'),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "${state.user?.point ?? 0}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: FPcolors.colorC74225),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: Get.height * 0.7,
                            color: FPcolors.colorWhite40,
                            padding: EdgeInsets.only(
                              top: 35.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Invitations',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: FPcolors.colorC74225),
                                    ),
                                    InkWell(
                                      onTap: state.onTabSeeMore,
                                      /*   onTap: () {
                                        _rewardedAd?.show(onUserEarnedReward:
                                            (AdWithoutView ad, RewardItem rewardItem) {
                                          // ignore: avoid_print
                                          print('Reward amount: ${rewardItem.amount}');

                                        });
                                      }, */ //state.onTabSeeMore,
                                      child: Text(
                                        'See more',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  left: 20.w,
                                  right: 20.w,
                                  bottom: 12.h,
                                ),
                                state.listOfInvitations.isEmpty
                                    ? const Center(
                                        child:
                                            Text("You don't have invitations"),
                                      ).marginSymmetric(vertical: 8.h)
                                    : SizedBox(
                                        height: 240.h,
                                        child: ListView.builder(
                                          itemCount:
                                              state.listOfInvitations.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return itemInvitationView(
                                                state.listOfInvitations[index]);
                                          },
                                        ),
                                      ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: FPcolors.colorC74225),
                                    ),
                                  ],
                                ).paddingOnly(
                                    left: 20.w, right: 20.w, top: 10.h),
                                state.listOfAcceptedChallenges.isEmpty
                                    ? const Center(
                                        child: Text(
                                            "You don't accept any challenge"),
                                      ).marginSymmetric(vertical: 12.h)
                                    : Expanded(
                                        child: ListView.builder(
                                          itemCount: state
                                              .listOfAcceptedChallenges.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return itemStatusView(
                                                state.listOfAcceptedChallenges[
                                                    index]);
                                          },
                                        ).marginOnly(top: 12.h),
                                      ),
                                Divider(
                                  height: 1,
                                  color: FPcolors.colorEEEEEE,
                                ).marginSymmetric(horizontal: 16.w),
                                InkWell(
                                  onTap: state.onTabMoreChallenge,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'More Challenge',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: FPcolors.color212121),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: FPcolors.color212121,
                                      ),
                                    ],
                                  ).marginOnly(
                                      left: 20.w,
                                      right: 20.w,
                                      top: 15.h,
                                      bottom: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: Material(
                    elevation: 12,
                    color: FPcolors.colorWhite,
                    child: FilledButton(
                      onPressed: () {
                        Get.toNamed(selectBookScreen, arguments: {
                          'my_points': state.user?.point.toString(),
                        });
                      },
                      child: const Text('Challenge'),
                    ).marginSymmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: Platform.isIOS ? 150 : 120,
                height: 160.h,
                width: 160.w,
                child: Image.asset(
                  Assets.icons.g2.path,
                  fit: BoxFit.fitHeight,
                  height: 160.h,
                  width: 160.w,
                ),
              ),
            ],
          );
  }

  itemInvitationView(Invitations invitationsData) {
    return Container(
      padding: EdgeInsets.only(
        left: Get.width * 0.04,
        right: Get.width * 0.04,
        bottom: 12.h,
      ),
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
          SizedBox(width: 12.w),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${invitationsData.challenger?.firstName ?? ""}${invitationsData.challenger?.lastName ?? ""}',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: FPcolors.color090A0A),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Inviting to reading challenge',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: FPcolors.color494949),
                ),
                SizedBox(height: 2.h),
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
                SizedBox(height: 10.h),
                Row(
                  children: [
                    customButton(
                      'Accept',
                      FPcolors.color1F9E80,
                      false,
                      () => ref
                          .watch(selectBookDashboardProvider)
                          .onTapAcceptOrReject(
                              "Accept", invitationsData.id.toString()),
                    ),
                    SizedBox(width: 10.w),
                    customButton(
                      'Reject',
                      FPcolors.colorC74225,
                      false,
                      () => ref
                          .watch(selectBookDashboardProvider)
                          .onTapAcceptOrReject(
                              "Reject", invitationsData.id.toString()),
                    ),
                  ],
                )
              ],
            ),
          )
          /*  SizedBox(
            width: Get.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 24.h,
                ),
                //SvgPicture.asset(Assets.icons.icRemove),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  itemStatusView(AcceptedChallengesStatus challengesData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * 0.20,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  challengesData.challenger?.profileImage ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      "https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                      width: 60.w, //Get.width * 0.18,
                      height: 60.h, //Get.height * 0.11,
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
          width: Get.width * 0.70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${challengesData.challenger?.firstName ?? ""}${challengesData.challenger?.lastName ?? ""}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: FPcolors.color494949,
                ),
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(12.r),
                backgroundColor: FPcolors.colorEEEEEE,
                minHeight: 5.h,
                value: (double.parse(ref
                        .watch(selectBookDashboardProvider)
                        .outOffBooksForSlider(challengesData.challengeBooks)) /
                    double.parse(
                        challengesData.challengeBooks?.length.toString() ??
                            "0")),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ref
                        .watch(selectBookDashboardProvider)
                        .outOffBooks(challengesData.challengeBooks),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: FPcolors.colorF35A38,
                    ),
                  ),
                  Text(
                    ref
                        .watch(selectBookDashboardProvider)
                        .timeAgo(challengesData.challengeEndAt),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: FPcolors.color616161,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: Get.width * 0.01),
      ],
    ).marginOnly(
      left: 8.w,
      bottom: 16.h,
    );
  }

  Widget customButton(
    String buttonText,
    Color textAndBorderColor,
    bool isFilled,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: textAndBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(
            Radius.circular(
              48.r,
            ),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textAndBorderColor,
              fontSize: 14.sp,
              fontFamily: 'Avenir Heavy',
            ),
          ),
        ),
      ),
    );
  }
}
