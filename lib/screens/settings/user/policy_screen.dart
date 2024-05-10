import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/providers/edit_profile.dart';

import '../../../../common/widgets/components.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../../config/route/route_names.dart';
import '../../../../config/size/size.dart';
import '../../../../gen/assets.gen.dart';
import '../bottomnavigation_bar_tabs/menu/menu_data.dart';
import '../bottomnavigation_bar_tabs/menu/widgets_policy.dart';

class PolicyMenuScreen extends ConsumerStatefulWidget {
  const PolicyMenuScreen({super.key});

  @override
  ConsumerState<PolicyMenuScreen> createState() => _PolicyMenuConsumerState();
}

class _PolicyMenuConsumerState extends ConsumerState<PolicyMenuScreen> {
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

    return Stack(children: <Widget>[
      Container(
        color: FPcolors.colorWhite,
        child: SizedBox(
          height: 800.h,
          child: ListView(
            children: [
              defaultSpacer,
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 24,
                ),
                child: PolicyMenuExpansionWidget(
                  listcount: 8,
                  tileName: policyMenu,
                  mainHead: "Policy",
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 100.h,
        child: Scaffold(
          appBar: FpAppBar(title: 'Policy', backButtonRequired: true),
        ),
      )
    ]);

    /* Scaffold(
      appBar: FpAppBar(title: 'Policy', backButtonRequired: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: PolicyMenuExpansionWidget(
                    listcount: 8,
                    tileName: policyMenu,
                    mainHead: "Policy",
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );*/
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
}
