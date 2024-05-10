import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/order_detail/order_detail.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/books_tab.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/models/assign_book/assign_book_response/book_order.dart';
import 'package:get/get.dart';

class BookCard extends ConsumerStatefulWidget {
  final BookOrder order;

  BookCard(
    this.order, {
    super.key,
    required this.index,
    required this.onReturn,
    this.expanded = false,
  });

  int index;
  bool expanded;
  Function onReturn;

  @override
  ConsumerState<BookCard> createState() => _BookCardConsumerState();
}

class _BookCardConsumerState extends ConsumerState<BookCard> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(booksTabProvider);
    var margin = 0 * widget.index.toDouble();
    return Transform.translate(
      offset: Offset(0, margin),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shadowColor: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          child: InkWell(
            onTap: () {
              widget.expanded = !widget.expanded;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.only(
                left: Get.width * 0.04,
                right: Get.width * 0.04,
                top: Get.width * 0.04,
                bottom: Get.width * 0.04,
              ),
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.order.bookTitle ?? '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              'Expires on ${widget.order.returnDate}',
                              style: const TextStyle(
                                  fontSize: 14, color: themeColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        width: Get.width * 0.1,
                        height: Get.width * 0.1,
                        child: FancyShimmerImage(
                          imageUrl: widget.order.coverImage ?? '',
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.08,
                                      vertical: Get.width * 0.14,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Do you want to return?',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: Get.height * 0.01),
                                        // const Text(
                                        //   'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet',
                                        //   textAlign: TextAlign.center,
                                        //   style: TextStyle(
                                        //     color: Color(0xff72777A),
                                        //   ),
                                        // ),
                                        SizedBox(height: Get.height * 0.02),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: FilledButton(
                                                    onPressed: () {
                                                      state.load();
                                                      Get.close(1);
                                                      widget.onReturn(
                                                          widget.order.orderId);
                                                    },
                                                    child:
                                                        const Text('Confirm'))),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.01),
                                        TextButton(
                                          onPressed: () => Get.close(1),
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  isScrollControlled: true,
                                );
                              },
                              child: const Text('Return')),
                          TextButton(
                            onPressed: () =>
                                Get.to(() => OrderDetail(widget.order)),
                            child: SvgPicture.asset(
                              Assets.icons.arrowRight2,
                              width: Get.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ).marginOnly(bottom: 16.h);
  }
}
//Material(
//               clipBehavior: Clip.antiAlias,
//               elevation: 4,
//               shadowColor: Colors.grey.shade200,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(Get.width * 0.04),
//                 topRight: Radius.circular(Get.width * 0.04),
//               ),
//               child: Container(
//                 padding: EdgeInsets.only(
//                   left: Get.width * 0.04,
//                   right: Get.width * 0.04,
//                   top: Get.width * 0.04,
//                   bottom: Get.width * 0.06,
//                 ),
//                 color: Colors.transparent,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.order.bookTitle ?? '',
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: Get.height * 0.01),
//                               Text(
//                                 'Expires on ${widget.order.returnDate}',
//                                 style: const TextStyle(
//                                     fontSize: 14, color: themeColor),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           clipBehavior: Clip.antiAlias,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100)),
//                           width: Get.width * 0.1,
//                           height: Get.width * 0.1,
//                           child: FancyShimmerImage(
//                             imageUrl: widget.order.coverImage ?? '',
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ).paddingOnly(
//               left: 4.0,
//               right: 4.0,
//               top: 4.0,
//             )