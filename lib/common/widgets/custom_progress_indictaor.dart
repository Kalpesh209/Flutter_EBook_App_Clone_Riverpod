import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    this.backgroundColor,
    this.valueColor,
    this.value,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? valueColor;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        animating: true,
        color: valueColor ?? Colors.blue,
      ),
    );
  }
}
