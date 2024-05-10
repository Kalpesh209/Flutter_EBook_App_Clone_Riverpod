import 'package:dio/dio.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/order_detail/order_detail.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/models/all_orders/all_order_response/all_order_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/models/assign_book/assign_book_response/book_order.dart'
    as ab;
import 'package:get/get.dart' as getx;

import '../../../../config/services/setup_singleton_services.dart';
import 'models/all_orders/all_order_response/book_order.dart';

class AllOrdersTabState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<BookOrder> orders = [];

  remove(String id) {
    orders.removeWhere((element) => element.orderId == id);
    notifyListeners();
  }

  load() async {
    loading = true;
    Response<dynamic> response = await dioService
        .get('bookorder/user/pending-book')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    AllOrderResponse allOrderResponse = AllOrderResponse.fromJson(res);
    orders = allOrderResponse.data!.bookOrder ?? [];
    notifyListeners();
  }
}

final allOrdersTabProvider = ChangeNotifierProvider.autoDispose((r) {
  return AllOrdersTabState()..load();
});

class AllOrdersTab extends ConsumerWidget {
  const AllOrdersTab({Key? key}) : super(key: key);

  String month(String date) {
    switch (date) {
      case "01":
        return "Jan";
      case "02":
        return "Feb";
      case "03":
        return "Mar";
      case "04":
        return "Apr";
      case "05":
        return "May";
      case "06":
        return "Jun";
      case "07":
        return "July";
      case "08":
        return "Aug";
      case "09":
        return "Sep";
      case "10":
        return "Oct";
      case "11":
        return "Nov";
      case "12":
        return "Dec";
    }
    return "";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(allOrdersTabProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.builder(
          itemBuilder: (ctx, index) {
            var order = state.orders[index];
            return InkWell(
              onTap: () {
                getx.Get.to(
                  () {
                    debugPrint('order.toJson() ${order.toJson()}');
                    return OrderDetail(
                      ab.BookOrder.fromJson({'order_id': order.orderId}),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(getx.Get.width * 0.04),
                child: Row(
                  children: [
                    SizedBox(
                      width: getx.Get.width * 0.14,
                      height: getx.Get.width * 0.18,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FancyShimmerImage(
                          imageUrl: order.bookMaster?.coverImage ?? '',
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: getx.Get.width * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.bookTitle ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Order will be delivered by ${order.delivaryDate!.substring(8, 10)} ${month(order.delivaryDate!.substring(5, 7))}",
                            style: TextStyle(
                              fontSize: 14,
                              color: FPcolors.fpgreyText,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: state.orders.length,
        ),
        if (state.loading) const FullScreenLoader(),
      ],
    );
  }
}
