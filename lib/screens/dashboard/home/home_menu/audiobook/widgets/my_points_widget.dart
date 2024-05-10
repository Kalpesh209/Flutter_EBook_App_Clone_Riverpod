import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get.dart';

class MyPointsWidget extends StatelessWidget {
  final num points;

  const MyPointsWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        border: Border.all(color: const Color(0xffC74225).withOpacity(0.22)),
        gradient: const LinearGradient(
          colors: [paleBg, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Reading\nChellange',
                style: AppStyles.titleStyle.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Text(
                    'My Total\nPoints',
                    style: TextStyle(color: Color(0xff616668), fontSize: 12),
                  ),
                  SizedBox(width: 16),
                  Text('1000',
                      style: TextStyle(color: themeColor, fontSize: 26)),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your button's action here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: themeColor, // Text color
                elevation: 3, // Elevation (shadow)
              ),
              child: const Text('Start'),
            ),
          ],
        )
      ]),
    );
  }
}
