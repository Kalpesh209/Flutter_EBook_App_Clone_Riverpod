import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/tc_and_privacypolicy/providers/term_condtion.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';

class TermCondtionScreen extends ConsumerStatefulWidget {
  final String title;

  const TermCondtionScreen({super.key, required this.title});

  @override
  ConsumerState<TermCondtionScreen> createState() => _TermCondtionScreenState();
}

class _TermCondtionScreenState extends ConsumerState<TermCondtionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = ref.watch(termcondtionstate);
      state.getContactDetail();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(termcondtionstate);
    return Scaffold(
      appBar: FpAppBar(title: widget.title, backButtonRequired: true),
      body: Padding(
        padding: const EdgeInsets.only(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.loading
                  ? loadingCenter()
                  : Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.04, right: Get.width * 0.04),
                      child: Html(
                        data: state.contentt,
                      ))
              // SizedBox(
              //     height: 70,
              //     child: Text(title,
              //         style: FPfonts.dmSans28Bold
              //             .copyWith(color: FPcolors.fpPrimary))),
              // Text(
              //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta erat eu ligula'
              //   ' condimentum, in porttitor arcu rutrum. Pellentesque sodales luctus libero, eu hendrerit'
              //   ' risus viverra vitae. Maecenas luctus ipsum vitae massa dictum dictum id ac nisl. ',
              //   style: FPfonts.dmSans17,
              // ),
              // Text(
              //   '\nEtiam sed hendrerit nulla',
              //   style:
              //       FPfonts.dmSans18Primary.copyWith(color: FPcolors.fpBlack),
              // ),
              // defaultSpacerSmall,
              // Text(
              //   'Etiam dapibus leo nec turpis blandit, sed placerat turpis tincidunt. '
              //   'Pellentesque efficitur lectus ut mauris elementum pulvinar. Phasellus diam massa, '
              //   'efficitur vel urna et, pellentesque pretium tortor. \n\nEtiam dapibus leo nec turpis blandit, '
              //   'sed placerat turpis tincidunt. Pellentesque efficitur lectus',
              //   style: FPfonts.dmSans17,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//
