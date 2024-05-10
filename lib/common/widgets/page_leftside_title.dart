import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/constants.dart';

class PageLeftSideTitle extends StatelessWidget {
  final String title;

  const PageLeftSideTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.right,
      style: Get.textTheme.headlineLarge?.copyWith(color: themeColor),
    );
  }
}
