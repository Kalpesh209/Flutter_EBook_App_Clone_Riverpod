import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/country_dial_picker.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/form_spacer_vertical.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/models/signup_response/signup_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/providers/register_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../../../../common/widgets/page_title.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(registerScreenProvider);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              state.loading ? loadingCenter() : Container(),
              ContainerWithBg(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // for left side
                    children: [
                      const PageTitle(title: 'Hello!'),
                      SizedBox(height: Get.height * 0.01),
                      const Text('Let us get to know you better!'),
                      const FormSpacerVertical(),
                      ReactiveForm(
                        formGroup: state.registerForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'first_name',
                                    decoration: AppStyles.inputDecoration
                                        .copyWith(hintText: 'First Name'),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.04),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'last_name',
                                    decoration: AppStyles.inputDecoration
                                        .copyWith(hintText: 'Last Name'),
                                  ),
                                ),
                              ],
                            ),
                            const FormSpacerVertical(),
                            ReactiveTextField(
                              decoration: AppStyles.inputDecoration
                                  .copyWith(hintText: 'Email'),
                              formControlName: 'email',
                            ),
                            const FormSpacerVertical(),
                            Stack(
                              children: [
                                ReactiveTextField(
                                  keyboardType: TextInputType.phone,
                                  validationMessages: {
                                    ValidationMessage.minLength: (c) =>
                                        'Invalid Mobile Number',
                                    ValidationMessage.maxLength: (c) =>
                                        'Invalid Mobile Number',
                                  },
                                  decoration:
                                      AppStyles.inputDecoration.copyWith(
                                    hintText: 'Mobile Number',
                                    contentPadding: const EdgeInsets.only(
                                      left: 120,
                                      top: 16,
                                      bottom: 16,
                                      right: 16,
                                    ),
                                  ),
                                  formControlName: 'mobile_number',
                                ),
                                /*  CountryDial(onChanged: () {
                                  debugPrint("get number ${}")
                                })*/

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
                                ),
                              ],
                            ),
                            const FormSpacerVertical(),
                            ReactiveTextField(
                              decoration: AppStyles.inputDecoration
                                  .copyWith(hintText: 'Password'),
                              obscureText: true,
                              formControlName: 'password',
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "*Minimum 8 characters or more and should consist 1 capital, 1 numerical, 1 special character(e.g.!,*,@,#)",
                              style: TextStyle(
                                height: 2,
                                fontFamily: 'DM Sans',
                                color: FPcolors.fpHintText,
                                fontSize: 12,
                              ),
                            ),
                            const FormSpacerVertical(),
                            const FormSpacerVertical(),
                            const FormSpacerVertical(),
                            const FormSpacerVertical(),
                          ],
                        ),
                      )
                    ],
                  ),
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
            /* Wrap(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: false,
                  onChanged: (bool? value) {

                  },
                ),
                const Text(
                  'By continuing, you agree to our ',
                  style: AppStyles.f13,
                ),
                InkWell(
                  onTap: () {},
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
                  onTap: () {},
                  child: Text(
                    'Privacy Policy.',
                    style: AppStyles.f13.copyWith(color: themeColor),
                  ),
                ),
              ],
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  value: state.agree,
                  onChanged: (bool? value) {
                    state.checkBox = value!;
                  },
                ),
                /* Checkbox(
                  side: const BorderSide(
                    // set border color here
                    color: textColor,
                  ),
                  checkColor: Colors.white,
                  value: state.agree,
                  onChanged: (bool? value) {
                    state.checkBox = value!;
                  },
                ),*/
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Center(
                          child: Text.rich(TextSpan(
                              text: 'By continuing, you agree to our ',
                              style: AppStyles.f13.copyWith(color: black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\nTerms of Service',
                                    style: AppStyles.f13
                                        .copyWith(color: textColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL();
                                        // code to open / launch terms of service link here
                                      }),
                                TextSpan(text: ' and ', children: <TextSpan>[
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: AppStyles.f13
                                          .copyWith(color: textColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _launchURL();
                                          // code to open / launch privacy policy link here
                                        })
                                ])
                              ])),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            AbsorbPointer(
              absorbing: state.loading,
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    try {
                      // if (state.agree == true) {
                      SignupResponse res = await state.register();
                      if (res.success == false) {
                        SnackbarHelper.error(res.message);
                        return;
                      } else {
                        GetStorage().write('mobile_number',
                            state.registerForm.control('mobile_number').value);
                        Get.toNamed(verifyAccount);
                      }
                      /* } else {
                        SnackbarHelper.error("Accept Teams of Service and Privacy Policy");
                      }*/
                    } on InvalidFormException catch (e) {
                      SnackbarHelper.error(e.message);
                    } on DioException catch (e) {
                      SnackbarHelper.error(e.response?.data['message']);
                    }
                  },
                  child: Text(state.loading ? 'Please wait...' : 'Continue'),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            /* SizedBox(
              width: Get.width,
              child: FilledButton(
                onPressed: () async {
                  Get.toNamed(login);
                },
                child: const Text('Login'),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://www.google.co.in/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
