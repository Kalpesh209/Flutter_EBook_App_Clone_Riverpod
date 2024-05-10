

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../config/route/route_names.dart';
import '../../../gen/assets.gen.dart';

class LoginRegisterScreenState extends ChangeNotifier {
  List<Map<String, dynamic>> screenItems = [
    {
      'index': 0,
      'image': Assets.images.imgGuide1.keyName,
      'heading': 'Welcome to\nFreshPage',
      'sub_heading':
      '"Freshpage: Explore, Connect, Share - Your Modern Reading Revolution."',
    },
    {
      'index': 1,
      'image': Assets.images.imgGuide2.keyName,
      'heading': '"Unlock the magic of reading together!',
      'sub_heading':
      'Join our book-sharing community, upload your collection, and experience the joy of renting and sharing books with neighbors. "',
    },
    {
      'index': 2,
      'image': Assets.images.imgGuide3.keyName,
      'heading': '" Rent books, share your favorites, ',
      'sub_heading':
      'and unlock exclusive subscription perks that strengthen our growing book-loving community."',
    },
    {
      'index': 3,
      'image': Assets.images.imgGuide4.keyName,
      'heading': '“Join our community of book enthusiasts!',
      'sub_heading':
      'Rent compelling reads, share your literary treasures, and experience the added perks of a subscription that brings readers together in a shared love for books.”',
    },
    {
      'index': 4,
      'image': Assets.images.imgGuide5.keyName,
      'heading': 'Let’s get Started!',
      'sub_heading':
      'Embark on a literary journey filled with books, vibrant communities and perks of renting and sharing experiences!”',
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currentPage = 0;

  onPageChanged(int index, CarouselPageChangedReason reason) {
    currentPage = index;
    notifyListeners();
  }

  onSkip() {
    currentPage = 4;
    carouselController.animateToPage(currentPage);
    notifyListeners();
  }

  void onCreateAccount() {
    Get.offAllNamed(register);
  }

  onLogIn() {
    Get.offAllNamed(login);
  }
}

final loginRegisterScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  return LoginRegisterScreenState();
});