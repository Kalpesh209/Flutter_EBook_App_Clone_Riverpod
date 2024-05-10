import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/change_password.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/profile_edit_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/components.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../../config/route/route_names.dart';
import '../../../../config/services/setup_singleton_services.dart';
import '../../../../config/size/size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../update_dialog.dart';
import '../../membership/subscrption_page.dart';
import '../../membership/subscrption_page_new.dart';
import '../../user/providers/edit_profile.dart';
import 'menu_data.dart';

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});

  @override
  ConsumerState<Menu> createState() => _MenuConsumerState();
}

class _MenuConsumerState extends ConsumerState<Menu> {
  var isExpanded = true;
  var isExpanded2 = true;

  @override
  void didChangeDependencies() {
    var state = ref.watch(menuState);
    WidgetsBinding.instance.addPostFrameCallback((t) {
      state.getContactDetail();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var state = ref.watch(menustate);
    var stateProfile = ref.watch(edituserstate);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                /* const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: MenuScreenAppBar(),
                ),*/
                // banner(context),
                defaultSpacerSmall,
                ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      // tilePadding: EdgeInsets.only(left: 0),
                      trailing: isExpanded
                          ? const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                            ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => isExpanded = expanded);
                      },
                      title: Text(
                        "Settings",
                        style: FPfonts.dmSans18Primary,
                      ),
                      shape: const Border(),
                      children: [
                        ...List.generate(
                            3,
                            (index) => ListTile(
                                onTap: () {
                                  /* if (mySettingsList1[index]['title'] == 'Languages') {
                                    _bottomsheetlanguage(context);
                                  } else if (mySettingsList1[index]['title'] == 'Font Size') {
                                    _bottomsheetFont(context);
                                  } else */
                                  if (mySettingsList1[index]['title'] ==
                                      'Change Password') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChangePasswordScreen()));
                                    // Navigator.pushNamed(
                                    //     context, 'changepasswordScreen');
                                  } else if (mySettingsList1[index]['title'] ==
                                      'Notification') {
                                    _bottomsheetNotification(context,
                                        notification: () => {},
                                        appnotification: () => {});
                                  } else if (mySettingsList1[index]['title'] ==
                                      'Delete Account') {
                                    _showAlertDialog(context);
                                  }
                                },
                                leading: SvgPicture.asset(
                                  mySettingsList1[index]['icon'],
                                  width: 24.h,
                                  height: 24.h,
                                ),
                                title: Text(
                                  mySettingsList1[index]['title'],
                                  style: FPfonts.dmSans17,
                                ),
                                trailing: const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                )))
                      ],
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: MenuExpansionWidget(
                    listcount: 7,
                    tileName: appsettings,
                    mainHead: names[1],
                  ),
                ),*/
                /* ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      trailing: isExpanded2
                          ? const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                            ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => isExpanded2 = expanded);
                      },
                      shape: const Border(),
                      title: Text(
                        names[2],
                        style: FPfonts.dmSans18Primary,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuExpansionInnerWidget(
                          mainHead: names[4],
                          listcount: 3,
                          tileName: sharedData,
                          onTap: (p0) {
                            debugPrint('p0 $p0');
                            if (p0 == 'Personal Info') {
                              Get.to(() => const EditProfile());
                            }else if (p0 == 'Delete Account') {
                             stateProfile.deleteUser();
                            }
                          },
                        ),
                        MenuExpansionInnerWidget(
                          mainHead: names[5],
                          listcount: 3,
                          tileName: collectedData,
                          onTap: (p0) {},
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: MenuExpansionWidget(
                    listcount: 8,
                    tileName: more,
                    mainHead: names[3],
                  ),
                ),
                defaultSpacer,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      _showLogoutDialog(context);
                    },
                    child: Text(
                      "Log out",
                      style: FPfonts.dmSans18Primary,
                    ),
                  ),
                ),
                defaultSpacer,
                defaultSpacer,
                /* Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      var whatsappUrl =
                          "whatsapp://send?phone=${"+919512914914"}";
                      final Uri url = Uri.parse(whatsappUrl);
                      if (!await launchUrl(url)) {}

                      // await authService.logout();
                      // Get.offAndToNamed(LOGIN);
                      // await state.deleteUser();
                      // FirebaseAnalytics.instance
                      //     .logEvent(name: 'delete_account')
                      //     .then((value) => null);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Reach Us",
                          style: FPfonts.dmSans18Primary,
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/whatsapp.svg'),
                      ],
                    ),
                  ),
                ),*/
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _bottomsheetNotification(context,
      {required Function() notification, required Function() appnotification}) {
    var state = ref.watch(edituserstate);
    var state1 = ref.watch(menuState);

    bool switchValue = state1.notification;
    bool switchValue2 = state1.app_notification;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (bc, s) {
            return SizedBox(
                height: 250,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            defaultSpacerSmall,
                            SvgPicture.asset(
                                Assets.settings.svg.bottomsheeticon),
                          ],
                        ),
                      ),
                      defaultSpacer,
                      Text(
                        "Notification",
                        style: FPfonts.inter24primary,
                      ),
                      defaultSpacer,
                      ListTile(
                        title: Text(
                          "Notifications",
                          style: FPfonts.dmSans17,
                        ),
                        trailing: CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: switchValue,
                          activeColor: const Color(0xffC74225),
                          onChanged: (bool? value) async {
                            // This is called when the user toggles the switch.
                            s(() {
                              switchValue = value ?? false;
                              state1.notification = value!;
                              state1.generalNotification(value!);
                            });
                          },
                        ),
                      ),
                      defaultSpacer,
                      ListTile(
                        title: Text(
                          "App Notifications",
                          style: FPfonts.dmSans17,
                        ),
                        trailing: CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: switchValue2,
                          activeColor: const Color(0xffC74225),
                          onChanged: (bool? value) {
                            // This is called when the user toggles the switch.
                            s(() {
                              switchValue2 = value ?? false;
                              state1.appNotification(value!);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ));
          });
        });
  }

  void _bottomsheetFont(context) {
    double currentSliderValue = 20;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          //bool switchValue = true;
          return StatefulBuilder(builder: (bc, s) {
            return SizedBox(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            defaultSpacerSmall,
                            SvgPicture.asset(
                                Assets.settings.svg.bottomsheeticon),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        "Font Size",
                        style: FPfonts.inter24primary,
                      ),

                      Text(
                        "You can change font size",
                        style: FPfonts.dmSans14grey,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'A',
                            style:
                                FPfonts.dmSans14Medium.copyWith(fontSize: 20),
                          ),
                          Text(
                            'A',
                            style:
                                FPfonts.dmSans14Medium.copyWith(fontSize: 36),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          overlayShape: SliderComponentShape.noThumb,
                        ),
                        child: Slider(
                          thumbColor: FPcolors.fpPrimary,
                          activeColor: FPcolors.fpPrimary,
                          inactiveColor: FPcolors.fpPrimaryLight1,
                          value: currentSliderValue,
                          max: 100,
                          divisions: 8,
                          label: currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            s(() {
                              currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      // RangeSlider(values: values, onChanged: onChanged),
                      Center(
                          child: SizedBox(
                              width: double.infinity,
                              child: FpElevatedButtonResizable(
                                  onPressed: () {},
                                  buttonTitle: 'Save Changes')))
                    ],
                  ),
                ));
          });
        });
  }

  void _bottomsheetlanguage(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          //bool switchValue = true;
          return SizedBox(
              height: 280,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          defaultSpacerSmall,
                          SvgPicture.asset(Assets.settings.svg.bottomsheeticon),
                        ],
                      ),
                    ),
                    defaultSpacer,
                    Text(
                      "Languages",
                      style: FPfonts.inter24primary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultSpacer,
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(0)),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  FPcolors.fpPrimaryLight2),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {},
                          child: Text("English",
                              style: TextStyle(
                                  color: FPcolors.fpPrimary, fontSize: 16))),
                    ),
                    defaultSpacerSmall,
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(179, 229, 229, 229),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text("Hindi",
                              style: TextStyle(
                                  color: FPcolors.greyBorder, fontSize: 16))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultSpacerSmall,
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(179, 229, 229, 229),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text("Sanskrit",
                              style: TextStyle(
                                  color: FPcolors.greyBorder, fontSize: 16))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        });
  }

  Widget banner(BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => const SubscribePageNew(
                showSuccess: false,
                fromCart: false,
              ) /*SubscribePage(
                fromCart: false,
              )*/
              ,
            ));
        // Navigator.push(
        //     ctx,
        //     MaterialPageRoute(
        //       builder: (context) => const Addresses(),
        //     ));
        //     Navigator.push(ctx,  MaterialPageRoute(
        //   builder: (context) =>  TCandPrivacyPolicyScreen(title: 'Privacy Policy',),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Container(
          height: MediaQuery.of(ctx).size.width * .20,
          width: double.infinity,
          decoration: BoxDecoration(
              color: FPcolors.fpPrimary,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: ListTile(
              title: Text('Membership Plan', style: FPfonts.inter18White),
              subtitle: Text('Upgrade for more features',
                  style: FPfonts.inter14White),
            ),
          ),
        ),
      ),
    );
  }

  ListTile customAppBar() {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.settings.png.image.keyName)),
            borderRadius: BorderRadius.circular(16)),
        height: 49,
        width: 49,
      ),
      title: Text(
        'Wiliam',
        style: FPfonts.dmSans20Bold,
      ),
      subtitle: Text(
        'abc@example.com',
        style: FPfonts.dmSans16bold.copyWith(color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.settings.svg.appbarQrcode)),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.settings.svg.appbarEdit)),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    var state = ref.watch(edituserstate);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeletDialog(
            applink: '',
            originalStoreVersion: '',
            deactiviteUser: () => state.deactiviteUser(),
            addressChanged: () => state.deleteUser());
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogoutDialog();
      },
    );
  }
}
