import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:flutter_ebook_app_clone_riverpod/dialogs/confirmation_dialog.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool checkValue = false;

  List<String> terms = [
    "To be eligible for the free T-shirt rewards, you must comply with the following terms and conditions:",
    "You must invite a minimum of 10 people to download and install the application.",
    "You must open the application at least once every day for a period of at least 20 days within a 45-day timeframe. The 45-day period begins from the day you initially download and install the application.",
    "You are required to keep the application downloaded and installed on your device for a minimum of 45 days from the day of installation.",
    "The free T-shirt rewards are subject to availability, and sizes may be limited.",
    "The free T-shirt rewards are non-transferable and cannot be exchanged for cash or any other items.",
    "The free T-shirt rewards will be shipped to the address provided during the registration process. It is your responsibility to ensure the accuracy of the shipping information. Any additional costs associated with incorrect or incomplete shipping information will be your responsibility.",
    "The company reserves the right to verify the fulfillment of all terms and conditions before awarding the free T-shirt rewards. Any violation or attempted manipulation of the terms and conditions may result in disqualification from the offer.",
    "The company reserves the right to modify, suspend, or terminate the offer at any time without prior notice.",
    "By participating in this offer, you grant the company the right to use your name, likeness, and any provided testimonials for promotional purposes.",
    "The company shall not be held responsible for any technical issues, including but not limited to network connectivity, device compatibility, or application errors, that may affect your eligibility for the free T-shirt rewards.",
    "These terms and conditions are subject to the laws and regulations of the jurisdiction in which the company operates.",
    "Please read these terms and conditions carefully before participating in the offer. By participating, you acknowledge that you have read, understood, and agreed to abide by these terms and conditions.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paleBg,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        actions: [
          TextButton(
              child: const Text(
                'Skip',
                style: AppStyles.skipBtnStyle,
              ),
              onPressed: () => onSkip()),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.08,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.auth.images.welcomeTick.image(),
              const Text('All Set!'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Accept Below Terms & Conditions to get Free Polo T-shirt only for first 250 subscriber',
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: themeColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.08, vertical: Get.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                          width: 1.7, color: Color(0xFFC74225)),
                    ),
                    checkColor: const Color(0xFFC74225),
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return paleBg;
                      }
                      return paleBg;
                    }),
                    value: checkValue,
                    onChanged: (val) {
                      setState(() {
                        checkValue = val!;
                      });
                    }),
                InkWell(
                  onTap: () => termsSheet(),
                  child: const Text(
                    'Accept Terms & Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  checkValue ? Get.offAllNamed(dashboard) : termsSheet();
                },
                child: checkValue
                    ? const Text('Get Started')
                    : const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 19,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSkip() async {
    if (checkValue) {
      Get.offAllNamed(dashboard);
    } else {
      var confirm = await confirmationDialog(
          'Alert', 'If you Skip this your account will be deleted.');
      if (confirm != true) return;

      Response<dynamic> response = await dioService.delete('/user/delete',
          options: Options(headers: {
            "Authorization": globals.token,
          }));
      Map<String, dynamic> res = response.data;
      debugPrint(response.data);
      if (res["success"]) {
        SnackbarHelper.success("Account Deleted");
        Get.offAndToNamed(login);
      } else {
        SnackbarHelper.error("Try Again");
      }
    }
  }

  termsSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Terms and Conditions for Free T-Shirt Rewards:",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: const Color(0xFFC74225)),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: terms.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${index + 1}. ${terms[index]}",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: const Color(0xFF626262),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          checkValue = true;
                          Get.offAllNamed(dashboard);
                        });
                      },
                      child: const Text('Accept'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
