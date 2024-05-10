import 'package:flutter/material.dart';

InputDecoration FpTextFieldDecoration({
  String? hintText,
  Widget? prefixIconData,
}) {
  return InputDecoration(
    hintText: hintText,

    //prefixText: "",
    prefixIcon: prefixIconData,
    isDense: true,
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
  );
}

InputDecoration FpTextFieldDecorationLarge({
  String? hintText,
  Widget? prefixIconData,
}) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    prefixIcon: prefixIconData,
    isDense: true,
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
  );
}
