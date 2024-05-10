import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';

class OrangeTitle extends StatelessWidget {
  final String title;

  const OrangeTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 20, color: themeColor, fontWeight: FontWeight.bold),
    );
  }
}
