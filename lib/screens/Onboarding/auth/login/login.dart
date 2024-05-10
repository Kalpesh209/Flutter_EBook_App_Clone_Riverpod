import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/country_dial_picker.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/form_spacer_vertical.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/login/providers/login_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../common/widgets/page_title.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(loginScreenProvider);
    return Scaffold(
      /* appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),*/
      body: SafeArea(
        child: Stack(
          children: [
            state.loading ? loadingCenter() : Container(),
            ContainerWithBg(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.1,
                            ),
                            const PageTitle(title: 'Welcome Back'),
                            SizedBox(height: Get.height * 0.01),
                            const Text(
                              'Log in to your account',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            ReactiveForm(
                              formGroup: state.loginForm,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 16,
                                                left: 120,
                                                right: 16,
                                                bottom: 14,
                                              ),
                                            ),
                                      ),
                                      CountryDial(onChanged: () {}),
                                    ],
                                  ),
                                  const FormSpacerVertical(),
                                  /* Row(
                                    children: [
                                      ReactiveTextField(
                                        formControlName: 'password',
                                        obscureText: state.obscureText,
                                        decoration: AppStyles.inputDecoration
                                            .copyWith(hintText: 'Password'),
                                      ),
                                      IconButton(
                                          onPressed: onPressed,
                                          icon: SvgPicture.asset(
                                            Assets.icons.icon_show_password,
                                            height: 14.w,
                                            width: 16.w,
                                          )),
                                    ],
                                  ),*/
                                  ReactiveTextField(
                                    formControlName: 'password',
                                    obscureText: state.obscureText,
                                    decoration: AppStyles.inputDecoration
                                        .copyWith(hintText: 'Password'),
                                  ),
                                  const FormSpacerVertical(space: 0.02),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () => Get.toNamed(forgotPassword),
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: textColor,
                                            // fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  /*Text(
                                    '*Minimum 8 characters or more and should consist 1 capital, 1 numerical, 1 special character(e.g.!,*,@,#)',
                                    style: TextStyle(
                                      color: FPcolors.color72777A,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.08,
                        vertical: Get.height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AbsorbPointer(
                          absorbing: state.loading,
                          child: SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                try {
                                  debugPrint("here");
                                  await state.login();

                                  if (state.loginResponse.data?.isVerified ==
                                      false) {
                                    GetStorage().write('mobile_number',
                                        state.loginResponse.data?.mobileNumber);
                                    Get.toNamed(verifyAccount);
                                  } else {
                                    //Get.offAndToNamed(dashboard);
                                    Get.offNamed(dashboard);
                                  }
                                  // SnackbarHelper.success('Logged in and Saved Token');
                                } on InvalidFormException catch (e) {
                                  state.loading = false;
                                  SnackbarHelper.error(e.message);
                                } on DioException catch (e) {
                                  state.loading = false;
                                  SnackbarHelper.error(
                                      e.response?.data['message']);
                                }
                              },
                              child:
                                  Text(state.loading ? 'Please wait' : 'Login'),
                            ),
                          ),
                        ),
                        const FormSpacerVertical(space: 0.02),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: gryLight, // your color here
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            onPressed: () {
                              Get.toNamed(register);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: FPcolors.fpPrimary,
                                fontSize: 16,
                                // fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
