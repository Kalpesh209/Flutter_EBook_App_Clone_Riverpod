import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/invitation_screen/providers/invitation_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/invitation_screen/widgets/invali_code_popup.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/widgets/page_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/models/signup_response/data.dart';

class InvitationScreen extends ConsumerWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(invitationScreenProvider);
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Column(
            children: [
              const PageTitle(title: 'Enter Invitation code'),
              SizedBox(height: Get.height * 0.01),
              const Text(
                'You should have recieved invitation',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              ReactiveForm(
                formGroup: state.invitationForm,
                child: Column(
                  children: [
                    ReactiveTextField(
                      formControlName: 'verification_code',
                      decoration: AppStyles.inputDecoration
                          .copyWith(hintText: 'Enter invitation code'),
                    ),
                  ],
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
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  try {
                    var res = await state.checkCode();
                    if (res['success'] == false) {
                      Get.dialog(
                        const Dialog(
                          backgroundColor: Colors.transparent,
                          child: InvalidCodePopup(),
                        ),
                      );
                      return;
                    }
                    var userString = await storageService.read(key: 'user');
                    if (userString == null) return;
                    try {
                      Data user = Data.fromJson(jsonDecode(userString));
                      Data updatedUser = Data(
                        id: user.id,
                        firstName: user.firstName,
                        lastName: user.lastName,
                        email: user.email,
                        mobileNumber: user.mobileNumber,
                        verificationCode: user.verificationCode,
                        profileImage: user.profileImage,
                        token: user.token,
                        isVerified: true,
                      );

                      await storageService.write(
                          key: 'user', value: jsonEncode(updatedUser));
                    } catch (e) {
                      debugPrint('e $e');
                    }

                    Get.toNamed(userStep);
                  } catch (e) {
                    debugPrint('e $e');
                  }
                },
                child: Text(state.loading ? 'Please wait...' : 'Continue'),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  try {
                    var res = await state.checkCode();
                    if (res['success'] == false) {
                      Get.dialog(
                        const Dialog(
                          backgroundColor: Colors.transparent,
                          child: InvalidCodePopup(),
                        ),
                      );
                      return;
                    }
                    var userString = await storageService.read(key: 'user');
                    if (userString == null) return;
                    try {
                      Data user = Data.fromJson(jsonDecode(userString));
                      Data updatedUser = Data(
                        id: user.id,
                        firstName: user.firstName,
                        lastName: user.lastName,
                        email: user.email,
                        mobileNumber: user.mobileNumber,
                        verificationCode: user.verificationCode,
                        profileImage: user.profileImage,
                        token: user.token,
                        isVerified: true,
                      );

                      await storageService.write(
                          key: 'user', value: jsonEncode(updatedUser));
                    } catch (e) {
                      debugPrint('e $e');
                    }

                    Get.toNamed(userStep);
                  } catch (e) {
                    debugPrint('e $e');
                  }
                },
                child: Text(state.loading ? 'Please wait...' : 'Continue'),
              ),
            ),
            // Center(
            //   child: TextButton(
            //     onPressed: () {
            //       Get.offAllNamed(STEP1);
            //     },
            //     child: const Text('Skip'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
