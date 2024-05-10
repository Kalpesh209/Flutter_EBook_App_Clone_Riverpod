import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'common_model/reward_save_model.dart';
import 'config/services/setup_singleton_services.dart';


bool _isLoading = false;
get loading => _isLoading;

set loading(status) {
  _isLoading = status;

}

//Dynamic Link
FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

shareBook(String shareText, String imageUrl) async {
  final url = Uri.parse(imageUrl);
  final response = await http.get(url);
  final Directory temp = await getTemporaryDirectory();
  final File imageFile = File('${temp.path}/tempImage.jpeg');
  imageFile.writeAsBytesSync(response.bodyBytes);
  Share.shareXFiles(
    [XFile('${temp.path}/tempImage.jpeg')],
    text: shareText,
  );
}

Future<String> createDynamicLink(String shareUrl) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://www.freshpage.in/app/$shareUrl"),
    uriPrefix: "https://freshpage.page.link/jpxa"/*"https://redirectfp.page.link"*/,
    androidParameters: const AndroidParameters(packageName: "in.freshpage.android"),
    iosParameters: const IOSParameters(
      bundleId: "com.freshpage.application",
      appStoreId: "6451068809",
      minimumVersion: "1.0.1",
    ),
    // iosParameters: const IOSParameters(bundleId: "com.freshpage.application"),
  );
  final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
  print("Dyna link:-  ${dynamicLink.shortUrl}");
  print("warnings:-  ${dynamicLink.warnings}");
  return dynamicLink.shortUrl.toString();
}

String timeAgo(String? fromDate, {bool numericDates = true}) {
  if (fromDate != null) {
    try {
      debugPrint('fromDate : $fromDate');
      DateTime date1 = DateFormat("dd/MM/yyyy hh:mm").parse(fromDate);
      //final date1 = DateTime.parse(fromDate);
      final date2 = DateTime.now();
      final difference = date2.difference(date1);

      if ((difference.inDays / 7).floor() >= 1) {
        return (numericDates) ? '1 week ago' : 'Last week';
      } else if (difference.inDays >= 2) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays >= 1) {
        return (numericDates) ? '1 day ago' : 'Yesterday';
      } else if (difference.inHours >= 2) {
        return '${difference.inHours} hours ago';
      } else if (difference.inHours >= 1) {
        return (numericDates) ? '1 hour ago' : 'An hour ago';
      } else if (difference.inMinutes >= 2) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inMinutes >= 1) {
        return (numericDates) ? '1 minute ago' : 'A minute ago';
      } else if (difference.inSeconds >= 3) {
        return '${difference.inSeconds} seconds ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      debugPrint('Exception in Utility $e');
      return '';
    }
  } else {
    return '';
  }
}

String dateConvert(String? fromDate, {bool numericDates = true}) {

  if (fromDate != null) {
    try {
      debugPrint('fromDate : $fromDate');
      DateTime date1 = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz").parse(fromDate);
      return date1.toString();

    } catch (e) {
      debugPrint('Exception in Utility $e');
      return '';
    }
  } else {
    return '';
  }
}

String timeDifferent(String? fromDate, {bool numericDates = true}) {
  if (fromDate != null) {
    try {
      debugPrint('fromDate : $fromDate');
      DateTime date1 = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz").parse(fromDate);
      final date2 = DateTime.now();
      final difference = date1.difference(date2);
      return difference.inDays.toString();
    } catch (e) {
      debugPrint('Exception in Utility $e');
      return '';
    }
  } else {
    return '';
  }
}

String getFormattedDate(String date) {
  debugPrint(date);
  if (date != "") {
    /// Convert into local date format.
    final dateTime = DateTime.parse(date).toLocal();
    final format =
    DateFormat('MMM d, ' 'yyyy'); //DateFormat('dd-MM-yyyy hh:mm a');
    final clockString = format.format(dateTime);
    return clockString.toString();
  } else {
    return "No Date";
  }
}

//Add mob

RewardedAd? rewardedAd;

void loadRewardedAd(String unitId) {
  RewardedAd.load(
    adUnitId: unitId,//AdHelper.rewardedAdUnitIdForMyRewards,
    request: const AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (ad) {
        ad.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
          //  setState(() {
              ad.dispose();
              rewardedAd = null;
           // });
            loadRewardedAd(unitId);
          },
        );
       // setState(() {
          rewardedAd = ad;
      //  });
      },
      onAdFailedToLoad: (err) {
        print('Failed to load a rewarded ad: ${err.message}');
      },
    ),
  );
}
void showAdmob(){
  rewardedAd?.show(onUserEarnedReward:
      (AdWithoutView ad, RewardItem rewardItem) {
    // ignore: avoid_print
       print('Yoga Reward amount: ${rewardItem.amount}');
       onMySaveRewards(rewardItem.amount.toString());

  });
}

Future<void> onMySaveRewards(
    String rewardsPoint) async {
  try {
    loading = true;
    var body = {
      'point': rewardsPoint
    };
   /* var response = await dioService.post(
      "rewards/sync/save",
      queryParameters: {
        'point': rewardsPoint,
      },
      options: Options(headers: {"Authorization": token}),
    );*/
    var response = await dioService.post('rewards/sync/save', data: body);
    Map<String, dynamic> res = response.data;
    RewardSaveResponse rewarzsResponse =
    RewardSaveResponse.fromJson(res);
    print(rewarzsResponse);
    loading = false;
    if (rewarzsResponse.success ?? false) {
      loading = false;
    } else {
      loading = false;
    }

  } catch (e) {
    debugPrint('e $e');
  }
}