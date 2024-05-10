import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';

class InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const InfoBox({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: FPcolors.fpgreyText),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, height: 1.6),
        ),
      ],
    );
  }
}
