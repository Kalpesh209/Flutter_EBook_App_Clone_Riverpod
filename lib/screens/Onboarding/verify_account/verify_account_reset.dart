import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/page_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/verify_account/providers/verify_account_provider.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../config/constants.dart';

class VerifyAccountReset extends ConsumerWidget {
  const VerifyAccountReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(verifyAccountProvider);
    var mobileNumber = state.verifyAccounForm.control('mobile_number').value;

    var pinTheme = PinTheme(
      width: Get.width * 0.15,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: ContainerWithBg(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: Column(
                  children: [
                    const PageTitle(title: 'Verify Account'),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      'Six digits code are sent to (**)*** - ${mobileNumber.substring(mobileNumber.length - 3)} .\nEnter the codes to verify your account.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Pinput(
                      focusedPinTheme: pinTheme.copyWith(
                        decoration: BoxDecoration(
                            border: Border.all(color: themeColor),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      defaultPinTheme: pinTheme,
                      length: 6,
                      onChanged: (code) => {
                        state.verifyAccounForm.patchValue({'code': code})
                      },
                    ),
                    SizedBox(height: Get.height * 0.04),
                    TextButton(
                      onPressed: () async {
                        try {
                          await state.sendOtp();
                        } on DioException catch (e) {
                          SnackbarHelper.error(e.response?.data['message']);
                        }
                      },
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                            fontSize: 16,
                            color: themeColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.08, vertical: Get.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          try {
                            await state.verifyOtp();

                            Get.offNamed(setNewPassword);
                          } on DioException catch (e) {
                            SnackbarHelper.error(e.response?.data['message']);
                          }
                        },
                        child:
                            Text(state.loading ? 'Please wait...' : 'Continue'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
