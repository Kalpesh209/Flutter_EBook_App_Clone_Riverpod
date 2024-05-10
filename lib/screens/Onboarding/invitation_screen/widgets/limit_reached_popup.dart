import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LimitReachedPopUp extends StatelessWidget {
  const LimitReachedPopUp({Key? key}) : super(key: key);

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
          Assets.auth.images.sadFaceIcon.image(width: 45, height: 45),
          Text(
            'Code limt reached',
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          SizedBox(height: Get.height * 0.025),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
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
