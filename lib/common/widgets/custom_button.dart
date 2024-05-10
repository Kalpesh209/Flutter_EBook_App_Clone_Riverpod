import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color textAndBorderColor;
  final double btnWidth;
  final Function() onButtonClick;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onButtonClick,
      required this.textAndBorderColor,
      required this.btnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      child: ElevatedButton(
        onPressed: onButtonClick,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: textAndBorderColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(48.r),
            ),
          ),
        ),
        child: Container(
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textAndBorderColor,
                fontSize: 14.sp,
                fontFamily: 'Avenir Heavy',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
