import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDelivery extends StatelessWidget {
  const ConfirmDelivery({super.key});

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
            'Out For Delivery',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          const Text(
            'Order has reached the location',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: Get.height * 0.03),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: () {
                  // Get.back();
                  // Get.to(CodeScanner(order));

                  Get.back(result: true);
                },
                child: const Text('Confirm')),
          ),
          SizedBox(height: Get.height * 0.02),
          TextButton(
              onPressed: () => Get.back(),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)))
        ],
      ),
    );
  }
}
