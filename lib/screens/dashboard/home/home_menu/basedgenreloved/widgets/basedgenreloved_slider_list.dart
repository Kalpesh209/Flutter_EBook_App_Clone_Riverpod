import 'package:flutter/cupertino.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import '../../../models/home_literarypicks_model.dart';
import 'basedgenreloved_slider.dart';

class BasedGenrelovedSliderList extends StatelessWidget {
  final List<HomeLiteraryPicks> slides; // Change the type to List<Ebook>
  final int itemCount;

  const BasedGenrelovedSliderList({
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
            width: Get.width * 0.72,
            child: BaseGenrelovedSlide(slide: slides[index]),
          ),
        ),
      ),
    );
  }
}
