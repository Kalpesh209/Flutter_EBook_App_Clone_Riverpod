import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/interstitial_ad.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/book_chapter.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/widgets/detail_part.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/providers/books_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/providers/ebook_detail_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../../../../helper/refreshpage.dart';

class EbookDetail extends ConsumerStatefulWidget {
  const EbookDetail({Key? key}) : super(key: key);

  @override
  EbookDetailState createState() => EbookDetailState();
}

class EbookDetailState extends ConsumerState<EbookDetail> {
  String chapterId = Get.parameters['chapterId'] ?? '';

  @override
  void initState() {
    super.initState();
    String bookId = Get.parameters['book_id'] ?? '';
    debugPrint('book_id :$bookId');

    FirebaseAnalytics.instance.logEvent(
        name: 'open_book_detail',
        parameters: {'book_id': bookId}).then((n) => null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // loadAd();
      ref.read(ebookDetailProvider).getChaptersById(bookId);
      ref.read(ebookDetailProvider).setChapterRead(bookId);
      ref.read(ebookDetailProvider).loadDetails(bookId);
    });
  }

  /* loadAd() {

   // FirebaseAdMob.instance.initialize(appId:"ca-app-pub-9733544482674541~1896256126");

    Interstitialad ad = Interstitialad();
    ad.loadAd();
    Future.delayed(const Duration(seconds: 5), () {
      ad.showAd();
    });

  }*/

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(ebookDetailProvider);
    var alreadyAUser = state.bookDetailsModal.rating;
    debugPrint('rating $alreadyAUser');

    return WillPopScope(
      onWillPop: () async {
        ref.watch(booksScreenProvider).continueReading();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: SvgPicture.asset(
                Assets.settings.svg.appbarBackbutton,
                height: 30,
                width: 30,
              ),
              onPressed: () => {
                    // Navigator.of(context).pop()
                    Get.offAndToNamed(dashboard)
                    /*  if(alreadyAUser == 1){
                  Get.offAndToNamed(dashboard)
                }else{
                  Navigator.of(context).pop()
                }*/
                  }),
          actions: [
            InkWell(
              onTap: () {
                String shareText =
                    "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. https://freshpage.in$eBookDetails?book_id=${state.bookDetailsModal.id}";
                shareBook(shareText, state.bookDetailsModal.coverImage ?? '');
              },
              /*onTap: () async  {
                String shareUrl = await createDynamicLink("$eBookDetails?book_id=${state.bookDetailsModal.id}");
                String shareText =   "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. $shareUrl";
                print(shareText);
                shareBook(shareText, state.bookDetailsModal.coverImage ?? '');
              },*/
              child: Assets.icons.download //share2
                  .image(width: Get.width * 0.048)
                  .paddingAll(Get.width * 0.005),
            ),
            /* InkWell(
              onTap: () {},
              child: Assets.icons.moreVertical
                  .image(width: Get.width * 0.06)
                  .paddingAll(Get.width * 0.03),
            )*/
            const SizedBox(
              width: 10,
            ),
            LikeButton(
              onTap: (isLiked) async {
                state.likeAlbum(state.bookDetailsModal.id!);
                if (state.bookDetailsModal.isFavourite == true) {
                  state.bookDetailsModal.isFavourite = false;
                } else {
                  state.bookDetailsModal.isFavourite = true;
                }
                return !isLiked;
              },
              isLiked: state.bookDetailsModal.isFavourite,
              // onTap: state.onLikeButtonTapped,
              size: 30,
              circleColor: CircleColor(
                  start: FPcolors.fpPrimary, end: FPcolors.fpPrimary),
              bubblesColor: BubblesColor(
                dotPrimaryColor: FPcolors.fpPrimary,
                dotSecondaryColor: FPcolors.fpPrimary,
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? FPcolors.fpPrimary : FPcolors.colorBlack,
                  size: 30,
                );
              },
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: state.loading
            ? loadingCenter()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    child: state.bookDetailsModal.coverImage !=
                                            null
                                        ? FancyShimmerImage(
                                            imageUrl: state.bookDetailsModal
                                                    .coverImage ??
                                                '',
                                            width: Get.width * 0.37,
                                            height: Get.height * 0.23,
                                            boxFit: BoxFit.cover,
                                          )

                                        /* Image.network(
                                      state.bookDetailsModal.coverImage ?? '',
                                      width: Get.width * 0.37,
                                      height: Get.height * 0.23,
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, error, stackTrace) {
                                        return SizedBox(
                                            width: Get.width * 0.37,
                                            height: Get.height * 0.23,
                                            child:  Center(
                                                child: SvgPicture.asset(Assets.settings.svg.emptyimage)*/ /*Text("No Image")*/ /*));
                                      },
                                    )*/
                                        : SvgPicture.asset(
                                            Assets.settings.svg.emptyimage),
                                  ),
                                  state.bookDetailsModal.coverImage == "V" ||
                                          state.bookDetailsModal.coverImage ==
                                              "v"
                                      ? const SizedBox()
                                      : const SizedBox() /*Padding(
                                          padding:
                                              EdgeInsets.all(Get.width * 0.04),
                                          child: Assets.icons.bookWhite
                                              .image(width: Get.width * 0.1),
                                        )*/
                                  ,
                                ],
                              ),
                              state.bookDetailsModal.coverImage == "V" ||
                                      state.bookDetailsModal.coverImage == "v"
                                  ? const SizedBox()
                                  : Container(
                                      height: Get.height * 0.025,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.2),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.012),
                        Text(
                          state.bookDetailsModal.bookTitle ?? '',
                          style: AppStyles.titleStyle,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: Get.height * 0.005),
                        Text(
                          state.bookDetailsModal.bookTag ?? '',
                          style: AppStyles.slideSubTitleStyle.copyWith(
                            color: const Color(0xff1B1B1B),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.005),
                        RatingWidget(
                          rating: state.bookDetailsModal.rating.isNull
                              ? 0.0
                              : state.bookDetailsModal.rating,
                          bookId: state.bookDetailsModal.id ?? '',
                          provider: ebookDetailProvider,
                        ),
                        SizedBox(height: Get.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailPartWidget(
                                label: 'Chapters',
                                value: state.loading
                                    ? "..."
                                    : state.bookDetailsModal.chapter
                                        .toString() /*state.chapters.length.toString()*/),
                            DetailPartWidget(
                              label: 'Language',
                              value: (state.bookDetailsModal.language ??
                                  " English"),
                            ),
                            DetailPartWidget(
                                label: 'Release',
                                value: state.loading
                                    ? "..."
                                    : state.bookDetailsModal.releaseYear ?? ''),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(Get.width * 0.06),
                          child: Html(
                            data: state.bookDetailsModal.about ?? '',
                          ),
                        )
                      ],
                    ),
                  ),
                  state.chapters.isEmpty
                      ? const SizedBox(
                          height: 1,
                        )
                      /*  SlidingUpPanelWidget(
                    anchor: 0.5,
                    panelStatus: SlidingUpPanelStatus.collapsed,
                    controlHeight: 30,
                    panelController: state.panelController,
                    child: _panel(state.scrollController),
                  )*/
                      : SlidingUpPanelWidget(
                          anchor: 0.5,
                          panelStatus: SlidingUpPanelStatus.collapsed,
                          controlHeight: 80,
                          panelController: state.panelController,
                          child: _panel(state.scrollController, chapterId),
                        ),
                ],
              ),
      ),
    );
  }

  Widget _panel(ScrollController sc, String chapterId) {
    var state = ref.watch(ebookDetailProvider);

    /*  var index = 0;
    if(chapterId  !=  null) {
      if(state.chapters.isNotEmpty) {
        for (int i = 0; i < state.chapters.length; i++) {
          if (state.chapters[i].id == chapterId) {
            index = i;
          }
        }
        Get.to(
              () =>
              BookChapter(
                ref: ref,
                bookName: state.bookDetailsModal.bookTitle ?? '',
                chapters: state.chapters,
                index: index,
                bookId: state.bookDetailsModal.id ?? '',
              ),
        );

      }
    }*/

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.width * 0.06),
          topRight: Radius.circular(Get.width * 0.06),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: Get.width * 0.06,
        right: Get.width * 0.06,
        top: Get.width * 0.02,
        bottom: Get.width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.02),
          const Text(
            'Chapters',
            style: TextStyle(
              color: themeColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Expanded(
            child: state.loading
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator())
                : state.chapters.isEmpty
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: Text("No Chapters"))
                    : ListView.builder(
                        itemCount: state.chapters.length,
                        itemBuilder: (c, index) {
                          Chapter chapter = state.chapters[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => BookChapter(
                                  ref: ref,
                                  bookName:
                                      state.bookDetailsModal.bookTitle ?? '',
                                  chapters: state.chapters,
                                  index: index,
                                  bookId: state.bookDetailsModal.id ?? '',
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.017),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '0${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.695,
                                    child: Text(
                                      chapter.title!,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Assets.icons.arrowRight
                                      .image(width: Get.width * 0.06)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
