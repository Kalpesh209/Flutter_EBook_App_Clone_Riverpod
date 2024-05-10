import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/colors.dart';
import 'fonts/fonts.dart';

ThemeData appTheme = ThemeData(brightness: Brightness.light).copyWith(
  elevatedButtonTheme: const ElevatedButtonThemeData(
    // backgroundColor: FPcolors.fpPrimary
    style: ButtonStyle(
        // backgroundColor: MaterialStateProperty<Color>
        ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    labelStyle: FPfonts.body16hintText,
    hintStyle: FPfonts.body16hintText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: FPcolors.fpPrimary,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: FPcolors.fptextfieldgrey,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: FPcolors.fptextfieldgrey,
        width: 1,
      ),
    ),
  ),
  useMaterial3: true,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: themeColor),
  primaryColor: themeColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    foregroundColor: Colors.black,
    titleTextStyle: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black87,
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.arrow_back_ios).paddingOnly(left: 10),
      ],
    ),
  ),
  textTheme: GoogleFonts.dmSansTextTheme(
    Get.textTheme.copyWith(
      bodyMedium: const TextStyle(fontSize: 16, color: Colors.black87),
      bodyLarge: const TextStyle(fontSize: 20, color: Colors.black87),
      bodySmall: const TextStyle(color: Colors.black),
      headlineLarge: const TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(themeColor),
      textStyle:
          MaterialStatePropertyAll(GoogleFonts.dmSansTextTheme().bodyMedium),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(themeColor),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.dmSansTextTheme().bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: themeColor,
    labelColor: themeColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      foregroundColor: themeColor,
      side: const BorderSide(
        color: themeColor,
      ),
    ),
  ),
);
