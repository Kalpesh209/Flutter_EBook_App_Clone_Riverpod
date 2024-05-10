import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get.dart';

class AppStyles {
  static const TextStyle f13 = TextStyle(fontSize: 13);
  static const TextStyle skipBtnStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  // input decorations
  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    hintStyle: TextStyle(color: Colors.grey.shade500),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
      gapPadding: 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: themeColor),
      gapPadding: 0,
    ),
  );

  static InputDecoration inputDecorationforEmail = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    hintStyle: TextStyle(color: Colors.grey.shade500),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
      gapPadding: 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
      gapPadding: 0,
    ),
  );

  // padding
  static EdgeInsets stepConatinerPadding = EdgeInsets.only(
    left: Get.width * 0.08,
    right: Get.width * 0.08,
    bottom: Get.width * 0.08,
    top: Get.width * 0.02,
  );

  // text stylles
  static TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );
  static TextStyle slideSubTitleStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff6C7072),
  );
}
