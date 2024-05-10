import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/contact/providers/contact_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/exceptions/invalid_form.dart';
import '../../../common/helpers/snakbar_helper.dart';
import '../../../common/widgets/components.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/colors/colors.dart';
import '../../../config/constants.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/size/size.dart';
import '../../../config/themes/textfield_decorations.dart';
import '../../../gen/assets.gen.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  GestureDetector socialMediaIconButton(String name) {
    return GestureDetector(
      child: SvgPicture.asset(name),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var state = ref.watch(contactscreenprov);
    state.getContactDetail();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(contactscreenprov);
    var actionBtnWidth = Get.width * 0.06;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.background.bgTop.keyName))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: FpAppBar(title: '', backButtonRequired: true),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LargeTitle28mini('Contact'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller: state.name,
                                decoration: FpTextFieldDecoration(
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          defaultSpacerHorizontal,
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: state.phone,
                                decoration: FpTextFieldDecoration(
                                  hintText: 'Phone no.',
                                ),
                                validator: (value) {
                                  String mobilePattern =
                                      r'^[0-9]{10}$'; // Simple 10-digit number pattern
                                  RegExp regExp = RegExp(mobilePattern);
                                  if (value!.isEmpty) {
                                    return 'Please enter your mobile number';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid 10-digit mobile number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      defaultSpacer,
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: state.email,
                          decoration: FpTextFieldDecoration(hintText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            String emailPattern =
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                            RegExp regExp = RegExp(emailPattern);
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      defaultSpacer,
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: state.subcon,
                          decoration:
                              FpTextFieldDecoration(hintText: 'Subject'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter subject';
                            }
                            return null;
                          },
                        ),
                      ),
                      defaultSpacer,
                      Container(
                        color: Colors.white,
                        height: 136,
                        child: TextFormField(
                          controller: state.messagecon,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          expands: true,
                          decoration: FpTextFieldDecorationLarge(
                              hintText: 'Your Message'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* Checkbox(
                            side:  BorderSide(
                              // set border color here
                              color: FPcolors.colorF35A38,
                            ),
                            checkColor: Colors.white,
                            value: state.agree,
                            onChanged: (bool? value) {
                              state.checkBox = value!;
                            },
                          ),*/
                          Checkbox(
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                  width: 1.7, color: Color(0xFFC74225)),
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
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Center(
                                    child: Text.rich(TextSpan(
                                        text:
                                            'By continuing, you agree to our ',
                                        style: AppStyles.f13
                                            .copyWith(color: black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '\nTerms of Service',
                                              style: AppStyles.f13
                                                  .copyWith(color: textColor),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.toNamed(privacy);
                                                  // _launchURL();
                                                  // code to open / launch terms of service link here
                                                }),
                                          TextSpan(
                                              text: ' and ',
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Privacy Policy',
                                                    style: AppStyles.f13
                                                        .copyWith(
                                                            color: textColor),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Get.toNamed(
                                                                privacy);
                                                            // _launchURL();
                                                            // code to open / launch privacy policy link here
                                                          })
                                              ])
                                        ])),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      defaultSpacer,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 72,
                              width: 110,
                              /* width: 180*/ /*MediaQuery.of(context).size.width*/ /*,*/
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, bottom: 18),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: FPcolors.fpPrimary),
                                    onPressed: () async {
                                      try {
                                        if (_formKey.currentState!.validate()) {
                                          if (state.agree == true) {
                                            await state.postContactDetails();
                                            FocusScope.of(context).unfocus();
                                          } else {
                                            SnackbarHelper.success(
                                                'accept terms and privacy policy');
                                          }
                                        }
                                      } on InvalidFormException catch (e) {
                                        SnackbarHelper.error(e.message);
                                      } on DioException catch (e) {
                                        SnackbarHelper.error(
                                            e.response?.data['message']);
                                      }
                                    },
                                    child: Text('Send',
                                        style: TextStyle(
                                            color: FPcolors.colorWhite,
                                            fontSize: 16))),
                              )),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Row contents vertically,
                          children: [
                            Text(
                              'Support us',
                              style: FPfonts.dmSans18Bold,
                            ),
                          ]),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.settings.svg.homeaddress,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 300.w,
                            child: Text(
                              state.address,
                              style: FPfonts.body12regular,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.settings.svg.email,
                            height: 15,
                            width: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            state.contatcemail,
                            style: FPfonts.body12regular,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.settings.svg.whatsicon,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${state.country_code} ${state.number}",
                            style: FPfonts.body12regular,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '---------------------- OR ------------------------',
                  style: FPfonts.dmSans14Mediumgry,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          await launch(state.facbooklink,
                              forceWebView: true, enableJavaScript: true);
                        },
                        child: socialMediaIconButton(
                            Assets.settings.svg.facebook)),
                    const SizedBox(width: 40),
                    GestureDetector(
                        onTap: () async {
                          await launch(state.twitterlink,
                              forceWebView: true, enableJavaScript: true);
                        },
                        child:
                            socialMediaIconButton(Assets.settings.svg.twitter)),
                    const SizedBox(width: 40),
                    GestureDetector(
                        onTap: () async {
                          await launch(state.instalink,
                              forceWebView: true, enableJavaScript: true);
                        },
                        child: socialMediaIconButton(
                            Assets.settings.svg.instagram))
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )),
        // bottomNavigationBar:
        //     FpElevatedButton(onPressed: () {}, buttonTitle: 'Submit'),
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
