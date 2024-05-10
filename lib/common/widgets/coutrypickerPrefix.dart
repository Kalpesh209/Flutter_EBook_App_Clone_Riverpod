//   import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import '../controller.dart';
// import '../core/size/size.dart';
// import '../gen/assets.gen.dart';

//   String countryCode = "+91";

// SizedBox countrypicker() => SizedBox(
//                                     height: 23,
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         defaultSpacerHorizontal,
//                                         SizedBox(child: Consumer<
//                                                 PhoneNumberscreenController>(
//                                             builder:
//                                                 (context, phoneNumberCtrl, _) {
//                                           return GestureDetector(
//                                             onTap: () async {
//                                               final code = await phoneNumberCtrl
//                                                   .countryPicker
//                                                   .showPicker(context: context);

//                                               if (code != null) {
//                                                 phoneNumberCtrl
//                                                     .onCountryCodechanges(
//                                                         code: code);
//                                               }
//                                               if (phoneNumberCtrl.countryCode !=
//                                                   null) {
//                                                  countryCode = phoneNumberCtrl
//                                                     .countryCode!.dialCode;
//                                               }
//                                             },
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 phoneNumberCtrl.countryCode
//                                                             ?.flagImage ==
//                                                         null
//                                                     ? SvgPicture.asset(Assets.images.svg.contact
//                                                         )
//                                                     : phoneNumberCtrl
//                                                         .countryCode!.flagImage,
//                                                 defaultSpacer,
//                                                 SizedBox(
//                                                   child: Text(
//                                                     phoneNumberCtrl.phoneCode,
//                                                     // style: GoogleFont
//                                                     //     .phonenUmberTextStyle,
//                                                   ),
//                                                 ),
//                                                 const Icon(
//                                                     Icons.keyboard_arrow_down,
//                                                     color: Colors.black)
//                                               ],
//                                             ),
//                                           );
//                                         })),
//                                         // Text(
//                                         //   "|",
//                                         //   style: TextStyle(
//                                         //       fontSize: 22,
//                                         //       color: Skymark.lightGrey),
//                                         // ),
//                                         defaultSpacerHorizontalSmall
//                                       ],
//                                     ),
//                                   );
