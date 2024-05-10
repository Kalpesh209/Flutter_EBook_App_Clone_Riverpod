import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/providers/wallet_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/all_orders.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/books_tab.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/out_of_box_tab.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/transactions_tab.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../../config/colors/colors.dart';
import '../../common_widgets/common_widgets.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  WalletScreenState createState() => WalletScreenState();
}

class WalletScreenState extends ConsumerState<WalletScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    // setVersion();
    FirebaseAnalytics.instance.logEvent(name: 'wallet_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(walletProvider).getRewardsData();
    });
  }

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    setState(() {
      version = packageInfo.version;
    });
  }

  String version = "";

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(walletProvider);
    return state.loading
        ? loadingCenter()
        : UpgradeAlert(
            /* upgrader: Upgrader(
        debugDisplayAlways: false,
        showLater: false,
        showIgnore: false,
        showReleaseNotes: false,
        dialogStyle: Platform.isAndroid
            ? UpgradeDialogStyle.material
            : UpgradeDialogStyle.cupertino,
        minAppVersion: version,
      ),*/
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wallet",
                        style: GoogleFonts.dmSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(barCodeScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.02,
                                horizontal: Get.width * 0.03),
                            child: Image.asset(
                              // Assets.images.imgInvite.keyName,
                              Assets.icons.icon_sance_new.keyName,
                              width: 20,
                              height: 20,
                            ),
                          )),

                      /* Row(
                  children: [
                    Text(
                      "Total Points",
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        height: 4,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF6c6c6c),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${state.dataResponse?.userRewardPoint.toString()}',
                      style: GoogleFonts.dmSans(
                        height: 2.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )*/
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    /* InkWell(
                onTap: () => Get.toNamed(rewardsScreen),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                      vertical: Get.height * 0.02,
                      horizontal: Get.width * 0.04),
                  // color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.04,
                          horizontal: Get.width * 0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "BALANCE",
                                style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${state.dataResponse?.userRewardPoint.toString()}',
                                style: GoogleFonts.dmSans(
                                  height: 1.9,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xFFC74225),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xFFFFE3DC),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xFFC74225),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),*/
                    InkWell(
                      onTap: () => Get.toNamed(rewardsScreen),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 8.0,
                        shadowColor: Colors.grey.shade300.withOpacity(0.4),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: Get.height * 0.01,
                            horizontal: Get.width * 0.04),
                        // color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.01,
                                horizontal: Get.width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Text(
                                    "REWARD POINTS",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: FPcolors.color131313,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      /* SvgPicture.asset(
                                        Assets.icons.icCoinSmall,
                                        height: 18,
                                      ).marginOnly(right: 6),
                                      const SizedBox(width: 2),*/
                                      Text(
                                        //"${state.dataResponse?.userRewardPoint.toString()}",
                                        state.dataResponse!.userRewardPoint
                                            .toString(),
                                        style: GoogleFonts.dmSans(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ]),
                                Column(
                                  children: [
                                    Image.asset(
                                      // Assets.images.imgInvite.keyName,
                                      Assets.icons.icon_reward_point.keyName,
                                      width: Get.width * 0.30,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    /* Text(
                                      "Reward points",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.icCoinSmall,
                                          height: 18,
                                        ).marginOnly(right: 6),
                                        const SizedBox(width: 2),
                                        Text(
                                          //"${state.dataResponse?.userRewardPoint.toString()}",
                                          "2000",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),*/
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "5000 points \n= \n Free T-Shirt",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: FPcolors.color72777B,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: FPcolors.colorA1A1AA)),
                                        onPressed: () async {
                                          // notificationData.isRead = !(notificationData.isRead ?? false);
                                        },
                                        child: Text(
                                          'Claim',
                                          style: TextStyle(
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            color: FPcolors.colorA1A1AA,
                                            fontSize: 12,
                                          ),
                                        )),
                                    /*ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: FPcolors.fpPrimary,
                                      ),
                                      onPressed: () async {},
                                      child: Text(
                                        'Explore',
                                        style: TextStyle(
                                          color: FPcolors.colorWhite,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),*/
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            Assets.icons.icFilter.keyName,
                            height: 24.0,
                            width: 24.0,
                          ).paddingOnly(left: 10),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: Get.width - 50,
                          child: const TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            automaticIndicatorColorAdjustment: true,
                            isScrollable: false,
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorWeight: 1,
                            tabs: [
                              Tab(text: 'Holding'),
                              Tab(text: 'Pending'),
                              Tab(text: 'Return'),
                              Tab(text: 'All Transaction'),
                            ],
                          ).paddingSymmetric(horizontal: 2),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          BooksTab(),
                          AllOrdersTab(),
                          OutOfBoxTab(),
                          TransactionTab(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}
