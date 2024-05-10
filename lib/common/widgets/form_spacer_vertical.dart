import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormSpacerVertical extends StatelessWidget {
  final double space;
  const FormSpacerVertical({
    Key? key,
    this.space = 0.03,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * space,
    );
  }
}
