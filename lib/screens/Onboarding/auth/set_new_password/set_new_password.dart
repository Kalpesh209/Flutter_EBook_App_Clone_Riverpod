import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/page_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/set_new_password/providers/set_new_password_provider.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';

class SetNewPassword extends ConsumerWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(setNewPasswordStateProvider);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Form(
        key: state.newPasswordForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: ContainerWithBg(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageTitle(title: 'Create New Password'),
                      SizedBox(height: Get.height * 0.01),
                      Text(
                        'Set a New Password for your account so that you can access all the features. ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: FPcolors.fpHintText,
                            fontFamily: "DM Sans",
                            fontSize: 13.sp),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'New Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: FPcolors.color090A0A,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                              /* SvgPicture.asset(
                                Assets.icons.icon_show_password,
                                height: 14.w,
                                width: 16.w,
                              ),*/
                            ],
                          ),
                          SizedBox(height: 20.h),
                          TextField(
                            obscureText: state.passwordShow,
                            controller: state.tECNewPassword,
                            keyboardType: TextInputType.text,
                            decoration: AppStyles.inputDecoration
                                .copyWith(
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          state.passwordShow
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: FPcolors.colorC4C4C4,
                                        ),
                                        onPressed: () {
                                          if (state.passwordShow == true) {
                                            state.passwordShow = false;
                                          } else {
                                            state.passwordShow = true;
                                          }

                                          // Update the state i.e. toogle the state of passwordVisible variable
                                        }))
                                .copyWith(),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Confirm Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FPcolors.color090A0A,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            obscureText: state.confirmPasswordShow,
                            controller: state.tECConfirmPassword,
                            //     formControlName: 'password',
                            keyboardType: TextInputType.text,
                            decoration: AppStyles.inputDecoration
                                .copyWith(
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          state.confirmPasswordShow
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: FPcolors.colorC4C4C4,
                                        ),
                                        onPressed: () {
                                          if (state.confirmPasswordShow ==
                                              true) {
                                            state.confirmPasswordShow = false;
                                          } else {
                                            state.confirmPasswordShow = true;
                                          }

                                          // Update the state i.e. toogle the state of passwordVisible variable
                                        }))
                                .copyWith(),
                            validator: (value) {
                              if (state.tECNewPassword.text != value) {
                                return 'Confirm password not match with New Password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '*Minimum 8 characters or more and should consist 1 capital, 1 numerical, 1 special character(e.g.!,*,@,#)',
                            style: TextStyle(
                              color: FPcolors.color72777A,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.08, vertical: Get.height * 0.03),
        child: FilledButton(
          onPressed: () async {
            try {
              if (state.newPasswordForm.currentState!.validate()) {
                await state.setNewPassword();
              }
            } on InvalidFormException catch (e) {
              SnackbarHelper.error(e.message);
            } on DioException catch (e) {
              SnackbarHelper.error(e.response?.data['message']);
            }
          },
          child: Text(state.loading ? 'Please Wait...' : 'Reset Password'),
        ),
      ),
    );
  }
}
