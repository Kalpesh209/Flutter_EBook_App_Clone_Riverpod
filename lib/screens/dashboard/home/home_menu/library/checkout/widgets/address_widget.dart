import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/models/address_response/address_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/widgets/address_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/address_and_details.dart';
import 'package:get/get.dart' as getx;

import 'package:skeletons/skeletons.dart';

import '../../../../../../../common/helpers/snakbar_helper.dart';
import '../../../../../../../dialogs/confirmation_dialog.dart';
import '../models/address_response/address.dart';

class AddressWidgetState extends ChangeNotifier {
  Address? selectedAddress;
  bool _loading = false;
  get loading => _loading;
  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<Address> addresses = [];
  load() async {
    addresses = [];
    notifyListeners();
    loading = true;
    Response<dynamic> response = await dioService
        .get('address/user/get-address-list')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    AddressResponse addressResponse = AddressResponse.fromJson(res);
    addresses = addressResponse.data!.address ?? [];

    notifyListeners();
  }

  removeFromAddress(String? id) async {
    loading = true;
    //dio.Response<dynamic> response =

    Response<dynamic> response = await dioService.delete(
      'address/user/delete-address/${id.toString()}',
      data: {'book_id': id},
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success("Address Delete Successfully");
    } else {
      SnackbarHelper.error("Try Again");
    }
    load();
  }

/*  deleteUser() async {
    // populate devide info
    var confirm = await confirmationDialog(
        'Delete Address', 'Are you sure you want to delete this address?');
    if (confirm != true) return;

    loading = true;
    Response<dynamic> response = await dioService
        .delete('address/user/delete-address/',
        options: Options(headers: {
          "Authorization": globals.token,
        }))
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success("Account Deleted");
      getx.Get.offAndToNamed(login);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }*/

  void rebuild() {
    notifyListeners();
  }
}

final addressWidgetProvider = ChangeNotifierProvider.autoDispose((r) {
  return AddressWidgetState()..load();
});

class AddressWidget extends ConsumerWidget {
  final Function onAddressSelected;
  const AddressWidget({
    Key? key,
    required this.onAddressSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(addressWidgetProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DELIVERY ADDRESS',
          style: TextStyle(
              color: FPcolors.color939393,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              fontFamily: 'DM Sans'),
        ),
        SizedBox(height: getx.Get.height * 0.02),
        state.loading
            ? Column(
                children: [
                  SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          height: 80,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10))),
                  SizedBox(height: getx.Get.height * 0.02),
                  SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          height: 80,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10))),
                ],
              )
            : Column(
                children: state.addresses
                    .map((e) => AddressCard(
                          "checkout",
                          e,
                          selected: state.selectedAddress?.id == e.id,
                          addressUpdated: () => state.load(),
                          addressChanged: (address) {
                            state.selectedAddress = address;
                            onAddressSelected(address);
                            state.rebuild();
                          },
                        ).marginOnly(bottom: getx.Get.height * 0.01))
                    .toList(),
              ),
        SizedBox(height: getx.Get.height * 0.02),
        state.addresses.isEmpty
            ? SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    var value = await getx.Get.to(() => const AddressScreen());
                    if (value != null) state.load();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.add), Text('Add Address')],
                  ).paddingSymmetric(vertical: getx.Get.height * 0.015),
                ),
              )
            : SizedBox(height: getx.Get.height * 0.02),
        /*SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () async {
              var value = await getx.Get.to(() => const AddressScreen());
              if (value != null) state.load();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.add), Text('Add Address')],
            ).paddingSymmetric(vertical: getx.Get.height * 0.015),
          ),
        )*/
      ],
    );
  }
}
