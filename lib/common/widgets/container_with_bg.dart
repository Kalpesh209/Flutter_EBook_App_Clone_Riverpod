import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ContainerWithBg extends StatelessWidget {
  final Widget child;
  final bool blurred;
  const ContainerWithBg({
    Key? key,
    required this.child,
    this.blurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        /* Positioned(
          right: MediaQuery.of(context).viewInsets.bottom,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          child: Assets.auth.images.cornerLogo
              .image(
                width: Get.width * 0.7,
              )
              .blurred(
                colorOpacity: 0,
                blur: blurred ? 5 : 0,
              ),
        ),*/
        child,
      ],
    );
  }
}
