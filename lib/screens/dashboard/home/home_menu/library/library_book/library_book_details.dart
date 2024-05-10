import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/widgets/detail_part.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/checkout.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/providers/library_book_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';

class LibraryBookDetails extends ConsumerStatefulWidget {
  const LibraryBookDetails({super.key});

  @override
  LibraryBookDetailsState createState() => LibraryBookDetailsState();
}

class LibraryBookDetailsState extends ConsumerState<LibraryBookDetails> {
  @override
  void initState() {
    super.initState();
    String bookId = Get.parameters['book_id'] ?? '';
    debugPrint('book_id :$bookId');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(libraryDetailsProvider).loadDetails(bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(libraryDetailsProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          InkWell(
            /*  onTap: () async {
              String shareText =
                  "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. https://freshpage.in$libraryDetails?book_id=${state.bookDetailsModal.id}";
              shareBook(shareText, state.bookDetailsModal.coverImage ?? '');
            },*/
            onTap: () async {
              String shareUrl = await createDynamicLink(
                  "$libraryDetails?book_id=${state.bookDetailsModal.id}");
              String shareText =
                  "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. $shareUrl";
              print(shareText);
              shareBook(shareText, state.bookDetailsModal.coverImage ?? '');
            },
            child: Assets.icons.share2
                .image(width: Get.width * 0.06)
                .paddingAll(Get.width * 0.03),
          ),
          InkWell(
            onTap: () {},
            child: Assets.icons.moreVertical
                .image(width: Get.width * 0.06)
                .paddingAll(Get.width * 0.03),
          )
        ],
      ),
      body: state.loading
          ? loadingCenter()
          : SingleChildScrollView(
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
                              child: SizedBox(
                                width: Get.width * 0.37,
                                height: Get.height * 0.23,
                                child: FancyShimmerImage(
                                  imageUrl:
                                      state.bookDetailsModal.coverImage ?? '',
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Get.width * 0.04),
                              child: Assets.icons.bookWhite
                                  .image(width: Get.width * 0.1),
                            ),
                          ],
                        ),
                        Container(
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
                  SizedBox(
                    height: Get.height * 0.012,
                  ),
                  Text(
                      state.bookDetailsModal.title ??
                          state.bookDetailsModal.bookTitle ??
                          'N/A',
                      style: AppStyles.titleStyle),
                  SizedBox(height: Get.height * 0.005),
                  Text(
                    state.bookDetailsModal.bookTag ?? '',
                    style: AppStyles.slideSubTitleStyle.copyWith(
                      color: const Color(0xff1B1B1B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.008,
                  ),
                  RatingWidget(
                    rating: state.bookDetailsModal.rating ?? 0,
                    bookId: state.bookDetailsModal.id,
                    provider: libraryDetailsProvider,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const DetailPartWidget(label: 'Chapters', value: 'NA'),
                      DetailPartWidget(
                          label: 'Language',
                          value: state.bookDetailsModal.language ?? "en"),
                      const DetailPartWidget(label: 'Release', value: '2022'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(Get.width * 0.06),
                    child: Html(
                      data: state.bookDetailsModal.about ?? "Sample",
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: Material(
        elevation: 50,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  '10 Days Rent',
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // shivkaran need
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () async {
                    try {
                      if (state.bookDetailsModal.isCart!) {
                        if (state.bookDetailsModal.id == null) {
                          await state.removeFromCart();
                        } else {
                          await state.removeFromCart();
                        }
                      } else {
                        if (state.bookDetailsModal.id == null) {
                          await state.addToCart();
                        } else {
                          await state.addToCart();
                        }

                        Get.to(() => const CheckOut());
                      }
                    } on dio.DioException catch (e) {
                      SnackbarHelper.error(e.toString());
                    }
                  },
                  child: Text(state.addingToCart
                      ? 'Please wait..'
                      //: state.book.isCart ?? false
                      : state.bookDetailsModal.isCart ?? false
                          ? 'Remove'
                          : 'Order Now'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
