import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config/constants.dart';
import 'config/route/route_names.dart';
import 'config/services/setup_singleton_services.dart';
import 'gen/assets.gen.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog(
      {Key? key,
      required this.applink,
      required this.originalStoreVersion,
      required this.nothanks})
      : super(key: key);
  final String applink;
  final String originalStoreVersion;
  final Function? nothanks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3.5,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // backgroundColor: Colors.transparent,
        elevation: 2.0,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update FreshPage",
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 17),
            ),
            Text(
              "FreshPage recommends that you update to the latest version :$originalStoreVersion. Click on Update button",
              style: Theme.of(context)
                  .primaryTextTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //const CancelButton(),
                TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                    nothanks!();
                  },
                  child: Center(
                    child: Text(
                      'No Thanks',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium
                          ?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Updatebutton(
                  applink: applink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3.5,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // backgroundColor: Colors.transparent,
        elevation: 2.0,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Logout?",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: FPcolors.color090A0A,
              ),
            ),
            Divider(
              color: FPcolors.colorC4C4C4,
            ),
            Text(
                textAlign: TextAlign.center,
                "Are you sure you want to logout?",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: FPcolors.colorC74225,
                )),
            const SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: gryLight, // your color here
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () async {
                        await authService.logout();
                        FirebaseAnalytics.instance
                            .logEvent(name: 'logout')
                            .then((value) => null);
                        Get.offAllNamed(login);
                      },
                      child: Text('  Yes  ',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            color: FPcolors.colorWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: gryLight, // your color here
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('  No  ',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            color: FPcolors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeletDialog extends StatelessWidget {
  final Function? addressChanged;
  final Function? deactiviteUser;

  const DeletDialog({
    Key? key,
    required this.applink,
    required this.originalStoreVersion,
    this.deactiviteUser,
    this.addressChanged,
  }) : super(key: key);
  final String applink;
  final String originalStoreVersion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3.5,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // backgroundColor: Colors.transparent,
        elevation: 2.0,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Delete Account?",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: FPcolors.color090A0A,
              ),
            ),
            Divider(
              color: FPcolors.colorC4C4C4,
            ),
            Text(
                textAlign: TextAlign.center,
                "Are you sure you want to delete your account?",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: FPcolors.colorC74225,
                )),
            const SizedBox(
              height: 2.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.08,
                      vertical: Get.height * 0.01),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: gryLight, // your color here
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        // showSheet(context: context, deactiviteUser:()=>deactiviteUser!());
                        showSheetDelete(
                            context: context,
                            addressChanged: () => addressChanged!());
                      },
                      child: Text('  Delete Account  ',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            color: FPcolors.colorWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Delete Account',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: FPcolors.color6C7072,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                 */ /* showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const BottomSheetDelete();
                                    },
                                  );*/ /*
                                  showSheetDelete(context: context,addressChanged: ()=> addressChanged!() );
                                 // Get.toNamed(login);
                                }
                            // ..onTap = () => state.onLogIn(),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {Key? key, required this.applink, required this.originalStoreVersion})
      : super(key: key);
  final String applink;
  final String originalStoreVersion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3.5,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // backgroundColor: Colors.transparent,
        elevation: 2.0,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Apologies!!",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: FPcolors.color090A0A,
              ),
            ),
            Divider(
              color: FPcolors.colorC4C4C4,
            ),
            Text(
                textAlign: TextAlign.center,
                "Maximum Book Limit Exceeded. \nYou can only rent up to 3 books at a time. ",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: FPcolors.colorC74225,
                )),
            Text(
                textAlign: TextAlign.center,
                "Please return any current rentals before proceeding.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: FPcolors.color6C7072,
                )),
            const SizedBox(
              height: 5.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.08,
                      vertical: Get.height * 0.01),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: gryLight, // your color here
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        // showSheet(context: context);
                        Navigator.pop(context);
                        // Get.toNamed(register);
                      },
                      child: Text('Continue Browsing',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            color: FPcolors.colorWhite,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showSheet({required BuildContext context, required deactiviteUser}) {
  const defaultPaddingSmall = 8.0;
  const defaultSpacerSmall = SizedBox(height: defaultPaddingSmall);

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        // height: 200,
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    defaultSpacerSmall,
                    SvgPicture.asset(Assets.settings.svg.bottomsheeticon),
                  ],
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                "Deactivate Account",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: FPcolors.color090A0A,
                ),
              ),
              Divider(
                color: FPcolors.colorC4C4C4,
              ),
              Text(
                  textAlign: TextAlign.center,
                  " Your data will be retained, and you can reactivate it at any time.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: FPcolors.colorC74225,
                  )),
              Assets.auth.images.deactivate.image(width: 200, height: 150),
              Text(
                  textAlign: TextAlign.center,
                  "*Deactivating your account will result in the permanent deletion of all associated points.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: FPcolors.colorA1A1AA,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.12, vertical: Get.height * 0.01),
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
                      Navigator.pop(context);
                      deactiviteUser();
                      // Get.toNamed(register);
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ),
              Text(
                  textAlign: TextAlign.center,
                  "*You will receive the membership fees in 5-7 working days. Thank you for your patience.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: FPcolors.fpPrimary,
                  )),
            ],
          ),
        )),
      );
    },
  );
}

void showSheetDelete({required BuildContext context, required addressChanged}) {
  const defaultPaddingSmall = 8.0;
  const defaultSpacerSmall = SizedBox(height: defaultPaddingSmall);

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.08, vertical: Get.height * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    defaultSpacerSmall,
                    SvgPicture.asset(Assets.settings.svg.bottomsheeticon),
                  ],
                ),
              ),
              Text(
                "Delete Account",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: FPcolors.color090A0A,
                ),
              ),
              Divider(
                color: FPcolors.colorC4C4C4,
              ),
              Text(
                  textAlign: TextAlign.center,
                  " Your data will not be recovered if you choose to delete your account .",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: FPcolors.colorC74225,
                  )),
              Assets.auth.images.delete_image.image(width: 200, height: 150),
              Text(
                  textAlign: TextAlign.center,
                  "*Deleting your account will result in the permanent deletion of all associated points and personal information.",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: FPcolors.colorA1A1AA,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.12, vertical: Get.height * 0.01),
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
                      Navigator.pop(context);
                      // Get.toNamed(register);
                      // addressChanged();

                      showConfirmDelete(
                          context: context,
                          addressChanged: () => addressChanged!());
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ),
              Text(
                  textAlign: TextAlign.center,
                  "*You will receive the membership fees in 5-7 working days. Thank you for your patience.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: FPcolors.fpPrimary,
                  )),
            ],
          ),
        )),
      );
    },
  );
}

void showConfirmDelete(
    {required BuildContext context, required addressChanged}) {
  const defaultPaddingSmall = 8.0;
  const defaultSpacerSmall = SizedBox(height: defaultPaddingSmall);

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.08, vertical: Get.height * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    defaultSpacerSmall,
                    SvgPicture.asset(Assets.settings.svg.bottomsheeticon),
                  ],
                ),
              ),
              Text(
                "We're sad to see you go!",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: FPcolors.color090A0A,
                ),
              ),
              Divider(
                color: FPcolors.colorC4C4C4,
              ),
              Assets.auth.images.icon_delete_final
                  .image(width: 200, height: 200),
              Text(
                  textAlign: TextAlign.center,
                  "Thank you for being part of our Freshpage family.\nWe hope to see you back soon!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    color: FPcolors.color090A0A,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.12, vertical: Get.height * 0.01),
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
                      Navigator.pop(context);
                      // Get.toNamed(register);
                      addressChanged();
                    },
                    child: Text('Delete Account',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          color: FPcolors.colorWhite,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Cancel',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: FPcolors.color6C7072,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              }
                            // ..onTap = () => state.onLogIn(),
                            ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        )),
      );
    },
  );
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Text(
          'No Thanks',
          style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}

class Updatebutton extends StatelessWidget {
  const Updatebutton({
    Key? key,
    required this.applink,
  }) : super(key: key);
  final String applink;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC74225),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () async {
        await launchUrl(Uri.parse(applink),
            mode: LaunchMode.externalApplication);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.24,
        child: Center(
          child: Text(
            'Update',
            style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
    //  InkWell(
    //   onTap:
    //() async {
    //     await launchUrl(Uri.parse(applink),
    //         mode: LaunchMode.externalApplication);
    //   },
    //   child: Text(
    //     'Update',
    //     style: Theme.of(context).primaryTextTheme.headline4?.copyWith(
    //           color: const Color(0xffc74255),
    //           fontSize: 16,
    //         ),
    //   ),
    // );
  }
}

class RewardDialog extends StatelessWidget {
  final int? currentDay;

  const RewardDialog({Key? key, required this.currentDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        elevation: 2.0,
        child: content(context, currentDay),
      ),
    );
  }

  Widget content(BuildContext context, int? currentDay) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: 386.h,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          top: 32.0,
          bottom: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Daily Reward",
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: FPcolors.color090A0A,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
            ),
            const SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayCard('Day 1', '10', currentDay == 1),
                SizedBox(width: 10.w),
                dayCard('Day 2', '20', currentDay == 2),
                SizedBox(width: 10.w),
                dayCard('Day 3', '30', currentDay == 3),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayCard('Day 4', '40', currentDay == 4),
                SizedBox(width: 10.w),
                dayCard('Day 5', '50', currentDay == 5),
                SizedBox(width: 10.w),
                dayCard('Day 6', '60', currentDay == 6),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayCard('Day 7', '100', currentDay == 7),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              "Login daily to keep earning\nfree rewards",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: FPcolors.color090A0A,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Rewards reset every 7 days",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dayCard(
    String day,
    String point,
    bool isSelected,
  ) {
    return Container(
      height: 70.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: isSelected ? FPcolors.lightOrange : FPcolors.colorWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: isSelected
            ? Border.all(color: FPcolors.fpPrimary)
            : Border.all(
                color: FPcolors.colorBDBDBD,
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ).marginOnly(bottom: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.icCoinSmall,
                height: 10,
              ).marginOnly(right: 6),
              Text(
                point,
                style: TextStyle(
                  color: FPcolors.color72777B,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RewardCardDialog extends StatelessWidget {
  final String? syncDay;

  const RewardCardDialog({Key? key, required this.syncDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        elevation: 2.0,
        child: content(context, syncDay),
      ),
    );
  }

  Widget content(BuildContext context, String? syncDay) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: 352.h,
      width: 310.w,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.background.bgRewardCard.keyName)),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 260.h,
            width: 310.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 30.h),
            color: FPcolors.colorWhite80,
            height: 260.h,
            width: 310.w,
          ),
          Positioned.fill(
            top: 0,
            bottom: 25,
            right: 10,
            left: 0,
            child: Center(
              child: Text(
                syncDay ?? '',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      color: FPcolors.color090A0A,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.sp,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 32.0,
              bottom: 12.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(width: double.maxFinite),
                    Text(
                      "Daily Reward",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: FPcolors.color090A0A,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      "You Earned",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: FPcolors.color090A0A,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Points",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: FPcolors.color090A0A,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                    ),
                    const SizedBox(height: 22.0),
                    Text(
                      "Login daily to keep earning\nfree rewards",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: FPcolors.color090A0A,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Rewards reset every 7 days",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
