import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/constants.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Get.textTheme.headlineLarge?.copyWith(color: themeColor),
    );
  }
}
