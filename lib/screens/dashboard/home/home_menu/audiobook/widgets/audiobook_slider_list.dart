import 'package:flutter/cupertino.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/audio_book_slider.dart';
import 'package:get/get.dart';

class AudiobookSliderList extends StatelessWidget {
  final List<BookDetailsModal> slides; // Change the type to List<Ebook>
  final int itemCount;

  const AudiobookSliderList({
    super.key,
    required this.slides,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Get.width / Get.height * 5.3,
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
