import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/address_and_details.dart';
import 'package:get/get.dart';

import '../models/address_response/address.dart';

class AddressCardState extends ChangeNotifier {}

final addressCardProvider = ChangeNotifierProvider((r) {
  return AddressCardState();
});

class AddressCard extends ConsumerWidget {
  final String type;
  final bool selected;
  final Address address;
  final Function? addressChanged;
  final Function? addressUpdated;
  final Function? addressDelete;
  const AddressCard(
    this.type,
    this.address, {
    Key? key,
    this.selected = false,
    this.addressChanged,
    this.addressUpdated,
    this.addressDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(addressCardProvider);
    return Material(
      borderRadius: BorderRadius.circular(Get.width * 0.04),
      clipBehavior: Clip.antiAlias,
      color: selected ? const Color(0xffFFE3DC) : Colors.white,
      child: InkWell(
        onTap: () => addressChanged == null ? null : addressChanged!(address),
        child: Container(
          padding: EdgeInsets.all(Get.width * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.04),
            border:
                Border.all(color: selected ? themeColor : FPcolors.greyBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize(address.type.toString()) ?? 'N/A',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      "Address: ${address.address_line_1} ${address.address_line_2} \n${address.address_line_3}, ${address.city}-${address.zipCode}",
                      style:
                          TextStyle(fontSize: 14, color: FPcolors.color6C7072),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      /*  var value =
                    await Get.to(() => {});*/
                      //  if (value != null && addressDelete != null) {
                      addressDelete!();
                      //}
                    },
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: type == 'checkout'
                        ? SizedBox(height: Get.height * 0.01)
                        : SvgPicture.asset(
                            Assets.icons.deleteAddress,
                            height: 32,
                            width: 32,
                          ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var value =
                          await Get.to(() => AddressScreen(address: address));
                      if (value != null && addressUpdated != null) {
                        addressUpdated!();
                      }
                    },
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.editAddress,
                      height: 32,
                      width: 32,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String capitalize(String s) {
    return "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
  }
}
