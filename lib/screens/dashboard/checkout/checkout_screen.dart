import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/dialogs/confirmation_dialog.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/models/cart_response/cart_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/thanks.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/widgets/address_widget.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/widgets/cart_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/subscrption_page.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/subscrption_page_new.dart';
import 'package:get/get.dart';

import '../../../update_dialog.dart';
import '../home/home_menu/library/checkout/models/address_response/address.dart';
import '../home/home_menu/library/library/tabs/trending_book.dart';

class CheckOutScreenState extends ChangeNotifier {
  List<BookDetailsModal> books = [];
  Address? selectedAddres;
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  loadCart() async {
    books = [];
    dio.Response<dynamic> response =
        await dioService.get('bookorder/user/cart-list');
    Map<String, dynamic> res = response.data;
    CartResponse cartResponse = CartResponse.fromJson(res);

    for (var element in cartResponse.data!.cart!) {
      books.add(BookDetailsModal.fromJson(element.toJson()));
    }

    notifyListeners();
  }

  Future<bool> checkSubscription() async {
    dio.Response<dynamic> response =
        await dioService.get('usersubscription/user/check-subscription');
    Map<String, dynamic> res = response.data;
    return res['data']['id'] != null;
  }

  Future<int> checkOrderLimit() async {
    dio.Response<dynamic> response =
        await dioService.get('bookorder/user/check-book');
    Map<String, dynamic> res = response.data;

    return res["data"];
  }

  var order;

  placeOrderWithSuccess(int amount) {
    Get.close(2);
    thanksForSubscriptionDialog(amount);
    placeOrder();
  }

  placeOrder() async {
    loading = true;

    var subscribed = await checkSubscription();
    loading = false;

    if (subscribed) {
      loading = true;
      debugPrint("placeOrder");

      var requestData = {
        'book_id': books.map((e) => e.bookId).toList().join(','),
        "address_data": {
          "zip_code": selectedAddres?.zipCode ?? '',
          "type": selectedAddres?.type ?? '',
          "name": selectedAddres?.name ?? '',
          "city": selectedAddres?.city ?? '',
          "address": selectedAddres?.address ?? '',
          "mobile_number": selectedAddres?.mobileNumber ?? '',
          "longitude": selectedAddres?.longitude ?? '',
          "latitude": selectedAddres?.latitude ?? ''
        }
      };

      debugPrint('request data : $requestData');
      dio.Response<dynamic> response =
          await dioService.post('bookorder/user/add-order', data: {
        'book_id': books.map((e) => e.bookId).toList().join(','),
        "address_data": {
          "zip_code": selectedAddres?.zipCode ?? '',
          "type": selectedAddres?.type ?? '',
          "name": selectedAddres?.name ?? '',
          "city": selectedAddres?.city ?? '',
          "address": selectedAddres?.address ?? '',
          "mobile_number": selectedAddres?.mobileNumber ?? '',
          "longitude": selectedAddres?.longitude ?? '',
          "latitude": selectedAddres?.latitude ?? ''
        }
      }).whenComplete(() => loading = false);

      Map<String, dynamic> res = response.data;
      debugPrint('response.data ${response.data}');

      // Get.close(2);
      Get.to(() => const ThanksPage());
    } else {
      var result = await Get.to(
          // () => const SubscribePage(showSuccess: false, fromCart: true));
          () => const SubscribePageNew(showSuccess: false, fromCart: true));
      if (result) placeOrder();
    }
  }
}

final checkOutProvider = ChangeNotifierProvider.autoDispose((r) {
  return CheckOutScreenState();
});

class CheckOutScreen extends ConsumerStatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  CheckOutScreenStatee createState() => CheckOutScreenStatee();
}

class CheckOutScreenStatee extends ConsumerState<CheckOutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(checkOutProvider).loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(checkOutProvider);
    var state2 = ref.watch(trendingBooksProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () async {
              // await state2.load();
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      bottomNavigationBar: Material(
        elevation: 16,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                var allowed = await state.checkOrderLimit();
                debugPrint('allowed $allowed');
                debugPrint('state.books.length ${state.books.length}');
                // if ((state.books.length + allowed) > 3) {
                if ((state.books.length) > 3) {
                  // SnackbarHelper.error("You can select max. 3 books for cart in 10 days");
                  _showAlertDialog(context);
                } else {
                  try {
                    await state.placeOrder();
                  } on dio.DioException catch (e) {
                    SnackbarHelper.error(
                        e.response?.data['message'] == "Validation failed"
                            ? "Please select address"
                            : 'Error : ${e.response?.data["message"]}');
                  }
                }
              },
              child: Text(state.loading ? 'Please wait...' : 'Place Order'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('MY ORDER', style: TextStyle(color: FPcolors.fpgreyText)),
              SizedBox(height: Get.height * 0.02),
              ...state.books
                  .map(
                    (book) => CartItem(
                      book,
                      onRemovedFromCart: () async => await state.loadCart(),
                    ).marginOnly(bottom: Get.height * 0.015),
                  )
                  .toList(),
              SizedBox(height: Get.height * 0.04),
              AddressWidget(
                  onAddressSelected: (address) =>
                      state.selectedAddres = address),
            ],
          ),
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ErrorDialog(applink: '', originalStoreVersion: '');
      },
    );
  }
}
