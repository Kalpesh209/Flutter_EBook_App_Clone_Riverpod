import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart' as getx;

class RatingWidget extends StatelessWidget {
  final String? bookId;
  final dynamic rating;
  final dynamic provider;

  const RatingWidget(
      {Key? key,
      required this.bookId,
      required this.rating,
      required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ratingValue = double.parse("$rating");

    debugPrint("Rating given $ratingValue");
    return InkWell(
      onTap: () => {
        /*getx.Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          child: RatingDialog(
            id: bookId ?? '',
            type: "Book",
            provider: provider,
          ),
        ),
      )*/
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 22,
          ),
          SizedBox(width: getx.Get.width * 0.01),
          Text(
            '${ratingValue ?? ''}',
            style: TextStyle(
                color: FPcolors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class RatingDialog extends ConsumerWidget {
  final String id;
  final String type;
  final dynamic provider;

  const RatingDialog(
      {Key? key, required this.id, required this.type, required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double rating1 = 3;
    return Container(
      width: getx.Get.width * 0.9,
      padding: EdgeInsets.all(getx.Get.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Assets.auth.images.confusedIcon.image(width: 45, height: 45),
          Text(
            'Rate this book',
            textAlign: TextAlign.center,
            style: getx.Get.textTheme.headlineLarge,
          ),
          SizedBox(height: getx.Get.height * 0.01),
          Text(
            'Enter your feedback here',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          SizedBox(height: getx.Get.height * 0.025),
          RatingBar.builder(
            unratedColor: FPcolors.fpPrimaryLight1,
            itemSize: 50,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                Icon(Icons.star, color: FPcolors.fpPrimary),
            onRatingUpdate: (rating) {
              rating1 = rating;
            },
          ),
          SizedBox(height: getx.Get.height * 0.025),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                Response<dynamic> response = await dioService.post(
                  'bookuser/user/rating',
                  data: {
                    "type": type,
                    "book_id": id,
                    "rating": rating1,
                  },
                ).whenComplete(() {
                  getx.Get.back();
                });
                // RatingResponse ratingResponse = RatingResponse.fromJson(response.data);
                // ratingResponse.data;
                ref
                    .read(provider)
                    .setRating(id, response.data["data"].toDouble());
              },
              child: const Text('Done'),
            ),
          ),
          SizedBox(height: getx.Get.height * 0.015),
          TextButton(
            onPressed: () => getx.Get.back(),
            child: const Text(
              'No, thanks',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
