import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/widgets/categorytext.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/history/history_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/audio_books_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/audiobook_slider_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/basedgenreloved/widgets/basedgenreloved_slider_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/books.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/library.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/meditation_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/music_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_list_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_literarypicks_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/providers/home_new_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/sliders/e_book_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/sliders/library_book_slide.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/size/size.dart';
import '../../../Books/continue_reading.dart';
import '../../category/ContinueReading/continuereading.dart';
import '../../category/audiobookviewall.dart';
import '../../category/eBook_viewall_screen.dart';
import '../../category/e_booked_category.dart';
import '../../category/ebookhistory/ebookhistorypicks.dart';
import '../../category/ebookhistory/hindulibSliderList.dart';
import '../../category/ebookviewall.dart';
import '../../category/models/audio_auther_model.dart';
import '../../category/models/category_ebook.dart';
import '../../category/widgets/audio_author_notes.dart';
import '../../category/widgets/audio_regionallist.dart';
import '../../category/widgets/audiobook_adventure.dart';
import '../../category/widgets/audiobook_adventure_view_all.dart';
import '../../category/widgets/ebooke_screen.dart';
import '../../category/widgets/foryou_slider_screen.dart';
import '../../category/widgets/music_slider_screen.dart';
import '../freshpagesediters/freshpageediters.dart';
import '../home_category/category_view_screen.dart';
import '../home_category/home_category_screen.dart';
import '../home_menu/explorecategories/explorecategories.dart';
import '../home_menu/literarypicks/literarypicks.dart';
import '../models/home_category_model.dart';
import '../top_picks/top_picks_screen.dart';

noAlbumsFound() {
  return const Center(
    child: Text("No Albums Found"),
  );
}

bookReadingChallenge() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: InkWell(
      onTap: () => Get.toNamed(bookChallengeDashboard),
      child: Material(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        shadowColor: Colors.grey.shade300.withOpacity(0.4),
        child: Container(
          width: double.infinity,
          height: 100.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [colorFFE3DC, Colors.white],
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 18.w),
              const Text(
                'Book Reading\nChallenge',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              Image.asset(
                Assets.icons.g2.path,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

quizGamingChallenge(HomeStateNew state, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: InkWell(
      onTap: () {
        // state.rewardCard(context);
        // state.dailyReward(context);
        //Get.toNamed(playQuizDashboardScreen);
      },
      child: Material(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        shadowColor: Colors.grey.shade300.withOpacity(0.4),
        child: Container(
          width: double.infinity,
          height: 100.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                colorFFE3DC,
              ],
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                Assets.icons.g1.path,
                fit: BoxFit.fitHeight,
              ),
              Expanded(child: Container()),
              const Text(
                'Play Quiz',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 18.w),
            ],
          ),
        ),
      ),
    ),
  );
}

categoryMenu(String title, String image, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          shadowColor: Colors.grey.shade300.withOpacity(0.4),
          child: Container(
            height: Get.height * 0.1,
            padding: EdgeInsets.all(Get.width * 0.06),
            child: Image.asset(
              image,
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

libraryDoorView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  debugPrint('loading... $loading');
  return Column(
    children: [
      headingTitle(
        'Library at Your Doorstep',
        () => Get.to(() => const Library()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : AspectRatio(
                  aspectRatio: Get.width / Get.height * 5.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                    child: listOfBooks.isEmpty
                        ? const Center(
                            child: Text("No books"),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfBooks.length,
                            itemBuilder: (context, index) {
                              return LibraryBookSlide(
                                  slide: listOfBooks[index]);
                            },
                          ),
                  ),
                ),
      SizedBox(height: 16.h),
    ],
  );
}

eBookView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitle(
        'E-Books',
        () => Get.to(() => const BooksScreen()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : AspectRatio(
                  aspectRatio: Get.width / Get.height * 5.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfBooks.length,
                      itemBuilder: (context, index) {
                        return EbookSlider(slides: listOfBooks);
                      },
                    ),
                  ),
                ),
      SizedBox(height: 16.h),
    ],
  );
}

exploreCategoriesView(
  List<HomeCategory> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitleSubText(
        'Explore Categories',
        'Discover diverse genres and explore a variety of content',
        () => Get.to(() =>
                const HomeCategoryScreen() /*const ExploreCategories(
              slides: [],
            )*/
            ),
      ),
      /* loading
          ? const CircularProgressIndicator()
          :*/
      listOfBooks.isEmpty
          ? noBooksAvailable()
          : AspectRatio(
              aspectRatio: Get.width / Get.height * 6.3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ExploreCategories(slides: listOfBooks);
                  },
                ),
              ),
            ),
      // SizedBox(height: 16.h),
    ],
  );
}

literaryPicks(List<HomeLiteraryPicks> listOfBooks, loading, String typevalue) {
  return Column(
    children: [
      headingTitleSubTextremovebottom(
          'Literary Picks',
          'Page-turners that promise an immersive reading experience',
          () => {
                Get.to(() => const TopPicksScreen(
                      title: 'Literary Picks',
                      type: "literary_picks",
                    ))
              } /*Get.to(() => const LiteraryPicks(
              slides: [],
            )),*/
          ),
      listOfBooks.isEmpty
          ? noBooksAvailable()
          : SizedBox(
              height: Get.width * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 10,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return LiteraryPicks(slides: listOfBooks);
                  },
                ),
              ),
            ),

      /**/
      // SizedBox(height: 5.h),
    ],
  );
}

staffPicks(List<HomeLiteraryPicks> listOfBooks, loading, title, subTitle) {
  return Column(
    children: [
      headingTitleSubTextremovebottom(
        title,
        subTitle,
        () => Get.to(() => const LiteraryPicks(
              slides: [],
            )),
      ),
      /*loading
          ? const CircularProgressIndicator()
          :*/
      listOfBooks.isEmpty
          ? noBooksAvailable()
          : SizedBox(
              height: Get.width * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfBooks.length,
                  itemBuilder: (context, index) {
                    return LiteraryPicks(slides: listOfBooks);
                  },
                ),
              ),
            ),

      /**/
      // SizedBox(height: 5.h),
    ],
  );
}

topPicks(List<HomeLiteraryPicks> listOfBooks, loading, title, subtitle,
    {required onTap}) {
  return Column(
    children: [
      SizedBox(
        height: 5,
      ),
      headingTitleSubText(
          title,
          subtitle,
          () => {
                if (title == "Top Picks")
                  {
                    Get.to(() => const TopPicksScreen(
                          title: 'Top Picks',
                          type: 'top_picks',
                        )),
                  }
                else
                  {
                    Get.to(() => const TopPicksScreen(
                          title: 'Similar Titles',
                          type: 'similar_titles',
                        )),
                    /*Get.to(() => const LiteraryPicks(
                          slides: [],
                        )),*/
                  }
              }),
      listOfBooks.isEmpty
          ? noBooksAvailable()
          : SizedBox(
              width: Get.width * 0.9,
              height: Get.width * 0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.width * 0.03),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.03),
                            child: SizedBox(
                              height: 135,
                              width: 92,
                              child: listOfBooks[0].coverImage != null
                                  ? FancyShimmerImage(
                                      imageUrl: listOfBooks[0].coverImage ?? '',
                                      height: Get.width * 0.33,
                                      width: Get.width * 0.4,
                                    )
                                  : SvgPicture.asset(
                                      Assets.settings.svg.emptyimage),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 2.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 1.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            listOfBooks[0].bookTitle.toString(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              fontFamily: 'DM Sans',
                              color: FPcolors.colorBlack,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            listOfBooks[0].authorName.toString(),
                            style: AppStyles.slideSubTitleStyle,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          height: 50.h,
                          child: Html(
                            data: listOfBooks[0].aboutUs.toString(),
                            style: {
                              "body": Style(
                                fontSize: FontSize(12.0),
                                maxLines: 2,
                                color: FPcolors.color6C7072,
                                fontWeight: FontWeight.w400,
                              ),
                            },
                          ),
                        ),

                        /* SizedBox(
                              width: 200.w,
                              height: 50.h,
                              child: Html(
                                data: listOfBooks[0].aboutUs.toString(),
                              ) */ /*Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non nisi id quam ultrices condimentum. Praesent vestibulum sagittis.....',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  fontFamily: 'DM Sans',
                                  color: FPcolors.color6C7072,
                                ),
                                maxLines: 2,
                              )*/ /*
                              ,
                            ),*/
                        SizedBox(height: Get.width * 0.03),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: TagWidget(
                                tag: listOfBooks[0].contentType.toString(),
                              ),
                            ),
                            RatingWidget(
                              rating: listOfBooks[0].rating.toString(),
                              bookId: listOfBooks[0].id.toString(),
                              provider: null,
                            ),
                            SizedBox(width: Get.width * 0.06),
                            /* OutlinedButton(
                                  onPressed: () async {

                                  },
                                  child: const Text('Rent'),
                                )*/
                            !listOfBooks[0].isRead!
                                ? OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: FPcolors.colorWhite,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: FPcolors.fpPrimary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    onPressed: () async {
                                      onTap();
                                    },
                                    child: const Text('Rent'),
                                  )
                                : OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: FPcolors.fpPrimary,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: FPcolors.fpPrimary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    onPressed: () async {
                                      onTap();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Rent",
                                            style: TextStyle(
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w500,
                                                color: FPcolors.colorWhite,
                                                fontSize: 12)),
                                        defaultSpacerHorizontalTiny,
                                        SvgPicture.asset(
                                            Assets.settings.svg.iconSelected),
                                      ],
                                    ),
                                  ),
                            // if (slide.cornerIcon != null) slide.cornerIcon!
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

      /**/
      // SizedBox(height: 5.h),
    ],
  );
}

freshpageEdits(List<HomeLiteraryPicks> listOfBooks, loading, title, subtitle) {
  return Column(
    children: [
      headingTitleSubTextremovebottom(
          title,
          subtitle,
          () => {
                if (title == "History")
                  {
                    Get.to(() =>
                        const HistoryScreen(title: "History", type: "history"))
                  }
                else if (title == "Freshpage’s Edits")
                  {
                    Get.to(() => const TopPicksScreen(
                        title: "Freshpage’s Edits", type: "freshpage_edits"))
                  }
                else
                  {
                    Get.to(() => const LiteraryPicks(
                          slides: [],
                        )),
                  }
              }),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 230.h,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        // return LiteraryPicks(slides: listOfBooks);
                        return FreshPageEditers(slides: listOfBooks);
                      },
                    ),
                  ),
                ),

      /**/
      // SizedBox(height: 5.h),
    ],
  );
}

basedGenreloved(
    List<HomeLiteraryPicks> listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleSubText(
        title1,
        subtitle,
        () => Get.to(() => HistoryScreen(
              title: title1,
              type: 'genre_loved',
            )),
      ),
      listOfBooks.isEmpty
          ? noBooksAvailable()
          : BasedGenrelovedSliderList(
              slides: listOfBooks,
              itemCount: listOfBooks.length > 5 ? 5 : listOfBooks.length,
            ),
      SizedBox(height: 16.h),
    ],
  );
}

categoryEBook(List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => Get.to(() => const EbookViewAllScreen()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : EBookedSliderList(
                  slides: listOfBooks,
                  itemCount: listOfBooks.length > 5 ? 5 : listOfBooks.length,
                ),
      SizedBox(height: 20.h),
    ],
  );
}

categoryaudioView(
    List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
          title1,
          subtitle,
          () => {
                if (subtitle == "e_books")
                  {
                    Get.to(() => const ContinueReadingNewScreen(
                          title: "Book For You",
                        ))
                  }
                else if (subtitle == "audio_books")
                  {Get.to(() => const AudioViewAllScreen())}
                else
                  {}
              } // Get.to(() => const AudioViewAllScreen()),
          ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 180.h,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return MusicSliderItem(
                          album: album,
                          title1: title1,
                          onTap: () => {
                                if (album.lastReadChapterId!.isNotEmpty)
                                  {
                                    Get.toNamed(chapterReadDirect, parameters: {
                                      'book_id': album.id.toString(),
                                      'chapterId':
                                          album.lastReadChapterId.toString(),
                                      'bookName': album.bookTitle.toString()
                                    }),
                                  }
                                else
                                  {
                                    Get.toNamed(eBookDetails, parameters: {
                                      'book_id': album.id.toString()
                                    }),
                                  }
                                //  }
                              } //Get.to(() => MusicPlayer(album)),
                          );
                    },
                  ),
                ),
    ],
  );
}

audiobookAdventure(
    List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => {
          if (subtitle == "audiobook_adventure")
            {
              Get.to(() => const AudioBookAdventureViewAllScreen(
                    title: "Audiobook Adventure",
                  ))
            }
          else if (subtitle == "audio_books")
            {Get.to(() => const AudioViewAllScreen())}
          else
            {} /*Get.to(() => const EbookViewAllScreen())*/
        },
      ),
      SizedBox(
        height: 5,
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return AudioBookAdventureItem(
                        album: album,
                        onTap: () => {
                          Get.toNamed(audioDetails,
                              parameters: {'book_id': album.id.toString()}),
                        },
                      );
                    },
                  ),
                ),
      SizedBox(height: 1.h),
    ],
  );
}

audioAuthorsNotes(List<AuthorNotes>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => {},
      ),
      SizedBox(
        height: 5,
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return AudioAuthorsItem(
                        album: listOfBooks,
                        onTap: () => {
                          Get.toNamed(audioDetails,
                              parameters: {'book_id': album.id.toString()}),
                        },
                      );
                    },
                  ),
                ),
    ],
  );
}

audiobookRegional(
    List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => {
          if (subtitle == "audiobook_adventure")
            {
              Get.to(() => const AudioBookAdventureViewAllScreen(
                    title: "Audiobook Adventure",
                  ))
            }
          else if (subtitle == "audio_books")
            {Get.to(() => const AudioViewAllScreen())}
          else
            {} /*Get.to(() => const EbookViewAllScreen())*/
        },
      ),
      SizedBox(
        height: 5,
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 171.h,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return AudioRegionalItem(
                        album: album,
                        onTap: () => {
                          Get.toNamed(audioDetails,
                              parameters: {'book_id': album.id.toString()}),
                        },
                      );
                    },
                  ),
                ),
      SizedBox(height: 1.h),
    ],
  );
}

categoryView(List<EBookCategoryPicks>? listOfBooks, loading, title1, subtitle) {
  final ScrollController controller = ScrollController();
  int postion = 0;

  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => Get.to(() => const EBookCategoryScreen()),
      ),
      const SizedBox(height: 5),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: FPcolors.fpPrimary),
                          ),
                          child: InkWell(
                              onTap: () {
                                Get.to(() => CategoryViewScreen(
                                    title: album.type.toString(),
                                    categoryId: album.id.toString(),
                                    type: "EBOOK_ONLY"));
                              },
                              child: Text(
                                album.type.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: FPcolors.fpPrimary,
                                    fontWeight: FontWeight.bold),
                              )));
                    },
                  ),
                ),
    ],
  );
}

categoryForYou(
    List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleCategory(
        title1,
        subtitle,
        () => Get.to(() => HistoryScreen(title: title1, type: '')),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : Container(
                  color: FPcolors.color6E93CC40,
                  child: SizedBox(
                      height: 270.h,
                      child: GridView(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: List.generate(listOfBooks.length, (index) {
                          var album = listOfBooks[index];
                          return ForYouSliderItem(
                            album: album,
                            postion: index,
                            onTap: () => {
                              if (album.isAudioBook == true)
                                {
                                  Get.toNamed(audioDetails, parameters: {
                                    'book_id': album.id.toString()
                                  })
                                }
                              else
                                {
                                  if (album?.chapter != 0)
                                    {
                                      Get.toNamed(eBookDetails, parameters: {
                                        'book_id': album!.id.toString()
                                      })
                                    }
                                  else
                                    {
                                      Get.toNamed(bookDetails, parameters: {
                                        'book_id': album!.id.toString()
                                      })
                                    }
                                }
                            },
                          );
                        }),
                      ))),
      SizedBox(height: 1.h),
    ],
  );
}

audioView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitle(
        'Audio',
        () => Get.to(() => const AudioBookScreen()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : AudiobookSliderList(
                  slides: listOfBooks,
                  itemCount: listOfBooks.length > 5 ? 5 : listOfBooks.length,
                ),
      SizedBox(height: 16.h),
    ],
  );
}

yogaView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitle(
        'Yoga',
        () => Get.to(() => const YogaScreen()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: Get.width * 0.54,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            yogaDetails,
                            parameters: {'book_id': album.id ?? ''},
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.04),
                                  child: FancyShimmerImage(
                                    imageUrl: album.image ?? '',
                                    height: Get.width * 0.4,
                                    width: Get.width * 0.4,
                                  ),
                                ),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 42.r,
                                )
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                album.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                album.category ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: FPcolors.fpgreyText),
                              ),
                            ),
                          ],
                        ).paddingOnly(left: Get.width * 0.04),
                      );
                    },
                  ),
                ),
      SizedBox(height: 12.h),
    ],
  );
}

meditationView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitle(
        'Meditation',
        () {
          Get.to(() => const MeditationScreen());
        },
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: Get.width * 0.53,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return InkWell(
                        onTap: () => Get.to(() => MusicPlayer2(album)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.04),
                                  child: FancyShimmerImage(
                                    imageUrl: album.image ?? '',
                                    height: Get.width * 0.4,
                                    width: Get.width * 0.4,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(Get.width * 0.04),
                                  child: SvgPicture.asset(Assets.icons.note),
                                )
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                album.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              album.category ?? '',
                              style: TextStyle(
                                  fontSize: 14, color: FPcolors.fpgreyText),
                            ),
                          ],
                        ).paddingOnly(left: Get.width * 0.04),
                      );
                    },
                  ),
                ),
      SizedBox(height: 16.h),
    ],
  );
}

musicView(
  List<BookDetailsModal> listOfBooks,
  loading,
) {
  return Column(
    children: [
      headingTitle(
        'Music',
        () => Get.to(() => const MusicScreen()),
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 240.h,
                  child: ListView.builder(
                    itemCount: listOfBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = listOfBooks[index];
                      return MusicListItem(
                        album: album,
                        onTap: () => Get.to(() => MusicPlayer(album)),
                      );
                    },
                  ),
                ),
    ],
  );
}

ebookHistory(List<HomeLiteraryPicks>? listOfBooks, loading, title1, subTitle) {
  return Column(
    children: [
      headingTitleSubTextremovebottom(
        title1,
        subTitle,
        () => {
          if (title1 == "History")
            {
              Get.to(() => EBookViewAll(
                    title: title1,
                    type: 'history',
                  ))
            }
          else if (title1 == "Sport")
            {
              Get.to(() => EBookViewAll(
                    title: title1,
                    type: 'sports',
                  ))
            }
        },
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1 /*listOfBooks.length*/,
                      itemBuilder: (context, index) {
                        return EbookHistoryPicks(slides: listOfBooks);
                      },
                    ),
                  ),
                ),

      /**/
      // SizedBox(height: 5.h),
      SizedBox(height: Get.width * 0.05),
    ],
  );
}

recentReads(List<HomeLiteraryPicks>? listOfBooks, loading, title1, subTitle) {
  return Column(
    children: [
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : SizedBox(
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1 /*listOfBooks.length*/,
                      itemBuilder: (context, index) {
                        return EbookHistoryPicks(slides: listOfBooks);
                      },
                    ),
                  ),
                ),

      /**/
      // SizedBox(height: 5.h),
    ],
  );
}

hinduLibrary(List<HomeLiteraryPicks>? listOfBooks, loading, title1, subtitle) {
  return Column(
    children: [
      headingTitleSubTextremovebottom(
        title1,
        subtitle,
        () => {
          if (title1 == "Hindu Library")
            {
              Get.to(() => EBookViewAll(
                    title: title1,
                    type: 'hindu',
                  ))
            }
          else if (title1 == "Spiritual")
            {
              Get.to(() => EBookViewAll(
                    title: title1,
                    type: 'spiritual',
                  ))
            }
          else if (title1 == "Freedom Fighter")
            {
              Get.to(() => EBookViewAll(
                    title: title1,
                    type: 'Freedom Fighter',
                  ))
            }
        },
      ),
      loading
          ? const CircularProgressIndicator()
          : listOfBooks!.isEmpty
              ? noBooksAvailable()
              : HinduLibSliderList(
                  slides: listOfBooks,
                  itemCount: listOfBooks.length > 5 ? 5 : listOfBooks.length,
                ),
      // SizedBox(height: 16.h),
      SizedBox(height: Get.width * 0.05),
    ],
  );
}

headingTitle(String title, Function() onTapViewAll) {
  return Container(
    margin: EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        TextButton(
          onPressed: onTapViewAll,
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Text(
            'View All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        )
      ],
    ),
  );
}

headingTitleSubText(String title, String subtitle, Function() onTapViewAll) {
  return Container(
    margin: EdgeInsets.only(
      left: 20.w,
      right: 10.w,
      bottom: 10.h,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'DM Sans',
                color: FPcolors.colorBlack,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: 'DM Sans',
                color: FPcolors.color6C7072,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onTapViewAll,
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Text(
            'View All',
            style: TextStyle(
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: FPcolors.colorF35A38),
          ),
        )
      ],
    ),
  );
}

headingTitleSubTextremovebottom(
    String title, String subtitle, Function() onTapViewAll) {
  return Container(
    margin: EdgeInsets.only(
      left: 20.w,
      right: 10.w,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                // fontFamily: 'DM Sans',
                color: FPcolors.colorBlack,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: 'DM Sans',
                color: FPcolors.color6C7072,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onTapViewAll,
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Text(
            'View All',
            style: TextStyle(
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: FPcolors.colorF35A38),
          ),
        )
      ],
    ),
  );
}

headingTitleCategory(String title, String subtitle, Function() onTapViewAll) {
  return Container(
    margin: EdgeInsets.only(
      left: 20.w,
      right: 16.w,
      bottom: 1.h,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                //   fontFamily: 'DM Sans',
                color: FPcolors.colorBlack,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onTapViewAll,
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Text(
            'View All',
            style: TextStyle(
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: FPcolors.colorF35A38),
          ),
        )
      ],
    ),
  );
}

noBooksAvailable() {
  return Padding(
    padding: EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
    ),
    child: const Text(
      "No books Available",
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
