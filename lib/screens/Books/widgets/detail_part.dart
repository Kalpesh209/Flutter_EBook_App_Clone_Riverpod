import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';

class DetailPartWidget extends StatelessWidget {
  final String label;
  final String value;

  const DetailPartWidget({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: AppStyles.slideSubTitleStyle,
        ),
      ],
    );
  }
}
