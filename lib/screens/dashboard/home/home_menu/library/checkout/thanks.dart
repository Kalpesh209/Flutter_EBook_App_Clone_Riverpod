import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/dashboard.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../../config/app_text_styles.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paleBg,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.08,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Get.height * 0.07),
            Assets.auth.images.successimage.image(width: 200, height: 200),
            Text(
              'Your order is Complete!',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: FPcolors.fpPrimary,
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            Text(
              'You can check Order status on Pending Tab in Wallet . or',
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: HexColor('#424949'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Check ',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#424949'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.close(1);
                    Get.to(() => const DashBoard(initial: 2));
                  },
                  child: Text(
                    'Status Here',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: FPcolors.fpPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //You can check Order status on Pending Tab in Wallet . or  Check Status Here
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 40.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.close(1);
                  Get.to(() => const DashBoard(initial: 0));
                },
                child: Text('Explore more books',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#FFFFFF'),
                    )),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Flexible(
              child: Wrap(
                children: [
                  Text(
                    'You can check status from  ',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#424949'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Wallet',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#090A0A'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
