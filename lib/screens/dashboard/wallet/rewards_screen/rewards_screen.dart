import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/rewards_screen/my_rewards_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/rewards_screen/redeem_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/wallet_provider.dart';

class RewardsScreen extends ConsumerStatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  RewardsScreenState createState() => RewardsScreenState();
}

class RewardsScreenState extends ConsumerState<RewardsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    FirebaseAnalytics.instance.logEvent(name: 'rewards_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(walletProvider).getRewardsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(walletProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rewards",
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icCoinSmall,
                    height: 18,
                  ).marginOnly(right: 6),
                  const SizedBox(width: 2),
                  Text(
                    "${state.dataResponse?.userRewardPoint.toString()}",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              controller: tabController,
              labelStyle: const TextStyle(fontSize: 16),
              onTap: (value) {
                print("value$value");
                if (value == 0) {
                  state.getRewardsData();
                } else if (value == 1) {
                  state.getRedeemData();
                }
              },
              tabs: const [
                Tab(text: 'My Rewards'),
                Tab(text: 'Redeem'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  MyRewardsScreen(),
                  RedeemScreen(),
                ],
              ),
            )
          ],
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
