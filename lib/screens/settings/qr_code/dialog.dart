import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:get/get.dart';

class TransactionDialog extends StatelessWidget {
  const TransactionDialog({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Get.width * 0.06),
      ),
      padding: EdgeInsets.all(Get.width * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Transaction Successful',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Transaction id - $id',
            style: const TextStyle(color: Colors.grey),
          ),
          SizedBox(height: Get.height * 0.04),
          const Text(
            'Did you another book to drop ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          SizedBox(
            width: double.infinity,
            child: FpOutlinedButton(
              onPressed: () {
                // Get.back();
                // Get.to(CodeScanner(order));

                Get.back(result: true);
              },
              buttonTitle: 'Yes',
              icon: '',
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                // Get.back();
                // Get.to(CodeScanner(order));
                Get.offAndToNamed(dashboard);
              },
              child: const Text('Explore Book'),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          // TextButton(
          //   onPressed: () => Get.back(),
          //   child: const Text('Cancel', style: TextStyle(color: Colors.black)),
          // ),
          const Text(
            'Thanks for making Freshpage mobile app book-sharing experience so great.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
