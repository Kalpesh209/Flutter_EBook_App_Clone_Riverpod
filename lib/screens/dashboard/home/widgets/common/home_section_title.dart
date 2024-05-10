import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool showView;
  const HomeSectionTitle(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.showView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(title, style: titleStyle),
          showView
              ? TextButton(
                  onPressed: () => onTap(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                  ),
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
