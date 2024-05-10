import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmCancel extends StatelessWidget {
  const ConfirmCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.width * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Confirm Order',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          const Text(
            'Are you sure to cancel this order?',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: Get.height * 0.03),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Confirm')),
          ),
          SizedBox(height: Get.height * 0.02),
          TextButton(
              onPressed: () => Get.back(result: false),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)))
        ],
      ),
    );
  }
}
