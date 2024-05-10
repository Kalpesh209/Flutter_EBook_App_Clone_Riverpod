import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/rewards_screen/reward_widget.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../adhelper.dart';
import '../../../../utils.dart';
import '../../../common_widgets/common_widgets.dart';
import '../providers/wallet_provider.dart';

class MyRewardsScreen extends ConsumerStatefulWidget {
  const MyRewardsScreen({Key? key}) : super(key: key);

  @override
  MyRewardsScreenState createState() => MyRewardsScreenState();
}

class MyRewardsScreenState extends ConsumerState<MyRewardsScreen> {
/*  RewardedAd? _rewardedAd;

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitIdForMyRewards,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                _rewardedAd = null;
              });
              _loadRewardedAd();
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
  }*/

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'my_rewards_screen');

    // loadRewardedAd(AdHelper.rewardedAdUnitIdForMyRewards);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(walletProvider).getRewardsData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(walletProvider);
    return state.loading
        ? loadingCenter()
        : Scaffold(
            body: state.listOfRewards.isNotEmpty
                ? SingleChildScrollView(
                    child: ListView.separated(
                      itemCount: state.listOfRewards.length,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color: FPcolors.colorD8D5D5,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.w),
                                decoration: BoxDecoration(
                                  color: FPcolors.colorFFE3DC,
                                  border:
                                      Border.all(color: FPcolors.colorC74225),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child: Text(
                                  '${state.listOfRewards[index].point ?? '0'}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8.h),
                                      Text(
                                        '${state.listOfRewards[index].title ?? ''}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: FPcolors.color090A0A,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Offer available till ${getFormattedDate(state.listOfRewards[index].availableAt!)}',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: FPcolors.color6C7072,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //     vertical: 8.h,
                                  //     horizontal: 16.w,
                                  //   ),
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(48.r),
                                  //     border: Border.all(
                                  //       color: FPcolors.colorC74225,
                                  //       width: 1.w,
                                  //     ),
                                  //   ),
                                  //   child: Text(
                                  //     'Use',
                                  //     style: TextStyle(
                                  //       color: FPcolors.colorC74225,
                                  //       fontSize: 14.sp,
                                  //       fontWeight: FontWeight.w400,
                                  //     ),
                                  //   ),
                                  // ),
                                  getFormattedDate(state.listOfRewards[index]
                                              .availableAt!) ==
                                          "0"
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.h,
                                            horizontal: 16.w,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(48.r),
                                            border: Border.all(
                                              color: FPcolors.color6C7072,
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Text(
                                            'Expired',
                                            style: TextStyle(
                                              color: FPcolors.color6C7072,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            if (state.listOfRewards[index].id !=
                                                null) {
                                              state.getRedeemCode(state
                                                  .listOfRewards[index].id!);
                                            }

                                            print(
                                                state.listOfRewards[index].id);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8.h,
                                              horizontal: 16.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(48.r),
                                              border: Border.all(
                                                color: FPcolors.color1F9E80,
                                                width: 1.w,
                                              ),
                                            ),
                                            child: Text(
                                              'Redeem',
                                              style: TextStyle(
                                                color: FPcolors.color1F9E80,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ).paddingSymmetric(horizontal: 16.w),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return index == 2
                            ? inviteView()
                            : index == 4
                                ? earnMorePoints()
                                : const SizedBox();
                      },
                    ),
                  )
                : const Center(
                    child: Text(
                      'Rewards Not found.',
                    ),
                  ),
          );
  }
}
