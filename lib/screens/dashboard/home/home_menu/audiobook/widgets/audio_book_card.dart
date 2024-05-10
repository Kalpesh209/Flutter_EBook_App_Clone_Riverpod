import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class AudiobookCard extends StatelessWidget {
  final BookDetailsModal? book;

  const AudiobookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(book!.coverImage);
    // List<String> tags = book!.tag!.split(",");
    return Container(
      // width: double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: Get.width * 0.02, horizontal: Get.width * 0.04),
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
                child: Image.network(
                  book?.coverImage ?? '',
                  width: Get.width * 0.22,
                  height: Get.height * 0.13,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text("No Image"));
                  },
                ),
              ),
              book!.coverImage == "V" || book!.coverImage == "v"
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, right: 4.0),
                      child:
                          Assets.icons.bookWhite.image(width: Get.width * 0.07),
                    ),
            ],
          ),
          SizedBox(width: Get.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  book?.title == null ? (book?.bookTitle ?? '') : '',
                  maxLines: 1,
                  style: AppStyles.titleStyle,
                ),
                SizedBox(height: Get.width * 0.01),
                Text(
                  "Author",
                  style: AppStyles.slideSubTitleStyle,
                  maxLines: 1,
                ),
                SizedBox(height: Get.width * 0.05),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TagWidget(
                            tag: book!.bookTag == "" ? "Art" : book!.bookTag)),
                    const SizedBox(width: 6),
                    RatingWidget(
                      rating: book?.rating ?? 0.0,
                      bookId: book?.id,
                      provider: null,
                    )
                    //if (slide.cornerIcon != null) slide.cornerIcon!
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
