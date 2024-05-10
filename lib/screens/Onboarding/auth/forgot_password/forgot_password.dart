import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/country_dial_picker.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/forgot_password/providers/forgot_password_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../common/exceptions/invalid_form.dart';
import '../../../../common/helpers/snakbar_helper.dart';
import '../../../../common/widgets/form_spacer_vertical.dart';
import '../../../../common/widgets/page_title.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/constants.dart';
import 'dart:math' as math;

import '../../../../config/route/route_names.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(forgotPasswordProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ReactiveForm(
        formGroup: state.forgotPasswordForm,
        child: SafeArea(
          child: ContainerWithBg(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                  child: Column(
                    children: [
                      const PageTitle(title: 'Let’s get started'),
                      SizedBox(height: Get.height * 0.01),
                      const Text(
                        'We will send you an otp to your registered mobile number',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      ReactiveForm(
                        formGroup: state.forgotPasswordForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                ReactiveTextField(
                                  formControlName: 'mobile_number',
                                  keyboardType: TextInputType.phone,
                                  decoration: AppStyles.inputDecoration
                                      .copyWith(hintText: 'Mobile Number')
                                      .copyWith(
                                        contentPadding: const EdgeInsets.only(
                                          top: 16,
                                          left: 120,
                                          right: 16,
                                          bottom: 16,
                                        ),
                                      ),
                                ),
                                CountryDial(onChanged: () {}),
                                  ],
                                ),
                              ],
                            )*/
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                ReactiveTextField(
                                  formControlName: 'mobile_number',
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                  decoration: AppStyles.inputDecoration
                                      .copyWith(
                                        hintText: 'Mobile Number',
                                      )
                                      .copyWith(
                                        contentPadding: const EdgeInsets.only(
                                          top: 16,
                                          left: 120,
                                          right: 16,
                                          bottom: 14,
                                        ),
                                      ),
                                ),
                                /* CountryDial(onChanged: () {}),*/
                                SizedBox(
                                  height: 60.h,
                                  child: CountryCodePicker(
                                    initialSelection: "in",
                                    favorite: ['+44', 'uk', "+91", "in"],
                                    onChanged: (d) => {
                                      debugPrint("get number ${d.dialCode}"),
                                      state.countyCode = d.dialCode
                                    },
                                    builder: (p0) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 16),
                                        Image.asset(
                                          p0?.flagUri?.toString() ?? '',
                                          package: 'country_code_picker',
                                          width: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(p0?.dialCode?.toString() ?? ''),
                                        const SizedBox(width: 2),
                                        // Text(
                                        //   p0?.dialCode?.toString() ?? '',
                                        //   style:
                                        //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        // ),
                                        Transform.rotate(
                                            angle: 90 * math.pi / 180,
                                            child: const Icon(
                                                Icons.chevron_right)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const FormSpacerVertical(),
                            const Text(
                              "You will receive an SMS verification that may apply message and data rates.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: slateGrey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.08,
                      vertical: Get.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () async {
                            debugPrint(
                                'Form not valid ${ReactiveForm.of(context)?.valid ?? false}');
                            if (state.forgotPasswordForm.valid) {
                              // state.startPasswordRecovery();

                              try {
                                debugPrint("here");
                                await state.sendOtp();

                                if (state.loginResponse.success == true) {
                                  Get.toNamed(resetVerify);
                                } else {
                                  SnackbarHelper.success(
                                      state.loginResponse.message);
                                }
                                // SnackbarHelper.success('Logged in and Saved Token');
                              } on InvalidFormException catch (e) {
                                SnackbarHelper.error(e.message);
                              } on DioException catch (e) {
                                SnackbarHelper.error(
                                    e.response?.data['message']);
                              }
                            } else {
                              debugPrint('Form not valid');
                            }
                          },
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
