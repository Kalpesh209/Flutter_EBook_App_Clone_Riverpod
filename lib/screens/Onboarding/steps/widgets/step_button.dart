import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class StepButton extends StatelessWidget {
  final String label;
  final String iconUrl;
  final bool? selected;
  final Function? onSelected;

  const StepButton({
    Key? key,
    required this.label,
    required this.iconUrl,
    this.selected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => onSelected == null ? null : onSelected!(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 105,
          constraints: BoxConstraints(minHeight: Get.height * 0.11),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: selected == true ? paleBg : Colors.grey.shade300),
            color: selected == true ? paleBg : Colors.transparent,
          ),
          //  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
          child: Column(children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            Image.network(iconUrl,
                width: Get.width * 0.08, height: Get.width * 0.08),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                color: selected == true ? themeColor : Colors.black,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
