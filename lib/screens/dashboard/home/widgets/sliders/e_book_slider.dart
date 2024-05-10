import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/e_book_slide.dart';
import 'package:get/get.dart';

class EbookSlider extends StatelessWidget {
  final List<BookDetailsModal?> slides;

  const EbookSlider({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Get.width / Get.height * 5.3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: slides.length,
          itemBuilder: (context, index) => SizedBox(
            child: EbookSlide(slide: slides[index]),
          ),
        ),
      ),
    );
  }
}
