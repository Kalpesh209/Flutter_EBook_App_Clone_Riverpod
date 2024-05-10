import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/favorite_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/common_model/favourite_book_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/category.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_new.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/wallet.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/menu.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../settings/user/profile_edit_screen.dart';
import 'category/audiobookviewall.dart';
import 'category/categorynewscreen.dart';
import 'category/ebookviewall.dart';

class DashBoardState extends ChangeNotifier {
  int _selectedTabIndex = 0;

  get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(status) {
    _selectedTabIndex = status;
    notifyListeners();
  }
}

final dashBoardProvider = ChangeNotifierProvider((r) {
  FirebaseAnalytics.instance
      .logEvent(name: 'open_dashboard')
      .then((value) => null);
  return DashBoardState();
});

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key, required this.initial});

  final int initial;

  @override
  ConsumerState<DashBoard> createState() => _DashBoardConsumerState();
}

class _DashBoardConsumerState extends ConsumerState<DashBoard> {
  getPage(DashBoardState state) {
    /*  if (state.selectedTabIndex == 0) {
      return const HomeNewScreen();
    } else if (state.selectedTabIndex == 1) {
      // return const CategoryScreen();
      return const CategoryNewScreen();
    } else if (state.selectedTabIndex == 2) {
      return const WalletScreen();
    } else {
      return const Menu();
    }*/

    if (state.selectedTabIndex == 0) {
      return const EbookViewAllScreen();
    } else if (state.selectedTabIndex == 1) {
      // return const CategoryScreen();
      // return const AudioViewAllScreen();
      return const FavoriteScreen();
    } else if (state.selectedTabIndex == 2) {
      return const EditProfile();
    } else {
      return const Menu();
    }
  }

  @override
  void didChangeDependencies() {
    var state = ref.watch(dashBoardProvider);
    state._selectedTabIndex = widget.initial;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(dashBoardProvider);

    var actionBtnWidth = Get.width * 0.06;
    /*return Scaffold(
      backgroundColor: state.selectedTabIndex == 1 ? FPcolors.colorWhite : FPcolors.colorWhite,
      appBar: state.selectedTabIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              title: Assets.auth.images.logoHorizon.image(height: Get.height * 0.04),
              actions: [
                SizedBox(width: Get.width * 0.04),
                InkWell(
                  onTap: () {
                    Get.toNamed(notificationScreen);
                  },
                  child: Assets.icons.bell.image(width: actionBtnWidth),
                ),
                SizedBox(width: Get.width * 0.04),
                InkWell(
                  onTap: () {
                    Get.to(() => const FavoriteScreen());
                  },
                  child: Assets.icons.favorite.image(width: actionBtnWidth),
                ),
                SizedBox(width: Get.width * 0.04),
              ],
            )
          : AppBar(toolbarHeight: 0,),
      body: getPage(state),
      bottomNavigationBar:
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.03),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: themeColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: paleBg,
              color: Colors.black,
              tabs: [
                GButton(
                  leading: SvgPicture.asset(state.selectedTabIndex == 0
                      ? Assets.icons.homeInactive
                      : Assets.icons.homeInactive),
                  icon: Icons.home,
                  text: 'E-Book',
                ),
                GButton(
                  icon: Icons.abc,
                  leading:SvgPicture.asset(state.selectedTabIndex == 1
                      ? Assets.icons.iconfavoriteActive
                      : Assets.icons.iconfavoriteActive),
                  text: 'Favorite',
                ),
                GButton(
                  leading: SvgPicture.asset(state.selectedTabIndex == 2
                      ? Assets.settings.svg.user
                      : Assets.settings.svg.user),
                  icon: Icons.book,
                  text: 'Profile',
                ),
                GButton(
                  leading: SvgPicture.asset(state.selectedTabIndex == 3
                      ? Assets.icons.profile
                      : Assets.icons.profile),
                  icon: Icons.person,
                  text: 'Menu',
                ),
              ],
              selectedIndex: state.selectedTabIndex,
              onTabChange: (index) {
                state.selectedTabIndex = index;
              },
            ),
          ),
        ),
      ),
    );*/
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          if (state._selectedTabIndex == 0) {
            SystemNavigator.pop();
          } else {
            state._selectedTabIndex = 0;
          }
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: state.selectedTabIndex == 1
            ? /*paleBg*/ FPcolors.colorWhite
            : FPcolors.colorWhite /*Colors.transparent*/,
        appBar: state.selectedTabIndex == 0
            ? AppBar(
                automaticallyImplyLeading: false,
                title: Assets.auth.images.logoHorizon
                    .image(height: Get.height * 0.04),
                actions: [
                  SizedBox(width: Get.width * 0.04),
                  InkWell(
                    onTap: () {
                      Get.toNamed(notificationScreen);

                      // Get.toNamed(historyScreen);
                    },
                    child: Assets.icons.bell.image(width: actionBtnWidth),
                  ),
                  SizedBox(width: Get.width * 0.04),
                  InkWell(
                    onTap: () {
                      Get.to(() => const FavoriteScreen());
                    },
                    child: Assets.icons.favorite.image(width: actionBtnWidth),
                  ),
                  SizedBox(width: Get.width * 0.04),
                ],
              )
            : AppBar(
                toolbarHeight: 0,
              ),
        body: getPage(state),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.03),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: themeColor,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: paleBg,
                color: Colors.black,
                tabs: [
                  GButton(
                    leading: SvgPicture.asset(state.selectedTabIndex == 0
                        ? Assets.icons.homeActive
                        : Assets.icons.homeInactive),
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: state.selectedTabIndex == 1
                        ? Icons.favorite
                        : Icons.favorite_border,
                    /*leading: SvgPicture.asset(state.selectedTabIndex == 1
                        ? Assets.icons.categoryActive
                        : Assets.icons.categoryInactive),*/
                    text: 'Favourite',
                  ),
                  GButton(
                    /*leading: SvgPicture.asset(state.selectedTabIndex == 2
                        ? Assets.icons.walletActive
                        : Assets.icons.wallet),*/
                    icon: state.selectedTabIndex == 2
                        ? Icons.person
                        : Icons.person,
                    text: 'Profile',
                  ),
                  GButton(
                    leading: SvgPicture.asset(state.selectedTabIndex == 3
                        ? Assets.icons.bars
                        : Assets.icons.profile),
                    icon: Icons.menu,
                    text: 'Menu',
                  ),
                ],
                selectedIndex: state.selectedTabIndex,
                onTabChange: (index) {
                  state.selectedTabIndex = index;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
