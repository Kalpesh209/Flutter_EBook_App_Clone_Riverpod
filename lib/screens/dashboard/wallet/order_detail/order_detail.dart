import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/orange_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/fonts/fonts.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/order_detail/models/order_detail_response/order_detail_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/order_detail/models/order_detail_response/order_timeline.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/models/assign_book/assign_book_response/book_order.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/widgets/confirm_cancel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/services/setup_singleton_services.dart';
import '../tabs/all_orders.dart';
import 'models/order_detail_response/data.dart';

class OrderDetailState extends ChangeNotifier {
  Data? order;
  bool _cancelling = false;

  get cancelling => _cancelling;

  set cancelling(status) {
    _cancelling = status;
    notifyListeners();
  }

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  loadOrder(orderId) async {
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('bookorder/user/get-order-by-id/$orderId')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    OrderDetailResponse orderDetailResponse = OrderDetailResponse.fromJson(res);
    order = orderDetailResponse.data!;
    notifyListeners();
  }

  Future<void> cancelOrder(orderId) async {
    debugPrint(orderId);
    cancelling = true;
    //dio.Response<dynamic> response =
    await dioService
        .put(
            'bookorder/user/order-status-change?order_id=$orderId&&order_status=cancel')
        .whenComplete(() => cancelling = false);
    //Map<String, dynamic> res = response.data;
  }
}

final orderDetailProvider =
    ChangeNotifierProvider.family.autoDispose((r, BookOrder order) {
  var state = OrderDetailState()..loadOrder(order.orderId);
  return state;
});

// ignore: must_be_immutable
class OrderDetail extends ConsumerWidget {
  BookOrder order;

  OrderDetail(this.order, {Key? key}) : super(key: key);

  final TextStyle timelineTitle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final TextStyle timelineSubTitle =
      TextStyle(fontSize: 14, color: FPcolors.fpgreyText);

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

  List cancelstatus = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    cancelstatus = [];
    var state2 = ref.watch(allOrdersTabProvider);
    var state = ref.watch(orderDetailProvider(order));

    var bookOrder = state.order;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      bottomNavigationBar: state.loading
          ? Container()
          : state.order?.orderStatus == "cancel" ||
                  state.order?.orderStatus == "completed" ||
                  state.order?.orderStatus == "delivered"
              ? Padding(
                  padding: EdgeInsets.all(Get.width * 0.04),
                  child: FilledButton.tonal(
                    onPressed: () async {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xffFFE3DC),
                      foregroundColor: themeColor,
                    ),
                    child: Text(
                      state.cancelling ? 'Please Wait..' : 'Cancel Order',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(Get.width * 0.04),
                  child: FilledButton.tonal(
                    onPressed: () async {
                      var confirm = await Get.dialog(
                          const Dialog(child: ConfirmCancel()));
                      if (confirm != true) return;
                      try {
                        state.cancelOrder(state.order!.id ?? "");
                        state2.load();

                        Get.back();
                        SnackbarHelper.success("Order Cancelled");
                      } on DioException catch (e) {
                        SnackbarHelper.error(e.response?.data['message']);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xffFFE3DC),
                      foregroundColor: themeColor,
                    ),
                    child: Text(
                      state.cancelling ? 'Please Wait..' : 'Cancel Order',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
      body: state.loading
          ? const Center(child: FullScreenLoader())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID : ${state.order?.orderNumber}',
                      style:
                          TextStyle(color: FPcolors.fpgreyText, fontSize: 14),
                    ),
                    Divider(
                        color: Colors.grey.shade300, height: Get.height * 0.04),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.16,
                          height: Get.width * 0.18,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerImage(
                              imageUrl:
                                  state.order?.bookMaster?.coverImage ?? '',
                              boxFit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: Get.width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //  bookOrder!.orderDate!??,
                                // order.orderDate!,
                                "Delivery on ${bookOrder?.orderDate!.substring(8, 10)} ${month(bookOrder?.orderDate?.substring(5, 7) ?? '')}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                bookOrder?.bookMaster?.bookTitle ?? '',
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
                    Divider(
                      color: Colors.grey.shade300,
                      height: Get.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Seller : ${bookOrder?.seller?.name ?? ''}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: FPcolors.fpgreyText),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Uri phoneno =
                                Uri.parse('tel:${bookOrder?.seller?.number}');
                            if (await launchUrl(phoneno)) {
                              //dialer opened
                            } else {
                              //dailer is not opened
                            }
                          },
                          child: SvgPicture.asset(
                            Assets.icons.callUs,
                            width: Get.width * 0.09,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        color: Colors.grey.shade300, height: Get.height * 0.04),
                    const OrangeTitle(title: 'Order Status'),
                    SizedBox(height: 12.h),
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: state.order?.orderTimeline?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return itemView(
                            state.order?.orderTimeline?[index],
                            ((state.order?.orderTimeline?.length ?? 0) - 1) ==
                                index);
                      },
                    ),
                    SizedBox(height: Get.height * 0.04),
                    const OrangeTitle(title: 'Shipping Details'),
                    SizedBox(height: Get.height * 0.02),
                    (bookOrder?.orderAddress?.isEmpty ?? true)
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookOrder?.orderAddress?[0].name ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                '${bookOrder?.orderAddress?[0].address},${bookOrder?.orderAddress?[0].city}, ${bookOrder?.orderAddress?[0].zipCode}',
                                style: TextStyle(
                                  color: FPcolors.fpgreyText,
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget itemView(OrderTimeline? orderTimeline, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (orderTimeline?.createdAt ?? '') != ''
                      ? themeColor
                      : Colors.grey,
                ),
              ),
              isLast
                  ? Container()
                  : Expanded(
                      child: Container(
                        width: 3.w,
                        color: (orderTimeline?.createdAt ?? '') != ''
                            ? themeColor
                            : Colors.grey,
                      ),
                    ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderTimeline?.status ?? '', style: timelineTitle),
              Text(
                orderTimeline?.createdAt ?? '',
                style: FPfonts.dmSans14grey,
              ),
              SizedBox(height: 32.h)
            ],
          ),
        ],
      ),
    );
  }
}
