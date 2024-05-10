import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out-of-box/out_of_box_response/book_order.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out-of-box/out_of_box_response/out_of_box_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out_of_box_detail/out_of_box_detail.dart';
import 'package:get/get.dart';

class OutOfBoxTabState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<BookOrder> orders = [];

  load() async {
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('bookorder/user/get-out-of-box')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    OutOfBoxResponse outOfBoxResponse = OutOfBoxResponse.fromJson(res);
    orders = outOfBoxResponse.data?.bookOrder ?? [];
    notifyListeners();
  }
}

final outOfBoxTabProvider = ChangeNotifierProvider.autoDispose((r) {
  return OutOfBoxTabState()..load();
});

class OutOfBoxTab extends ConsumerWidget {
  const OutOfBoxTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(outOfBoxTabProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (ctx, index) {
              var order = state.orders[index];
              return InkWell(
                onTap: () {
                  Get.to(() => OutOfBoxDetail(order));
                },
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.04),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.14,
                        height: Get.width * 0.14,
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.005),
                            Text(
                              order.returnDate ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: themeColor,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                ),
              );
            }),
        if (state.loading) const FullScreenLoader()
      ],
    );
  }
}
