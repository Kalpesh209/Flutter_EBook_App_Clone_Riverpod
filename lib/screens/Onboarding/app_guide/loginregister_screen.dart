import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';
import '../../../config/colors/colors.dart';
import '../../../config/route/route_names.dart';
import '../../../gen/assets.gen.dart';
import 'LoginRegisterScreenState.dart';

class LoginRegisterScreen extends ConsumerWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(loginRegisterScreenProvider);

    return Scaffold(
      backgroundColor: FPcolors.colorFFECE5,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(Assets.icons.icWhiteSun).marginOnly(left: 85),
          Column(
            children: [
              SizedBox(
                height: 300.h,
                width: 400.w,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(Assets.images.imgGuide5.keyName),
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 350,
                child: Text(
                  'Let’s get Started!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FPcolors.fpPrimary,
                    fontSize: 32,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ).marginSymmetric(horizontal: 12),
              ),
              SizedBox(
                width: 330,
                child: Text(
                  'Embark on a literary journey filled with books, vibrant communities and perks of renting and sharing experiences!”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FPcolors.color934231,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FpElevatedButton(
                    onPressed: () {
                      Get.toNamed(register);
                    },
                    buttonTitle: 'Create account'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(
                        color: FPcolors.color202325,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        color: FPcolors.colorC74225,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(login);
                          //Get.reset();
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 45)
        ],
      ), /* Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(Assets.icons.icWhiteSun).marginOnly(left: 85),
          Column(
            children: [
              SizedBox(
                height: 300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(Assets.images.imgGuide5.keyName),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                "Let’s get Started!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FPcolors.colorC74225,
                  fontSize: 32.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ).marginSymmetric(horizontal: 12),
              Text(
                "Embark on a literary journey filled with books, vibrant communities and perks of renting and sharing experiences!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FPcolors.color924230,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.08, vertical: Get.height * 0.01),
            child: SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                          color: gryLight, // your color here
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: () {
                  Get.toNamed(register);
                },
                child: const Text('Create account'),
              ),
            ),
          ),
          */ /*  Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FpElevatedButton(
                      onPressed: state.onCreateAccount,
                      buttonTitle: 'Create account'),
                ),
              ],
            ),*/ /*
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(
                        color: FPcolors.color202325,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        color: FPcolors.colorC74225,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Get.toNamed(login);
                    }
                        // ..onTap = () => state.onLogIn(),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 40)
        ],
      )*/
    );
  }
}
