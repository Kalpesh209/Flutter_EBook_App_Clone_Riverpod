import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/provider/yoga_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_category_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_top_slider.dart';
import 'package:get/get.dart' as getx;

class YogaScreen extends ConsumerStatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  YogaScreenStatee createState() => YogaScreenStatee();
}

class YogaScreenStatee extends ConsumerState<YogaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(yogaScreenProvider).loadCategories();
      //ref.watch(yogaScreenProvider).lastPlayedAlbum();
    });
    print('Pandey');
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(yogaScreenProvider);
    return RefreshIndicator(
      onRefresh: () async {
        state.loadCategories();
        ref.watch(yogaScreenProvider).lastPlayedAlbum();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Yoga'),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen(
                      type: "Yoga",
                    );
                  }));
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getx.Get.width * 0.04),
                  child:
                      Assets.icons.search.image(width: getx.Get.width * 0.06),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: getx.Get.height,
                  width: getx.Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (state.categories.isNotEmpty)
                          YogaTopSlider(state.categories[0].categoryId ?? ''),
                        // TopCarouselSlider(
                        //   '',
                        //   'Yoga',
                        //       (bookDetailsModal) {
                        //     getx.Get.to(() => YogaPlayer(bookDetailsModal));
                        //   },
                        // ),
                        SizedBox(height: getx.Get.height * 0.04),
                        // state.lastPlayed.isNotEmpty
                        //     ? Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           //ebooks
                        //           SizedBox(height: getx.Get.height * 0.03),
                        //           HomeSectionTitle(
                        //               showView: true,
                        //               title: "Last Played",
                        //               onTap: () {
                        //                 getx.Get.to(() => LastPlayedScreen(
                        //                     album: state.lastPlayed));
                        //               }),
                        //           SizedBox(height: getx.Get.height * 0.01),
                        //           SizedBox(
                        //             height: 240.h,
                        //             child: ListView.builder(
                        //               shrinkWrap: true,
                        //               itemCount: state.lastPlayed.length,
                        //               scrollDirection: Axis.horizontal,
                        //               itemBuilder: (ctx, index) {
                        //                 var album = state.lastPlayed[index];
                        //                 return MusicListItem(
                        //                   album: album,
                        //                   onTap: () => getx.Get.to(
                        //                       () => MusicPlayer(album)),
                        //                 );
                        //               },
                        //             ),
                        //           ),
                        //           //end ebooks
                        //         ],
                        //       )
                        //     : const SizedBox(),
                        ...state.categories
                            .map((e) => YogaCategoryList(e))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                if (state.loading) const FullScreenLoader()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
