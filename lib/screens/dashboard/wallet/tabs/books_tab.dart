import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/models/assign_book/assign_book_response/assign_book_response.dart';
import 'package:get/get.dart';

import '../widgets/book_card.dart';
import 'models/assign_book/assign_book_response/book_order.dart';

class BooksTabState extends ChangeNotifier {
  bool isExpanded = false;

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<BookOrder> orders = [];

  load() async {
    orders = [];
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('bookorder/user/assign-book')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    AssignBookResponse assignBookResponse = AssignBookResponse.fromJson(res);
    // ignore: curly_braces_in_flow_control_structures
    assignBookResponse.data?.bookOrder?.forEach((element) {
      if (element.bookMaster != null) orders.add(element);
    });
    notifyListeners();
  }

  Future<void> returnOrder(orderId) async {
    EasyLoading.show(status: 'Please wait..');
    dio.Response<dynamic> response = await dioService
        .put(
            'bookorder/user/order-status-change?order_id=$orderId&&order_status=return pending')
        .whenComplete(() => EasyLoading.dismiss());
    Map<String, dynamic> res = response.data;
  }
}

final booksTabProvider = ChangeNotifierProvider.autoDispose((r) {
  return BooksTabState()..load();
});

class BooksTab extends ConsumerWidget {
  const BooksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(booksTabProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return BookCard(
                state.orders[index],
                index: index,
                onReturn: (orderId) async {
                  try {
                    await state.returnOrder(orderId);
                    state.load();
                    SnackbarHelper.success("Book statues updated");
                  } on dio.DioException catch (e) {
                    SnackbarHelper.error(e.response?.data['message']);
                  }
                },
              );
            },
            // separatorBuilder: (BuildContext context, int index) => SizedBox(
            //   height: Get.height * 0.01,
            // ),
            itemCount: state.orders.length,
          ),
        ),
        if (state.loading) const FullScreenLoader(),
      ],
    );
  }
}
