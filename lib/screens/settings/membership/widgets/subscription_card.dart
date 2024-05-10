import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/web_view.dart';
import 'package:get/get.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

import '../../../../common/widgets/components.dart';
import '../../../../config/fonts/fonts.dart';
import '../models/subscription_response/subscription.dart';
import 'package:http/http.dart' as http;

class SubscriptionCardState extends ChangeNotifier {
  sendTokenToServer(subId, token) async {
    var body = {
      'subscription_id': subId,
      'stripe_token': token,
    };
    //dio.Response<dynamic> response =
    await dioService.post('usersubscription/user/add-subscription', data: body);
    //Map<String, dynamic> res = response.data;
  }
}

final subscriptionCardProvider = ChangeNotifierProvider((r) {
  return SubscriptionCardState();
});

class SubscriptionCard extends ConsumerWidget {
  final Function onSuccess;
  final Subscription subscription;
  SubscriptionCardState? subscriptionCardState;
  final bool fromcart;
  var paymentIntent;

  SubscriptionCard({
    Key? key,
    required this.subscription,
    required this.onSuccess,
    required this.fromcart,
  }) : super(key: key);

  String body = "";
  String callback = "flutterDemoApp";
  String checksum = "";

  Map<String, String> headers = {};
  List<String> environmentList = <String>['SANDBOX', 'PRODUCTION'];
  bool enableLogs = true;
  Object? result;
  String environmentValue = 'SANDBOX';
  String appId = "abc";
  String merchantId = "PGTESTPAYUAT";
  String packageName = "com.freshpage.application";

  Future<void> initPhonePeSdk() async {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((isInitialized) =>
            {result = 'PhonePe SDK Initialized - $isInitialized'})
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  /*

  void isPhonePeInstalled() {
    PhonePePaymentSdk.isPhonePeInstalled()
        .then((isPhonePeInstalled) => {
              setState(() {
                result = 'PhonePe Installed - $isPhonePeInstalled';
                body = getChecksum().toString();
                print(body);
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }




  void getPackageSignatureForAndroid() {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getPackageSignatureForAndroid()
          .then((packageSignature) => {
                setState(() {
                  result = 'getPackageSignatureForAndroid - $packageSignature';
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void getInstalledUpiAppsForiOS() {
    if (Platform.isIOS) {
      PhonePePaymentSdk.getInstalledUpiAppsForiOS()
          .then((apps) => {
                setState(() {
                  result = 'getUPIAppsInstalledForIOS - $apps';

                  // For Usage
                  List<String> stringList = apps
                          ?.whereType<
                              String>() // Filters out null and non-String elements
                          .toList() ??
                      [];

                  // Check if the string value 'Orange' exists in the filtered list
                  String searchString = 'PHONEPE';
                  bool isStringExist = stringList.contains(searchString);

                  if (isStringExist) {
                    print('$searchString app exist in the device.');
                  } else {
                    print('$searchString app does not exist in the list.');
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void getInstalledApps() {
    if (Platform.isAndroid) {
      getInstalledUpiAppsForAndroid();
    } else {
      getInstalledUpiAppsForiOS();
    }
  }

  void getInstalledUpiAppsForAndroid() {
    PhonePePaymentSdk.getInstalledUpiAppsForAndroid()
        .then((apps) => {
              setState(() {
                if (apps != null) {
                  Iterable l = json.decode(apps);
                  List<UPIApp> upiApps = List<UPIApp>.from(
                      l.map((model) => UPIApp.fromJson(model)));
                  String appString = '';
                  for (var element in upiApps) {
                    appString +=
                        "${element.applicationName} ${element.version} ${element.packageName}";
                  }
                  result = 'Installed Upi Apps - $appString';
                } else {
                  result = 'Installed Upi Apps - 0';
                }
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }*/

  Future<void> startTransaction() async {
    print("object");
    try {
      print("body;- $body");
      print("Call back:- $callback");
      print("merchantId:- $merchantId");
      print("Check Sum :- $checksum");
      print("Packeage Name:- $packageName");
      PhonePePaymentSdk.startTransaction(body, callback, checksum, packageName)
          .then((response) => {
                if (response != null)
                  {
                    // String statusy = response['status'].toString()
                    // String error = response['error'].toString()
                    if (response['status'].toString() == 'SUCCESS')
                      {
                        result = "Flow Completed - Status: Success!",
                        checkStatus()
                      }
                    else
                      {
                        result =
                            "Flow Completed - Status: ${response['status'].toString()} and Error: ${response['error'].toString()}"
                      }
                  }
                else
                  {result = "Flow Incomplete"}
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      print("Error :- ${error.toString()}");
      handleError(error);
    }
  }

  void handleError(error) {
    if (error is Exception) {
      result = error.toString();
    } else {
      result = {"error": error};
    }
  }

  //New

  String environment = "UAT_SIM";

  String transactionId = DateTime.now().millisecondsSinceEpoch.toString();

  bool enableLogging = true;

  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";

  String saltIndex = "1";
  String callbackUrl =
      "https://webhook.site/f63d1195-f001-474d-acaa-f7bc4f3b20b1";
  String apiEndPoint = "/pg/v1/pay";

  getChecksum() {
    var finalAmount = subscription.price! * 100;
    print("scription Amount $finalAmount");

    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": transactionId,
      "merchantUserId": "90223250",
      // "amount": subscription.price!,
      "amount": finalAmount,
      "mobileNumber": "9999999999",
      "callbackUrl": callbackUrl,
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));

    checksum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64Body;
  }

  void phonepeInit() {
    print(phonepeInit);
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {result = 'PhonePe SDK Initialized - $val'})
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  checkStatus() async {
    try {
      String url =
          "https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/$merchantId/$transactionId"; //Test
      String concatenatedString =
          "/pg/v1/status/$merchantId/$transactionId$saltKey";
      var bytes = utf8.encode(concatenatedString);
      var digest = sha256.convert(bytes);
      String hashedString = digest.toString();
      //  combine with salt key
      String xVerify = "$hashedString###$saltIndex";
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-MERCHANT-ID": merchantId,
        "X-VERIFY": xVerify,
      };
      await http.get(Uri.parse(url), headers: headers).then((value) {
        Map<String, dynamic> res = jsonDecode(value.body);

        try {
          if (res["code"] == "PAYMENT_SUCCESS" &&
              res['data']['responseCode'] == "SUCCESS") {
            print(res);
            Fluttertoast.showToast(msg: res["message"]);
          } else {
            Fluttertoast.showToast(msg: " Something went wrong");
          }
        } catch (e) {
          Fluttertoast.showToast(msg: " Something went wrong");
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: " Error");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    subscriptionCardState = ref.watch(subscriptionCardProvider);
    List<String> featuresList = [
      '3 books in a 10 days',
      'Request your choice of book',
      'Only for RSS members offer',
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 16.w,
      ),
      margin: EdgeInsets.all(Get.width * 0.02),
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(
            "POPULAR",
            style: FPfonts.dmSans14Medium,
          ),
          SizedBox(height: 16.h),
          Text(
            "₹${subscription.price}/",
            style: FPfonts.dmSans20Bold.copyWith(fontSize: 48),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Html(data: subscription.content ?? ''),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: featuresList.length,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Icon(
          //             Icons.star,
          //             color: themeColor,
          //             size: 20.h,
          //           ),
          //           SizedBox(width: 12.w),
          //           Flexible(
          //             child: Text(
          //               featuresList[index],
          //               style: FPfonts.body16hintText,
          //             ),
          //           )
          //         ],
          //       ).paddingOnly(bottom: 12.h);
          //     },
          //   ).paddingSymmetric(horizontal: 16.w),
          // ),
          SizedBox(
            width: Get.width * .8,
            child: FpElevatedButtonSmall(
                onPressed: () {
                  initPhonePeSdk();
                  body = getChecksum().toString();
                  startTransaction();
                  /*   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewApp(
                              url: subscription.paymentUrl!,
                              amount: subscription.price!,
                              fromcart: fromcart,
                            )),
                  );*/
                },
                buttonTitle: "Subscribe"),
          ).marginSymmetric(vertical: 32.h),
          Text(
            subscription.details ?? '',
            style: FPfonts.dmSans14Medium,
          ),
        ],
      ),
    );
  }

  //Phone pay intigration

  //End

  showWebPayment(String subid) async {
    try {
      var body = dio.FormData.fromMap({
        'subscription_id': subid,
      });

      //Make post request to Stripe
      var headers = {
        'Authorization': "Bearer ${dotenv.env['STRIPE_SECRET']}",
      };
      dio.Dio dioInstance = Dio();
      var response = await dioInstance.post(
        'usersubscription/user/create-subscription-checkout-session',
        data: body,
        options: dio.Options(
          headers: headers,
          contentType: dio.Headers.formUrlEncodedContentType,
        ),
      );
      return response.data;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //var body =
      dio.FormData.fromMap({
        'amount': amount,
        'currency': currency,
      });

      //Make post request to Stripe
      var headers = {
        'Authorization': "Bearer ${dotenv.env['STRIPE_SECRET']}",
      };
      dio.Dio dioInstance = Dio();
      var response = await dioInstance.post(
        'https://api.stripe.com/v1/payment_intents',
        data: {
          'amount': amount,
          'currency': currency,
        },
        options: dio.Options(
          headers: headers,
          contentType: dio.Headers.formUrlEncodedContentType,
        ),
      );
      return response.data;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet().then((value) async {
//       var payId = paymentIntent["id"];
//       if (subscriptionCardState != null) {
//         try {
//           await subscriptionCardState!
//               .sendTokenToServer(subscription.id, payId);
//           //Clear paymentIntent variable after successful payment
//           paymentIntent = null;
//           onSuccess();
//         } on DioException catch (e) {
//           SnackbarHelper.error(e.response?.data['message']);
//         }
//       }
//     }).onError((error, stackTrace) {
//       throw Exception(error);
//     });
//   } on StripeException catch (e) {
//     debugPrint('Error is:---> $e');
//   } catch (e) {
//     debugPrint('$e');
//   }
// }

// Future<void> makePayment(int amount) async {
//   try {
//     //STEP 1: Create Payment Intent
//     paymentIntent =
//         await createPaymentIntent((amount * 100).toString(), 'INR');
//
//     //STEP 2: Initialize Payment Sheet
//     await Stripe.instance
//         .initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//                 paymentIntentClientSecret: paymentIntent!['client_secret'],
//                 //Gotten from payment intent
//                 style: ThemeMode.light,
//                 merchantDisplayName: 'Ikay'))
//         .then((value) async {});
//
//     //STEP 3: Display Payment sheet
//     displayPaymentSheet();
//   } catch (err) {
//     throw Exception(err);
//   }
// }
}
