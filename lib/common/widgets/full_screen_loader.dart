import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: Get.height * 0.02),
          const Text('Loading...'),
        ],
      ),
    );
  }
}
