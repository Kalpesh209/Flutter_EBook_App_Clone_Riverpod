import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:get/get.dart';

class LibraryDialog extends StatelessWidget {
  const LibraryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 2.0,
      child: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Beta Version",
            style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          Text(
            "Library at door steps services available to Nikol, Naroda, Bapungar, Khodiyarnagar & Virat Nagar Areas only",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .primaryTextTheme
                .titleMedium
                ?.copyWith(color: Colors.black, fontSize: 18),
          ).marginSymmetric(vertical: 24.h),
          SizedBox(
            height: 52.h,
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: themeColor),
              onPressed: () async {
                Get.back();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: FPcolors.colorWhite,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
