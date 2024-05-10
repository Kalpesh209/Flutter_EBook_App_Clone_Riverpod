import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? image;
  final Color? titleColor;
  final BoxDecoration? decoration;
  final Function? onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    this.subTitle,
    this.image,
    this.titleColor = themeColor,
    this.decoration,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Get.width * 0.04),
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shadowColor: Colors.grey.shade300.withOpacity(0.4),
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(Get.width * 0.05),
          decoration: decoration ?? const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: titleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    if (subTitle != null)
                      Column(
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          Text(
                            subTitle!,
                            style: const TextStyle(
                                color: themeColor, fontSize: 14),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (image != null)
                Image.asset(
                  image!,
                  width: Get.width * 0.25,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
