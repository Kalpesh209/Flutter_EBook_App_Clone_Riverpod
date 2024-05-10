import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SubscriptionSuccessState extends ChangeNotifier {}

final subscriptionSuccessProvider = ChangeNotifierProvider((r) {
  return SubscriptionSuccessState();
});

class SubscriptionSuccess extends ConsumerWidget {
  final int amount;

  const SubscriptionSuccess(this.amount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //var state = ref.watch(subscriptionSuccessProvider);
    return ContainerWithTopLogo(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.04),
              child: Column(
                children: [
                  Center(child: SvgPicture.asset(Assets.icons.subok)),
                  SizedBox(height: Get.height * 0.01),
                  const Text(
                    'Transaction Success!',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.04,
                      vertical: Get.height * 0.06,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFFC3BD)),
                      borderRadius: BorderRadius.circular(Get.width * 0.06),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffFFE4DD),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '₹$amount',
                          style:
                              const TextStyle(fontSize: 28, color: themeColor),
                        ),
                        const Text('Transaction Successfull',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(height: Get.height * 0.02),
                        SvgPicture.asset(Assets.icons.divider),
                        SizedBox(height: Get.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(DateFormat.yMMMEd().format(DateTime.now())),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Time',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(DateFormat.jms().format(DateTime.now())),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const DashBoard(
                              initial: 0,
                            )));
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
