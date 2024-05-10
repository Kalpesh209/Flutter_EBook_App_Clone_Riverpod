import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/rewards_screen/reward_widget.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../utils.dart';
import '../../../common_widgets/common_widgets.dart';
import '../providers/wallet_provider.dart';

class RedeemScreen extends ConsumerStatefulWidget {
  const RedeemScreen({Key? key}) : super(key: key);

  @override
  RedeemScreenState createState() => RedeemScreenState();
}

class RedeemScreenState extends ConsumerState<RedeemScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'my_rewards_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(walletProvider).getRedeemData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(walletProvider);
    return state.loading
        ? loadingCenter()
        : Scaffold(
            body: state.listOfRedeem.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.separated(
                            itemCount: state.listOfRedeem.length,
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
                                        border: Border.all(
                                            color: FPcolors.colorC74225),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          bottomRight: Radius.circular(15.r),
                                        ),
                                      ),
                                      child: Text(
                                        '${state.listOfRedeem[index].point ?? '0'}',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 8.h),
                                            Text(
                                              state.listOfRedeem[index].title ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: FPcolors.color090A0A,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'Offer available till ${getFormattedDate(state.listOfRedeem[index].expiredAt!)}',
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
                                      ],
                                    ).paddingSymmetric(horizontal: 16.w),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return index == 2
                                  ? inviteView()
                                  : index == 4
                                      ? earnMorePoints()
                                      : const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text(
                      'No redeem rewards.',
                    ),
                  ),
          );
  }
}
