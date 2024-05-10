import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/dialogs/library_dialog.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/checkout.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/providers/library_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/tabs/all_books.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/tabs/trending_book.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:get/get.dart';

class Library extends ConsumerStatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  LibraryStatee createState() => LibraryStatee();
}

class LibraryStatee extends ConsumerState<Library> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => showLibraryDialog());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(checkOutProvider).loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(libraryProvider);
    var checkout = ref.watch(checkOutProvider);

    return ContainerWithTopLogo(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Library at Your Doorstep'),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(() => const SearchScreen(type: 'Library'));
                },
                child: const Icon(Icons.search)
                    .paddingSymmetric(horizontal: Get.width * 0.04),
              )
            ],
          ),
          bottomNavigationBar: checkout.books.isEmpty
              ? const SizedBox(height: 0)
              : Material(
                  elevation: 12,
                  shadowColor: Colors.grey.shade700,
                  child: Padding(
                    padding: EdgeInsets.all(Get.width * 0.04),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          Get.to(() => const CheckOut());
                        },
                        child: SvgPicture.asset(Assets.icons.arrowRightWhite),
                      ),
                    ),
                  ),
                ),
          body: Column(
            children: [
              const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Trending'),
                  Tab(text: 'All Books'),
                  Tab(text: 'My Books'),
                ],
              ).paddingSymmetric(horizontal: Get.width * 0.04),
              const Expanded(
                child: TabBarView(
                  children: [
                    TrendingBooksTab(),
                    AllBooksTab(),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showLibraryDialog() async {
    debugPrint('showLibraryDialog');
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const LibraryDialog();
      },
    );
  }
}
