import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/info_box.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/orange_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out-of-box/out_of_box_response/book_order.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out_of_box_detail/code_scanner.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/widgets/confirm_delivery.dart';
import 'package:get/get.dart';

import '../tabs/out_of_box_tab.dart';

class OutOfBoxDetailState extends ChangeNotifier {}

final outOfBoxDetailProvider = ChangeNotifierProvider((r) {
  return OutOfBoxDetailState();
});

class OutOfBoxDetail extends ConsumerWidget {
  final BookOrder order;
  const OutOfBoxDetail(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(outOfBoxTabProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: () {
                Get.dialog(
                  const Dialog(
                    child: ConfirmDelivery(),
                  ),
                ).then((value) {
                  if (value == true) {
                    Get.to(() => CodeScanner(order));
                  } else {
                    // Get.back();
                  }
                });
              },
              child: const Text('Drop Off')),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.16,
                    height: Get.width * 0.16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          imageUrl: order.bookMaster?.coverImage ?? ''),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.bookMaster?.bookTitle ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   'Relaxing sound 2',
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     color: FPcolors.fpgreyText,
                        //     fontWeight: FontWeight.bold,
                        //     height: 1.5,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              const OrangeTitle(title: 'Order Details'),
              SizedBox(height: Get.height * 0.02),
              InfoBox(label: 'Date of Order', value: order.orderDate ?? ''),
              SizedBox(height: Get.height * 0.01),
              order.orderAddress!.isEmpty
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoBox(
                            label: 'To Location',
                            value:
                                order.orderAddress![0].city.toString() ?? ""),
                        SizedBox(height: Get.height * 0.04),
                        const OrangeTitle(title: 'Personal Details'),
                        SizedBox(height: Get.height * 0.02),
                        InfoBox(
                            label: 'Name',
                            value:
                                order.orderAddress![0].name.toString() ?? ""),
                        SizedBox(height: Get.height * 0.01),
                        InfoBox(
                            label: 'City',
                            value:
                                order.orderAddress![0].city.toString() ?? ""),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InfoBox(
                                label: 'Address',
                                value:
                                    order.orderAddress![0].address.toString()),
                            SvgPicture.asset(Assets.icons.location),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InfoBox(
                                label: 'Phone',
                                value: order.orderAddress![0].mobileNumber
                                        .toString() ??
                                    ""),
                            SvgPicture.asset(Assets.icons.callUs),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        InfoBox(
                            label: 'Zip/Postal Code',
                            value: order.orderAddress![0].zipCode.toString() ??
                                ""),
                        SizedBox(height: Get.height * 0.02),
                      ],
                    ),
            ]),
          ),
        ),
      ),
    );
  }
}
