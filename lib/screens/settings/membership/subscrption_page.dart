import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/providers/subscription_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/membership/widgets/subscription_card.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/helpers/snakbar_helper.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/size/size.dart';

class SubProv extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  var order;

  cancelSub() async {
    loading = true;

    //dio.Response<dynamic> response =
    await dioService.post('/usersubscription/user/cancle').whenComplete(() {
      loading = false;
      SnackbarHelper.success("Subscription Canceled Success");
    });
    //Map<String, dynamic> res = response.data;
  }
}

final subprov = ChangeNotifierProvider.autoDispose((r) {
  return SubProv();
});

class SubscribePage extends ConsumerWidget {
  final bool showSuccess;
  final bool fromCart;

  const SubscribePage({
    super.key,
    this.showSuccess = true,
    required this.fromCart,
  });

  final int index = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var substate = ref.watch(subprov);
    var state = ref.watch(subscriptionPageProvider);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        title: Text(
          state.items.isNotEmpty
              ? state.items[state.index].name != ''
                  ? '${state.items[state.index].name ?? ""} :'
                  : ''
              : '',
          style: FPfonts.dmSans24boldblack,
        ),
        centerTitle: true,
      ),
      body: state.loading
          ? loadingCenter()
          : Center(
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  CarouselSlider(
                    disableGesture: true,
                    items: state.items
                        .map((item) => SubscriptionCard(
                              subscription: item,
                              fromcart: fromCart,
                              onSuccess: () {
                                if (showSuccess) {
                                  Get.close(1);
                                  // Get.to(
                                  //     () => SubscriptionSuccess(e.price.toString()));
                                } else {
                                  Get.back(result: true);
                                }
                              },
                            ))
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (i, e) {
                        state.update(i);
                        // state.heading_one = state.items[i].headingone ?? "rakshit+${i}";
                      },
                      height: height * 0.72,
                      autoPlay: false,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  ),
                  defaultSpacer,
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              side: MaterialStateBorderSide.resolveWith(
                (states) =>
                    const BorderSide(width: 1.7, color: Color(0xFFC74225)),
              ),
              checkColor: const Color(0xFFC74225),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return paleBg;
                }
                return paleBg;
              }),
              value: state.checkTerm,
              onChanged: state.onCheckChanged,
            ),
            Flexible(
              child: Wrap(
                children: [
                  Text(
                    'By continuing, you agree to our ',
                    style: AppStyles.f13.copyWith(color: black),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      'Terms of Service',
                      style: AppStyles.f13.copyWith(color: themeColor),
                    ),
                  ),
                  const Text(
                    ' and ',
                    style: AppStyles.f13,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      'Privacy Policy.',
                      style: AppStyles.f13.copyWith(color: themeColor),
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

  _launchURL() async {
    final Uri url = Uri.parse('https://www.google.co.in/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
