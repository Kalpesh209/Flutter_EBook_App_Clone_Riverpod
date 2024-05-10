import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class Interstitialad {
  // late InterstitialAd _interstitialAd;
/*  var adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3631438264285938/6519223306'
      : 'ca-app-pub-3631438264285938/9989950055';*/

  /*var adUnitId = Platform.isAndroid
      ? *//*'ca-app-pub-3631438264285938/1717336304'*//*'ca-app-pub-3631438264285938/9672165172'
      : 'ca-app-pub-9733544482674541/6342767591'*//*'ca-app-pub-9733544482674541/9641888359'*//*;

      
  void loadAd() {
    debugPrint("Ad init");
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint("Inter ad loaded");
          _interstitialAd = ad;
          ad.fullScreenContentCallback =
              FullScreenContentCallback(onAdClicked: (ad) {
            // resetShowAd();
          }, onAdDismissedFullScreenContent: (ad) {
            // resetShowAd();
          });
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
  showAd() {
    _interstitialAd.show();
  }*/
}
