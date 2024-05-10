import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/providers/select_book_search_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../../../config/route/route_names.dart';

class SelectBookSearchScreen extends ConsumerStatefulWidget {
  const SelectBookSearchScreen({super.key, required this.type});

  final String type;

  @override
  SelectBookSearchScreenState createState() => SelectBookSearchScreenState();
}

class SelectBookSearchScreenState
    extends ConsumerState<SelectBookSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(selectBookSearchBookProvider);

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: FPcolors.colorWhite)),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              Assets.background.bgTopCorner.keyName,
              width: Get.width / 1.6,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller: searchController,
                            onChanged: (searchTerm) {
                              /*    if (widget.type == 'Library') {
                                ref.watch(selectBookSearchBookProvider).getSearchedLibraryBooks(searchTerm);
                              } else {*/
                              if (searchTerm.length >= 3) {
                                ref
                                    .watch(selectBookSearchBookProvider)
                                    .getSearchedBooks(searchTerm, widget.type);
                              }
                              //}
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              filled: true,
                              fillColor: FPcolors.colorD9D9D9,
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: FPcolors.colorBlack,
                                  width: 1,
                                ),
                              ),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Assets.icons.search
                                    .image(width: 10, height: 10),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  debugPrint('on close');
                                  searchController.clear();
                                  state.onCloseSearch();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Color(0xff090A0A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          ref.watch(selectBookSearchBookProvider).onBack();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  if (ref.watch(selectBookSearchBookProvider).loading)
                    const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ref
                            .watch(selectBookSearchBookProvider)
                            .books
                            .length,
                        itemBuilder: (context, index) {
                          BookDetailsModal book = ref
                              .watch(selectBookSearchBookProvider)
                              .books[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(eBookDetails,
                                  parameters: {'book_id': book.id ?? ''});
                            },
                            child: Container(
                              padding: EdgeInsets.all(Get.width * 0.02),
                              child: Row(children: [
                                CircleAvatar(
                                  radius: 18,
                                  child: ClipOval(
                                    child: book.coverImage != "null"
                                        ? FancyShimmerImage(
                                            imageUrl: book.coverImage ?? '',
                                            width: Get.width * 0.18,
                                            height: Get.height * 0.11,
                                          )
                                        : SvgPicture.asset(
                                            Assets.settings.svg.emptyimage),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.03),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.bookTitle ?? book.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      book.authorName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: FPcolors.fpgreyText),
                                    ),
                                  ],
                                ))
                              ]),
                            ),

                            /*Container(
                                  padding: EdgeInsets.all(Get.width * 0.04),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    border: Border.all(
                                      color: FPcolors.greyBorder,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04),
                                        child:book.coverImage != "null" ? FancyShimmerImage(
                                          imageUrl: book.coverImage ?? '',
                                          width: Get.width * 0.18,
                                          height: Get.height * 0.11,
                                        ) : SvgPicture.asset(Assets.settings.svg.emptyimage),
                                      ),
                                      SizedBox(width: Get.width * 0.03),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              book.bookTitle ??
                                                  book.title ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Text(
                                              book.authorName ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: FPcolors.fpgreyText),
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Row(
                                              children: [
                                                if (book.contentType != null &&
                                                    book.contentType!.isNotEmpty)
                                                  TagWidget(tag: (book.contentType ?? '')),
                                                RatingWidget(
                                                  rating: book.rating ?? 0.0,
                                                  bookId: book.id,
                                                  provider: null,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.01),
                                      book.isCart == true
                                          ? InkWell(
                                              onTap: () async {
                                                book.isCart = !(book.isCart ?? false);
                                              },
                                              child: SvgPicture.asset(
                                                Assets.icons.tick2,
                                                width: Get.width * 0.08,
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ),*/
                          ).marginOnly(bottom: 12.h);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
