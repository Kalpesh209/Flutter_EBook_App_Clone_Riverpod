// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/tc_and_privacypolicy/providers/privacy_policy.dart';
import 'package:get/get.dart';

import '../../../common/widgets/components.dart';

class PrivacyPolicyScreen extends ConsumerStatefulWidget {
  String title;

  PrivacyPolicyScreen({super.key, required this.title});

  @override
  ConsumerState<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends ConsumerState<PrivacyPolicyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = ref.watch(privacypolicy);
      state.getContactDetail();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // var state = ref.watch(privacypolicy);
    // state.getContactDetail();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(privacypolicy);
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
                        data: state.content,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

//
