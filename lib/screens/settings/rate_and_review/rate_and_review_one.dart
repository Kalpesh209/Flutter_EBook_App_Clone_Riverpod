import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/rate_and_review/providers/rate_review.dart';

import '../../../config/colors/colors.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/themes/textfield_decorations.dart';
import '../../../gen/assets.gen.dart';

class RateAndReviewScreenOne extends ConsumerWidget {
  const RateAndReviewScreenOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(rateandreview);
    return Scaffold(
      backgroundColor: FPcolors.colorWhite,
      resizeToAvoidBottomInset: false,
      appBar: FpAppBar(title: 'Rate & Review', backButtonRequired: true),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 56),
                SvgPicture.asset(Assets.settings.svg.likes),
                defaultSpacerLarge,
                defaultSpacer,
                Text(
                  'How Would You Rate \nYour App Experience?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FPcolors.fpPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                defaultSpacerLarge,
                defaultSpacer,
                RatingBar.builder(
                  unratedColor: FPcolors.fpPrimaryLight1,
                  itemSize: 50,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: FPcolors.fpPrimary),
                  onRatingUpdate: (rating) {
                    debugPrint('rating $rating');
                    state.rate = rating;
                  },
                ),
                defaultSpacerLarge,
                defaultSpacer,
                SizedBox(
                  height: 136,
                  width: double.infinity,
                  child: TextFormField(
                      controller: state.feedcon,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: null,
                      expands: true,
                      decoration:
                          FpTextFieldDecorationLarge(hintText: 'Review')),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FpElevatedButton(
          onPressed: () {
            state.postRate();
            // Navigator.pushNamed(context, 'rateAndReviewTwo');
          },
          buttonTitle: 'Submit'),
    );
  }
}
