import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/providers/books_slider_provider.dart';
import 'package:get/get.dart';

class BookSlider extends ConsumerStatefulWidget {
  const BookSlider({Key? key}) : super(key: key);

  @override
  BookSliderState createState() => BookSliderState();
}

class BookSliderState extends ConsumerState<BookSlider> {
  @override
  void initState() {
    super.initState();
    ref.read(bookSliderProvider).getEbooksCarousel();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(bookSliderProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterCarousel(
          items: List.generate(
            state.carouselBooks.length,
            (index) => InkWell(
              onTap: () {
                Get.toNamed(eBookDetails, parameters: {
                  'book_id': state.carouselBooks[index].id ?? ''
                });
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(Get.width * 0.04),
                ),
                margin: EdgeInsets.all(Get.width * 0.04),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      state.carouselBooks[index].coverImage!,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(Get.width * 0.06),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 65,
                            child: TagWidget(
                              tag: 'New',
                              background: Color(0xffFFD83D),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            state.carouselBooks[index].bookTitle!,
                            style: AppStyles.titleStyle
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            state.carouselBooks[index].tag!,
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: 300.h,
            viewportFraction: 1,
            autoPlay: false,
            aspectRatio: 16 / 9,
            floatingIndicator: false,
            enableInfiniteScroll: true,
            indicatorMargin: 0.0,
            showIndicator: false,
            onPageChanged: (index, reason) => {state.activeSlide = index},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Dot(
              active: index == state.activeSlide,
            ),
          ),
        )
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;

  const Dot({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: active ? 30 : 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: active ? themeColor : Colors.grey.shade200,
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
