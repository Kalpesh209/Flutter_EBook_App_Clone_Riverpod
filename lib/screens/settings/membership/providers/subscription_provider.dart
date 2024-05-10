import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/models/subscription_response/subscription.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/models/subscription_response/subscription_response.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../common/helpers/snakbar_helper.dart';
import '../../../../config/services/setup_singleton_services.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../globals.dart';

class SubscriptionPageState extends ChangeNotifier {
  List<Subscription> items = [];
  String? heading_one = "";
  String? heading_two = "";
  String? heading_three = "";
  int index = 0;
  String? details = "";
  bool checkTerm = true;
  bool subscribed = false;
  bool _loading = false;
  bool _paymentDoneSuccessfully = false;

  get loading => _loading;
  get paymentDoneSuccessfully => _paymentDoneSuccessfully;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  set paymentDoneSuccessfully(status) {
    _paymentDoneSuccessfully = status;
    notifyListeners();
  }

  load() async {
    subscribed = await checkSubscriptionCheck();
    loading = true;
    Response<dynamic> response =
        await dioService.get('subscription/user/get-subscription-list');
    Map<String, dynamic> res = response.data;
    SubscriptionResponse subscriptionResponse =
        SubscriptionResponse.fromJson(res);
    items = subscriptionResponse.data?.subscription ?? [];
    loading = false;
    notifyListeners();
  }

  update(int updateIndex) {
    index = updateIndex;
    notifyListeners();
  }

  void onCheckChanged(bool? value) {
    debugPrint('checkTerm $value');
    checkTerm = value ?? false;
    notifyListeners();
  }

  final CarouselController carouselController = CarouselController();
  int currentPage = 0;

  onPageChanged(int index, CarouselPageChangedReason reason) {
    currentPage = index;
    notifyListeners();
  }

  Future<bool> checkSubscriptionCheck() async {
    dio.Response<dynamic> response =
        await dioService.get('usersubscription/user/check-subscription');
    Map<String, dynamic> res = response.data;
    return res['data']['is_active'];
  }

  Future<bool> verfiyedRazorpay(
      String orderId, String paymentId, String signature) async {
    // dio.Response<dynamic> response =
    // await dioService.get('/usersubscription/user/verify-razorpay-payment');

    Response<dynamic> response = await dioService
        .post('usersubscription/user/verify-razorpay-payment',
            data: {
              'razorpay_order_id': orderId,
              'razorpay_payment_id': paymentId,
              'razorpay_signature': signature
            },
            options: Options(headers: {"Authorization": token}))
        .whenComplete(() => {});

    Map<String, dynamic> res = response.data;

    debugPrint("verify-razorpay-payment  response   $res");

    if (res["success"] == true) {
      _paymentDoneSuccessfully = true;
    } else {
      _paymentDoneSuccessfully = false;
    }

    return res['data']['message'];
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    SnackbarHelper.error(
        "Payment Failed : Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    _paymentDoneSuccessfully = false;
    // showAlertDialog(context as BuildContext, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    print(response.data.toString());
    SnackbarHelper.error(
        "Payment Successful Payment ID: ${response.paymentId}");
    verfiyedRazorpay(response.orderId.toString(), response.paymentId.toString(),
        response.signature.toString());
    /*  showAlertDialog(
        BuildContext as BuildContext, "Payment Successful", "Payment ID: ${response.paymentId}");*/
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    SnackbarHelper.error("External Wallet Selected : ${response.walletName}");
    _paymentDoneSuccessfully = false;
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> razorpayOrderCreate(String id) async {
    Response<dynamic> response = await dioService
        .post('usersubscription/user/razorpay-order-create',
            data: {'subscription_id': id},
            options: Options(headers: {"Authorization": token}))
        .whenComplete(() => {});

    Map<String, dynamic> res = response.data;

    // debugPrint("verify-razorpay-payment  response   $res");

    rozzarPayIntergation(res);

    return res['data']['success'];
  }

  void rozzarPayIntergation(Map<String, dynamic> res) {
    var amount = res['data']['amount']! * 100;
    debugPrint(" Price details $amount");

    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_uyDsZt1RkoLe3s',
      'amount': amount,
      'name': "",
      'description': "",
      'order_id': res['data']['id'],
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }
}

final subscriptionPageProvider = ChangeNotifierProvider.autoDispose((r) {
  return SubscriptionPageState()..load();
});
