import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/widgets/address_card.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/widgets/address_widget.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/address_and_details.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as getx;
import 'package:skeletons/skeletons.dart';

import '../../../common/widgets/components.dart';

class Addresses extends ConsumerWidget {
  const Addresses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(addressWidgetProvider);
    return Scaffold(
      // appBar: AppBar(),
      appBar: FpAppBar(title: 'Addresses', backButtonRequired: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'DELIVERY ADDRESS',
              //   style: TextStyle(color: FPcolors.fpgreyText),
              // ),
              SizedBox(height: getx.Get.height * 0.05),
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
                                "address",
                                e,
                                selected: state.selectedAddress?.id == e.id,
                                addressUpdated: () => state.load(),
                                addressDelete: () =>
                                    state.removeFromAddress(e.id),
                                addressChanged: (address) {
                                  state.selectedAddress = address;
                                  //   onAddressSelected(address);
                                  state.rebuild();
                                },
                              ).marginOnly(bottom: getx.Get.height * 0.01))
                          .toList(),
                    ),
              SizedBox(height: getx.Get.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    var value = await getx.Get.to(() => const AddressScreen());
                    if (value != null) state.load();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add Address',
                        style: TextStyle(
                            color: FPcolors.fpPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ).paddingSymmetric(vertical: getx.Get.height * 0.015),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class AddressCard extends StatelessWidget {
//   String title;

//   AddressCard({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15), border: Border.all(color: FPcolors.fptextfieldgrey)),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               child: Expanded(
//                 child: ListTile(
//                   title: Text(
//                     title,
//                     style: FPfonts.dmSans16bold,
//                   ),
//                   subtitle: Text(
//                     "Address nulla lacus, egestas a \naliquet sit amet, pretium at ipsum.\nMobile : 989855555',",
//                     style: TextStyle(color: Colors.black45),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               child: IconButton(
//                   onPressed: () {},
//                   icon: SvgPicture.asset(
//                     Assets.settings.svg.deletebuttonrounded,
//                     height: 40,
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
