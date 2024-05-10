import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InvalidCodePopup extends StatelessWidget {
  const InvalidCodePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.auth.images.confusedIcon.image(width: 45, height: 45),
          Text(
            'Invalid',
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            'Your entered code is invalid',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          SizedBox(height: Get.height * 0.025),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Get.back(),
              child: const Text('Try Again'),
            ),
          ),
          SizedBox(height: Get.height * 0.025),
          const Text('Or'),
          SizedBox(height: Get.height * 0.025),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Get.back();
                Get.toNamed(waitList);
              },
              child: const Text('Join the waitlist'),
            ),
          ),
          SizedBox(height: Get.height * 0.015),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'No, thanks',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
