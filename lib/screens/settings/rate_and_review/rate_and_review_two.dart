import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';
import '../../../config/colors/colors.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/size/size.dart';
import '../../../gen/assets.gen.dart';

class RateAndReviewScreenTwo extends StatelessWidget {
  const RateAndReviewScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var actionBtnWidth = Get.width * 0.06;

    return Scaffold(
      backgroundColor: FPcolors.fpPrimaryLight1,
      appBar: /*FpAppBar(title: 'Rate & Review', backButtonRequired: false)*/
      AppBar(
        automaticallyImplyLeading: false,
        title: const Center( child: Text('Rate & Review',style: TextStyle(fontWeight: FontWeight.w400),)),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Assets.icons.cancelIcon.image(width: actionBtnWidth),
          ),
          SizedBox(width: Get.width * 0.04),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              defaultSpacerLarge,
              defaultSpacerLarge,
              SvgPicture.asset(Assets.settings.svg.heartLikesIcons),
              defaultSpacerLarge,
              defaultSpacerLarge,
              defaultSpacerLarge,
              Text(
                'Thank You!\nwe appreciate your \nReview.',
                textAlign: TextAlign.center,
                style: FPfonts.dmSans24fpPrimary,
              ),
              defaultSpacerLarge,
              defaultSpacerLarge,
              Text(
                'We love more from your\nexperiance',
                textAlign: TextAlign.center,
                style: FPfonts.dmSans16color2C2B2B,
              ),
            ],
          ),
        ),
      ),
    /*  bottomNavigationBar: FpElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'menu');
          },
          buttonTitle: 'Send Feedback'),*/
    );
  }
}
