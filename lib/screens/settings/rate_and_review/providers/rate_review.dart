import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../config/route/route_names.dart';
import '../rate_and_review_two.dart';

class RateState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  double rate = 5.0;
  TextEditingController _feedbackcontroller = TextEditingController(text: "");

  get feedcon => _feedbackcontroller;

  set subcont(status) {
    _feedbackcontroller = feedcon;

    notifyListeners();
  }

  postRate() async {
    // populate devide info

    loading = true;
    //Response<dynamic> response =
    await dioService
        .post('/rateandreview/user/add-rate-and-review',
            data: {
              "rate": rate,
              "feedback": _feedbackcontroller.text,
            },
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() {
      SnackbarHelper.success('Rate & Review Add Successfully');
      Future.delayed(const Duration(milliseconds: 1500), () {
        //Get.back();
        Get.toNamed(rateandreviewone);

        // const RateAndReviewScreenTwo();
      });
    });
    //Map<String, dynamic> res = response.data;
    notifyListeners();
  }
}

final rateandreview = ChangeNotifierProvider.autoDispose((r) {
  return RateState();
});
