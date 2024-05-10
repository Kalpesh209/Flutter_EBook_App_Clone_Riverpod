import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TagWidget extends StatelessWidget {
  final String? tag;
  final Color? textColor;
  final Color? background;
  const TagWidget(
      {Key? key, required this.tag, this.textColor, this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      padding: EdgeInsets.only(
       top: 5,
        bottom: 5,
          left: 5,
        right: 5
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.2),
        color: background ?? Colors.grey.shade200,
      ),
      child: Center(
        child: Text(
          tag ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: textColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
