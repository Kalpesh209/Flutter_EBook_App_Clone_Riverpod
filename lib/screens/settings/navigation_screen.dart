import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../gen/assets.gen.dart';
import 'bottomnavigation_bar_tabs/menu/menu.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var currentIndex = 0;
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance
        .logEvent(name: 'open_my_account_dashboard')
        .then((n) => debugPrint('nav'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //backgroundColor: Colors.black,
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Material(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: SalomonBottomBar(
                currentIndex: currentIndex,
                onTap: (i) => setState(() => currentIndex = i),
                selectedItemColor: FPcolors.fpPrimary,
                items: [
                  /// Home
                  SalomonBottomBarItem(
                      icon: SvgPicture.asset(Assets
                          .settings.svg.bottomNavigationBarIcon.bottomHomeIcon),
                      title: Text(
                        "Home",
                        style: TextStyle(color: FPcolors.fpPrimary),
                      ),
                      selectedColor: FPcolors.fpPrimary),

                  /// Likes
                  SalomonBottomBarItem(
                    icon: SvgPicture.asset(Assets
                        .settings.svg.bottomNavigationBarIcon.bottomSecondIcon),
                    title: const Text("second"),
                    selectedColor: FPcolors.fpPrimary,
                  ),

                  /// Search
                  SalomonBottomBarItem(
                      icon: SvgPicture.asset(Assets.settings.svg
                          .bottomNavigationBarIcon.bottomWalletIcon),
                      title: const Text("wallet"),
                      selectedColor: FPcolors.fpPrimary),

                  /// Profile
                  SalomonBottomBarItem(
                      icon: SvgPicture.asset(
                          Assets.settings.svg.bottomNavigationBarIcon.bnbMenu),
                      title: const Text("Menu"),
                      selectedColor: FPcolors.fpPrimary),
                ],
              ),
            )),
        body: const Menu());
  }
}
