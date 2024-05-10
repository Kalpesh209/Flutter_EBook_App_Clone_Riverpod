import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/top_slider/top_slider_slide.dart';
import 'package:get/get.dart';

import '../../providers/top_slider_provider.dart';

class TopSlider extends ConsumerStatefulWidget {
  const TopSlider({Key? key}) : super(key: key);

  @override
  TopSliderState createState() => TopSliderState();
}

class TopSliderState extends ConsumerState<TopSlider> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(topSliderProvider).getEbooksCarousel();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(topSliderProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          state.carouselBooks.length,
          (index) => SizedBox(
            width: Get.width / 4,
            child: InkWell(
              onTap: () {
                Get.toNamed(eBookDetails, parameters: {
                  'book_id': state.carouselBooks[index].id ?? ''
                });
              },
              child: TopSliderSlide(
                  image: state.carouselBooks[index].coverImage!,
                  title: state.carouselBooks[index].bookTitle!),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
