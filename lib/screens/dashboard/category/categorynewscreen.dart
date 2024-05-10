import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/providers/category_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/checkout/checkout_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/books.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/widgets/category_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/widgets/category_card_sq.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/audio_books_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/library.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/meditation_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_screen.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../../config/colors/colors.dart';
import '../home/models/book_details_modal.dart';
import '../home/providers/home_new_provider.dart';
import '../home/widgets/home_widgets.dart';

class CategoryNewScreen extends ConsumerStatefulWidget {
  const CategoryNewScreen({Key? key}) : super(key: key);

  @override
  CategoryNewScreenState createState() => CategoryNewScreenState();
}

class CategoryNewScreenState extends ConsumerState<CategoryNewScreen> {
  @override
  void initState() {
    super.initState();
    setVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getCategoryPageDetails();
    });
  }

  final TextEditingController searchController = TextEditingController();

  String? version;

  void setVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    var actionBtnWidth = Get.width * 0.08;
    var state = ref.watch(categoryProviderNew);

    FirebaseAnalytics.instance
        .logEvent(name: 'open_category_screen')
        .then((value) => null);
    Widget Spacer = SizedBox(height: Get.height * 0.03);
    return UpgradeAlert(
      upgrader: Upgrader(
        debugDisplayAlways: false,
        showLater: false,
        showIgnore: false,
        showReleaseNotes: false,
        dialogStyle: Platform.isAndroid
            ? UpgradeDialogStyle.material
            : UpgradeDialogStyle.cupertino,
        minAppVersion: version,
      ),
      child: Scaffold(
        backgroundColor: FPcolors.colorWhite,
        appBar: AppBar(
          // foregroundColor: paleBg,
          centerTitle: false,
          title: Text(
            'Category',
            style: TextStyle(fontSize: 24, color: FPcolors.fpPrimary),
          ),
          actions: [
            SizedBox(width: Get.width * 0.04),
            InkWell(
              onTap: () {
                Get.to(() => const CheckOutScreen());
              },
              child: Assets.icons.icon_cart_count.image(width: actionBtnWidth),
            ),
            SizedBox(width: Get.width * 0.04),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.01),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Get.width * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextField(
                            controller: searchController,
                            onChanged: (searchTerm) {},
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              filled: true,
                              fillColor: FPcolors.colorD9D9D9,
                              hintText: "Search books",
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: FPcolors.colorD9D9D9,
                                  width: 1,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 25,
                                color: Color(0xff090A0A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer,
                categoryEBook(state.eBookList, state.loading, "E-Books", ""),
                categoryaudioView(state.audioBookList, state.loading,
                    "Audio Books", "audio_books"),
                categoryForYou(
                    state.forYouBookList, state.loading, "For You", ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
