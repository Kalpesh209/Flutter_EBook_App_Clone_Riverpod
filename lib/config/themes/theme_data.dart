import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/fonts/fonts.dart';

ThemeData themeData() {
  return ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
        // backgroundColor: FPcolors.fpPrimary
        style: ButtonStyle(
            // backgroundColor: MaterialStateProperty<Color>
            )),
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
        )),
    useMaterial3: true,
  );
}
