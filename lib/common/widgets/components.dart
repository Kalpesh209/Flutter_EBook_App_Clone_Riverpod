// ignore_for_file: must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/fonts/fonts.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import '../../screens/settings/user/profile_edit_screen.dart';
import '../../update_dialog.dart';

class FpElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final color;
  String buttonTitle;

  FpElevatedButton(
      {super.key,
      required this.onPressed,
      required this.buttonTitle,
      this.color = themeColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 72,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: FPcolors.colorWhite,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FpElevatedButtonResizable extends StatelessWidget {
  final VoidCallback onPressed;

  String buttonTitle;

  FpElevatedButtonResizable(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: SizedBox(
            height: 48,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: FPcolors.fpPrimary),
                onPressed: onPressed,
                child: Text(buttonTitle,
                    style:
                        TextStyle(color: FPcolors.colorWhite, fontSize: 16)))),
      ),
    );
  }
}

class FpElevatedButtonSmall extends StatelessWidget {
  final VoidCallback onPressed;

  String buttonTitle;

  FpElevatedButtonSmall(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 0),
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: FPcolors.fpPrimary),
              onPressed: onPressed,
              child: Text(buttonTitle,
                  style: TextStyle(color: FPcolors.colorWhite, fontSize: 16))),
        ));
  }
}

class FpElevatedButtonLight extends StatelessWidget {
  final VoidCallback onPressed;

  String buttonTitle;

  FpElevatedButtonLight(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            height: 32,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      backgroundColor: FPcolors.fpPrimaryLight2),
                  onPressed: onPressed,
                  child: Text(buttonTitle,
                      style:
                          TextStyle(color: FPcolors.fpPrimary, fontSize: 16))),
            )));
  }
}

class FpOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;

  String buttonTitle;

  String icon;

  FpOutlinedButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 1.0,
                color: FPcolors.fpPrimary,
                style: BorderStyle.solid,
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                defaultSpacerHorizontalSmall,
                Text(buttonTitle,
                    style: TextStyle(color: FPcolors.fpPrimary, fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FpAppBar extends StatelessWidget implements PreferredSize {
  String title = 'hi';

  bool backButtonRequired;

  // bool backButtonRequired = true;
  FpAppBar({super.key, required this.title, required this.backButtonRequired});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButtonRequired == true
          ? IconButton(
              icon: SvgPicture.asset(
                Assets.settings.svg.appbarBackbutton,
                height: 30,
                width: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),

      backgroundColor: Colors.transparent,
      title: Text(title,
          style: FPfonts.dmSans18Primary.copyWith(color: FPcolors.colorBlack)),
      //Text(widget.title),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FpProfileAppBar extends StatelessWidget implements PreferredSize {
  String title = 'hi';

  bool backButtonRequired;

  // bool backButtonRequired = true;
  FpProfileAppBar(
      {super.key, required this.title, required this.backButtonRequired});

  @override
  Widget build(BuildContext context) {
    var actionBtnWidth = Get.width * 0.06;

    return /* AppBar(
      leading: backButtonRequired == true
          ? IconButton(
        icon: SvgPicture.asset(
          Assets.settings.svg.appbarBackbutton,
          height: 30,
          width: 30,
        ),
        onPressed: () => Navigator.of(context).pop(),
      )
          : const SizedBox(),

      backgroundColor: Colors.transparent,
      title: Text(title,
          style: FPfonts.dmSans18Primary.copyWith(color: FPcolors.colorBlack)),

      //Text(widget.title),
      centerTitle: true,
      elevation: 0,

    );*/
        AppBar(
      automaticallyImplyLeading: false,
      leading: backButtonRequired == true
          ? IconButton(
              icon: SvgPicture.asset(
                Assets.settings.svg.appbarBackbutton,
                height: 30,
                width: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),
      actions: [
        // InkWell(
        //   onTap: () {
        //     Get.to(() => const SearchScreen(
        //           type: "Book",
        //         ));
        //   },
        //   child: Assets.icons.search.image(width: actionBtnWidth),
        // ),
        SizedBox(width: Get.width * 0.04),
        /* InkWell(
            onTap: () {
              // const UpdateDialog(originalStoreVersion: "", applink: '',nothanks:() => getHomePageDetails()
               );
              // Get.toNamed(notificationScreen);
            },
            child: Assets.icons.iconDelete.image(width: actionBtnWidth),
          ),*/
        SizedBox(width: Get.width * 0.04),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MenuScreenAppBar extends ConsumerWidget {
  const MenuScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(menuState);
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: state.profileimage == null || state.profileimage == "empty"
              ? Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  height: 49,
                  width: 49,
                  child: const Icon(
                    Icons.person,
                    size: 45,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    state.profileimage!,
                    height: 49,
                    width: 49,
                    fit: BoxFit.cover,
                  ),
                )),
      leadingWidth: 80,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          state.loading
              ? Text(
                  "Loading...",
                  style: FPfonts.body16Primary.copyWith(color: Colors.black),
                )
              : Text(
                  "${state.firstname} ${state.lastname}",
                  style: FPfonts.dmSans20Bold,
                ),
          Text(
            state.email,
            style: FPfonts.body16Primary.copyWith(color: Colors.black),
          ),
        ],
      ),
      actions: [
        /* IconButton(
          onPressed: () => Get.toNamed(barCodeScreen),
          icon: SvgPicture.asset(Assets.settings.svg.appbarQrcode),
        ),*/
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
              },
              icon: SvgPicture.asset(Assets.settings.svg.appbarEdit)),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FpcountryPicker extends StatelessWidget {
  const FpcountryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      initialSelection: '+91',
      flagWidth: 28,
      showDropDownButton: true,
      textStyle: FPfonts.body16Primary.copyWith(color: FPcolors.colorBlack),
      flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
    );
  }
}

SizedBox LargeTitle28(Title) {
  return SizedBox(
      height: 70,
      child: Text(Title,
          style: FPfonts.dmSans28Bold.copyWith(color: FPcolors.fpPrimary)));
}

SizedBox LargeTitle28mini(Title) {
  return SizedBox(
      height: 64,
      child: Text(Title,
          style: FPfonts.dmSans28Bold.copyWith(color: FPcolors.fpPrimary)));
}

Padding LargeTitle24(Title) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 24,
    ),
    child: SizedBox(
        height: 70,
        child: Text(Title,
            style: FPfonts.dmSans24Bold.copyWith(color: FPcolors.fpPrimary))),
  );
}
