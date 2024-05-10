import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/audio_book_slider.dart';
import 'package:get/get.dart';

class AudiobookSlider extends StatelessWidget {
  final List<BookDetailsModal?> slides;
  final int itemCount;

  const AudiobookSlider(
      {super.key, required this.slides, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Get.width / Get.height * 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) => SizedBox(
            width: Get.width * 0.85,
            child: AudiobookSlide(slide: slides[index]),
          ),
        ),
      ),
    );
  }
}
