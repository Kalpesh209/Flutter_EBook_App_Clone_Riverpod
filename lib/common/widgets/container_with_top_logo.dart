import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ContainerWithTopLogo extends StatelessWidget {
  final Widget child;
  final bool blurred;
  final Color? background;
  final Alignment align;
  const ContainerWithTopLogo({
    Key? key,
    required this.child,
    this.blurred = false,
    this.background = Colors.white,
    this.align = Alignment.topRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Stack(
        alignment: align,
        children: [
          Assets.background.bgTopCorner
              .image(
                width: Get.width * 0.7,
              )
              .blurred(
                colorOpacity: 0,
                blur: blurred ? 5 : 0,
              ),
          child,
        ],
      ),
    );
  }
}
