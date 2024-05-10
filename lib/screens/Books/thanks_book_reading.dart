import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';
import '../../../config/colors/colors.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/size/size.dart';
import '../../../gen/assets.gen.dart';
import '../../config/route/route_names.dart';
import '../dashboard/category/providers/category_provider.dart';

class ThankYouScreen extends ConsumerStatefulWidget {


  const ThankYouScreen({Key? key, }) : super(key: key);

  @override
  ThankYouScreenState createState() => ThankYouScreenState();
}

class ThankYouScreenState extends ConsumerState<ThankYouScreen> {

  String bookName = Get.parameters['bookName'] ?? '';


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(categoryProviderNew).getExplorerBook();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(categoryProviderNew);

    var actionBtnWidth = Get.width * 0.06;

    return Scaffold(
      backgroundColor: FPcolors.fpPrimaryLight1,
      appBar: /*FpAppBar(title: 'Rate & Review', backButtonRequired: false)*/
          AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'FreshPage',
          style: TextStyle(fontWeight: FontWeight.w400),
        )),
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
                'We hope you enjoyed $bookName and appreciate your dedication to finishing it.',
                textAlign: TextAlign.center,
                style: FPfonts.dmSans16fpPrimary,
              ),
              defaultSpacerLarge,
              defaultSpacerLarge,


              Text(
                'Thank you for choosing FreshPage for your reading adventure. We look forward to accompanying you on your next literary journey.',
                textAlign: TextAlign.center,
                style: FPfonts.dmSans10fpPrimary,
              ),
            /*  state.continueReadingList.isNotEmpty
                  ? categoryaudioView(state.continueReadingList, state.loading,
                      "Continue Reading", "e_books")
                  : SizedBox(
                      width: 5.w,
                    ),*/
             /* FilledButton(
                onPressed: () async {
                  debugPrint("here");
                  Get.close(1);
                  Get.to(() => const DashBoard(initial: 0));
                },
                child: const SizedBox(
                    width: 200,
                    height: 20,
                    child: Center(
                      child: Text("Explorer"),
                    )),
              )*/
            ],
          ),
        ),
      ),
        bottomNavigationBar: FpElevatedButton(
          onPressed: () {
            Get.offAndToNamed(dashboard);
            //Navigator.pushNamed(context, 'menu');
          },
          buttonTitle: 'Explorer'),
    );
  }
}
