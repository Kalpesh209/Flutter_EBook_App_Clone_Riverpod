import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/square_slide_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/square_img_slide.dart';
import 'package:get/get.dart';

class SquareSlideSliderState extends ChangeNotifier {}

final squareSlideSliderProvider = ChangeNotifierProvider((r) {
  return SquareSlideSliderState();
});

class SquareSlideSlider extends ConsumerWidget {
  final List<SquareSlideModel> slides;
  const SquareSlideSlider(this.slides, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //var state = ref.watch(squareSlideSliderProvider);
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: slides.length,
        itemBuilder: (context, index) => SizedBox(
          width: Get.width * 0.43,
          child: Container(
            margin: EdgeInsets.only(left: Get.width * 0.04),
            child: SquareImgSlide(
              slide: slides[index],
            ),
          ),
        ),
      ),
    );
  }
}
