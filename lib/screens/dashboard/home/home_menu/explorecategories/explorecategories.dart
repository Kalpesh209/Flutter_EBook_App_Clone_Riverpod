import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../home_category/category_view_screen.dart';
import '../../models/book_details_modal.dart';
import '../../models/home_category_model.dart';
import '../../providers/top_slider_provider.dart';
import '../../widgets/top_slider/top_slider.dart';
import '../../widgets/top_slider/top_slider_slide.dart';

class ExploreCategories extends StatelessWidget {

  final List<HomeCategory?> slides;


  // const ExploreCategories({Key? key}) : super(key: key);
  const ExploreCategories({super.key, required this.slides});

/*  @override
  ExploreCategoriesState createState() => ExploreCategoriesState();*/

  @override
  Widget build(BuildContext context) {
  //  var state = ref.watch(topSliderProvider);

    // print("Data size get ${slides.length}");


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          slides.length, (index) => SizedBox(
            width: Get.width / 4,
            child: InkWell(
              onTap: () {
                //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
                Get.to(() => CategoryViewScreen( title: slides[index]!.type.toString(),categoryId:  slides[index]!.id.toString(),type:"LIBRARY_BOOK_ONLY"));
              },
              child: TopSliderSlide(
                  image: slides[index]!.image.toString(),
                  title: slides[index]!.type.toString()),
            ),
          ),
        ).toList(),
      ),
    );
  }

}

/*class ExploreCategoriesState extends ConsumerState<ExploreCategories> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.watch(topSliderProvider).getEbooksCarousel();
      ref.watch(topSliderProvider).getHomeCategory();
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
                //Get.toNamed(eBookDetails, parameters: {'book_id': state.carouselBooks[index].id ?? ''});
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
}*/
