import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3631438264285938~7404666231';//'ca-app-pub-4271697679357182~8328921318';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3631438264285938~7404666231';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  /*static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
*/
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3631438264285938/1717336304";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4271697679357182/9793888099";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitIdForMyRewards {
    if (Platform.isAndroid) {
      return "ca-app-pub-3631438264285938~7404666231";//"ca-app-pub-4271697679357182~8328921318";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4271697679357182/7673360905";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitIdForYoga {
    if (Platform.isAndroid) {
      return "ca-app-pub-3631438264285938~7404666231";//"ca-app-pub-4271697679357182~8328921318";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3631438264285938~7404666231";//"ca-app-pub-4271697679357182~8328921318";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
