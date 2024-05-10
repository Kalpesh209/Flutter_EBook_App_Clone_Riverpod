import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:get/get.dart';
import '../../../../dialogs/confirmation_dialog.dart';
import '../models/wallet_redeem_response.dart';
import '../models/wallet_redeem_submit_response.dart';
import '../models/wallet_rewards_response.dart';

class WalletScreenState extends ChangeNotifier {
  WalletRewardsResponse? rewardsResponse = WalletRewardsResponse();
  RewardsData? dataResponse = RewardsData();
  RedeemData? dataRedeem = RedeemData();
  List<Rewards> listOfRewards = [];
  List<RedeemRewards> listOfRedeem = [];

  bool _isLoading = false;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  //Api calling
  void getRewardsData() async {
    debugPrint('Api-getRewardsData');
    loading = true;
    authService.getToken().then((token) async {
      try {
        dio.Response<dynamic> response = await dioService
            .get("rewards",
                options: dio.Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);
        Map<String, dynamic> res = response.data;
        WalletRewardsResponse walletRewardsResponse =
            WalletRewardsResponse.fromJson(res);
        if (walletRewardsResponse.success == true) {
          dataResponse = walletRewardsResponse.data;
          listOfRewards = walletRewardsResponse.data?.rewards ?? [];
        }
      } on dio.DioException catch (e) {
        debugPrint('${e.response!.statusCode}');
      }
    });
  }

  void getRedeemData() async {
    debugPrint('Api-getRedeemData');
    loading = true;
    authService.getToken().then((token) async {
      try {
        dio.Response<dynamic> response = await dioService
            .get("rewards/user/my-rewards?per_page=100&page_number=1",
                options: dio.Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);
        Map<String, dynamic> res = response.data;
        WalletRedeemResponse walletredeemResponse =
            WalletRedeemResponse.fromJson(res);
        if (walletredeemResponse.success == true) {
          dataRedeem = walletredeemResponse.data;
          listOfRedeem = walletredeemResponse.data?.rewards ?? [];
        }
      } on dio.DioException catch (e) {
        debugPrint('${e.response!.statusCode}');
      }
    });
  }

  void getRedeemCode(String rewardId) async {
    debugPrint('Api-getRedeemCode');
    loading = true;
    authService.getToken().then((token) async {
      try {
        dio.Response<dynamic> response = await dioService
            .get("rewards/user?reward_id=$rewardId",
                options: dio.Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);
        Map<String, dynamic> res = response.data;

        WalletRewardsSubmitResponse acceptResponse =
            WalletRewardsSubmitResponse.fromJson(res);
        if (acceptResponse.success ?? false) {
          successDialog('Success', acceptResponse.message ?? '', 'OK', () {
            loading = false;
            Get.back();
            getRewardsData();
          });
        }
      } on dio.DioException catch (e) {
        debugPrint('${e.response!.statusCode}');
      }
    });
  }

//https://apidev.freshpage.in/api/v1/rewards/user?reward_id=272ad87e-92e3-11ee-9b07-5ef71484af77
}

final walletProvider = ChangeNotifierProvider((ref) => WalletScreenState());
