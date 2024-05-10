import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/providers/subscription_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/widgets/subscription_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/widgets/subscription_card_new.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/helpers/snakbar_helper.dart';
import '../../../common/widgets/components.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/size/size.dart';

class SubProv extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  var order;

  cancelSub() async {
    loading = true;

    //dio.Response<dynamic> response =
    await dioService.post('/usersubscription/user/cancle').whenComplete(() {
      loading = false;
      SnackbarHelper.success("Subscription Canceled Success");
    });
    //Map<String, dynamic> res = response.data;
  }
}

final subprov = ChangeNotifierProvider.autoDispose((r) {
  return SubProv();
});

class SubscribePageNew extends ConsumerWidget {
  final bool showSuccess;
  final bool fromCart;

  const SubscribePageNew({
    super.key,
    this.showSuccess = true,
    required this.fromCart,
  });

  final int index = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var substate = ref.watch(subprov);
    var state = ref.watch(subscriptionPageProvider);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: FPcolors.fpWhitegry,
      appBar: AppBar(
        backgroundColor: FPcolors.fpWhitegry,
        title: Text(
          state.items.isNotEmpty
              ? state.items[state.index].name != ''
                  ? '${state.items[state.index].name ?? ""} :'
                  : ''
              : '',
          style: FPfonts.dmSans24boldblack,
        ),
        centerTitle: true,
      ),
      body: state.loading
          ? loadingCenter()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 510.h,
                    child: CarouselSlider(
                      disableGesture: true,
                      items: state.items
                          .map((item) => SubscriptionCardNew(
                                subscription: item,
                                fromcart: fromCart,
                                onSuccess: () {
                                  if (showSuccess) {
                                    Get.close(1);
                                    // Get.to(
                                    //     () => SubscriptionSuccess(e.price.toString()));
                                  } else {
                                    Get.back(result: true);
                                  }
                                },
                              ))
                          .toList(),
                      options: CarouselOptions(
                        onPageChanged: (i, e) {
                          state.update(i);
                          // state.heading_one = state.items[i].headingone ?? "rakshit+${i}";
                        },
                        height: height * 0.72,
                        autoPlay: false,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      )
                      /*  options: CarouselOptions(
                      onPageChanged: (i, e) {
                        state.update(i);
                        // state.heading_one = state.items[i].headingone ?? "rakshit+${i}";
                      },
                      height:height * 0.72, //MediaQuery.sizeOf(context).height / 1.6,
                      autoPlay: false,
                      viewportFraction: 2.0,
                      enlargeCenterPage: true,
                    )*/
                      ,
                    ),
                  ),
                  // defaultSpacer,

                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.items.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            state.carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 16.w,
                          height: 16.h,
                          margin: EdgeInsets.only(right: 15.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.index == entry.key
                                ? FPcolors.colorC74225
                                : FPcolors.colorD9D9D9,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10.h),
                  state.subscribed == true
                      ? SizedBox(height: 10.h)
                      : Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                            horizontal: 10.w,
                          ),
                          margin:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                          width: double.infinity,
                          // height: 500,
                          // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.04),
                            border: Border.all(color: FPcolors.colorD8D5D5),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Onetime Security Deposit",
                                style: FPfonts.dmSans14Medium,
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "₹500/-",
                                    style: FPfonts.dmSans20Bold
                                        .copyWith(fontSize: 40),
                                  ),
                                ],
                              ),
                              Text(
                                "Note: Your subscription deposit is fully refundable.",
                                style: FPfonts.dmSans12fpPrimary,
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subscription deposit",
                                    style: FPfonts.dmSans20Bold
                                        .copyWith(fontSize: 10),
                                  ),
                                  Text("₹500",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: FPcolors.color6C7072)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Membership fees",
                                    style: FPfonts.dmSans20Bold
                                        .copyWith(fontSize: 10),
                                  ),
                                  Text("+  ₹199",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: FPcolors.color6C7072)),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: FPcolors.fpPrimary),
                                  ),
                                  Text("₹699",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: FPcolors.color6C7072)),
                                ],
                              )
                            ],
                          ),
                        ),

                  state.subscribed == false
                      ? SizedBox(
                          width: Get.width * .8,
                          child: FpElevatedButtonSmall(
                              onPressed: () {
                                /* initPhonePeSdk();
                          body = getChecksum().toString();
                          startTransaction();*/

                                state.razorpayOrderCreate(
                                    state.items[state.index].id.toString());

                                debugPrint(
                                    "payment status check ${state.paymentDoneSuccessfully}");
                                if (state.paymentDoneSuccessfully == true) {
                                  Get.close(1);
                                } else {
                                  Get.back(result: false);
                                }
                              },
                              buttonTitle: "Subscribe"),
                        ).marginSymmetric(vertical: 32.h)
                      : SizedBox(
                          width: Get.width * .8,
                          child: FpElevatedButtonSmall(
                              onPressed: () {
                                /* initPhonePeSdk();
                          body = getChecksum().toString();
                          startTransaction();*/

                                state.razorpayOrderCreate(
                                    state.items[state.index].id.toString());

                                debugPrint(
                                    "Message give success ${state.paymentDoneSuccessfully}");

                                if (state.paymentDoneSuccessfully == true) {
                                  Get.close(1);
                                } else {
                                  Get.back(result: true);
                                }
                              },
                              buttonTitle: "Upgrade"),
                        ).marginSymmetric(vertical: 32.h)
                  /* SizedBox(
                    width: Get.width * .8,
                    child: FpElevatedButtonSmall(
                        onPressed: () {


                        },
                        buttonTitle: "Subscribe"),
                  ).marginSymmetric(vertical: 32.h)*/
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              side: MaterialStateBorderSide.resolveWith(
                (states) =>
                    const BorderSide(width: 1.7, color: Color(0xFFC74225)),
              ),
              checkColor: const Color(0xFFC74225),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return paleBg;
                }
                return paleBg;
              }),
              value: state.checkTerm,
              onChanged: state.onCheckChanged,
            ),
            Flexible(
              child: Wrap(
                children: [
                  Text(
                    'By continuing, you agree to our ',
                    style: AppStyles.f13.copyWith(color: black),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      'Terms of Service',
                      style: AppStyles.f13.copyWith(color: themeColor),
                    ),
                  ),
                  const Text(
                    ' and ',
                    style: AppStyles.f13,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      'Privacy Policy.',
                      style: AppStyles.f13.copyWith(color: themeColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    SnackbarHelper.error(
        "Payment Failed : Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    //  showAlertDialog(BuildContext as BuildContext, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    print(response.data.toString());
    SnackbarHelper.error(
        "Payment Successful Payment ID: ${response.paymentId}");

    /*  showAlertDialog(
        BuildContext as BuildContext, "Payment Successful", "Payment ID: ${response.paymentId}");*/
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    SnackbarHelper.error("External Wallet Selected : ${response.walletName}");
/*
    showAlertDialog(
        BuildContext as BuildContext, "External Wallet Selected", "${response.walletName}");*/
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

  _launchURL() async {
    final Uri url = Uri.parse('https://www.google.co.in/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
