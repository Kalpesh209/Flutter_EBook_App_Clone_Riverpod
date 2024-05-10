import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static error(message) {
    Get.closeAllSnackbars();
    /* Get.showSnackbar(
      GetSnackBar(
        titleText: const Text('Error',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        animationDuration: const Duration(milliseconds: 100),
        messageText: Text(message, style: const TextStyle(color: Colors.white)),
        forwardAnimationCurve: Curves.easeOutCubic,
        reverseAnimationCurve: Curves.easeInCubic,
        duration: const Duration(seconds: 5),
        barBlur: 10,
        backgroundColor: const Color.fromARGB(248, 196, 51, 41),
        isDismissible: true,
      ),
    );*/

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static success(message) {
    Get.closeAllSnackbars();
    /*Get.showSnackbar(
      GetSnackBar(
        animationDuration: const Duration(milliseconds: 100),
        forwardAnimationCurve: Curves.easeOutCubic,
        reverseAnimationCurve: Curves.easeInCubic,
        duration: const Duration(seconds: 3),
        showProgressIndicator: false,
        backgroundColor: Colors.green.shade400,
        titleText: const Text("Success",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );*/
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
