import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
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

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    setVersion();
  }

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
        backgroundColor: paleBg,
        appBar: AppBar(
          // foregroundColor: paleBg,
          centerTitle: true,
          title: const Text('Category'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(libraryScreen),
                  child: CategoryCard(
                    title: "Library at Your Doorstep",
                    subTitle: 'Psumo ipsum dolor sit amet',
                    image: Assets.icons.books.path,
                  ),
                ),
                Spacer,
                CategoryCard(
                  title: "Quiz Gaming \nChallenge",
                  image: Assets.icons.g1.path,
                  titleColor: Colors.black,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [paleBg, Colors.white],
                    ),
                  ),
                ),
                Spacer,
                CategoryCard(
                  title: "Book Reading \nChallenge",
                  image: Assets.icons.g2.path,
                  titleColor: Colors.black,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        paleBg,
                      ],
                    ),
                  ),
                ),
                Spacer,
                Row(
                  children: [
                    Expanded(
                      child: CategoryCardSquare(
                        title: 'E-Book',
                        onTap: () {
                          Get.to(() => const BooksScreen());
                        },
                        image: Assets.icons.eBook.path,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.06,
                    ),
                    Expanded(
                      child: CategoryCardSquare(
                        title: 'Audio Book',
                        image: Assets.icons.audio.path,
                        onTap: () {
                          Get.to(() => const AudioBookScreen());
                        },
                      ),
                    ),
                  ],
                ),
                Spacer,
                Row(
                  children: [
                    Expanded(
                      child: CategoryCardSquare(
                        title: 'Comic Book',
                        image: Assets.icons.comicBook.path,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.06,
                    ),
                    Expanded(
                      child: CategoryCardSquare(
                        title: 'Library Book',
                        image: Assets.icons.bookSolid.path,
                        onTap: () {
                          Get.to(() => const Library());
                        },
                      ),
                    ),
                  ],
                ),
                Spacer,
                CategoryCard(
                  title: "Yoga",
                  subTitle: 'Psumo ipsum dolor sit amet',
                  image: Assets.icons.yoga.path,
                  onTap: () {
                    Get.to(() => const YogaScreen());
                  },
                ),
                Spacer,
                CategoryCard(
                  title: "Meditation",
                  subTitle: 'Psumo ipsum dolor sit amet',
                  image: Assets.icons.meditate.path,
                  onTap: () {
                    Get.to(() => const MeditationScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
