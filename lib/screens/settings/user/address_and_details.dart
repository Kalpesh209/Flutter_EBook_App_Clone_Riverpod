import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/country_dial_picker.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/themes/textfield_decorations.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/providers/add_address_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../dashboard/home/home_menu/library/checkout/models/address_response/address.dart';

const List<String> list = <String>['home', 'office', 'other'];

class AddressScreen extends ConsumerWidget {
  final Address? address;

  const AddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(addAddressFormProvider(address));
    var isVisble = true;
    var addressValue = "home";
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.background.bgBottom.keyName))),
      child: Scaffold(
        backgroundColor: FPcolors.colorWhite,
        appBar: FpAppBar(title: 'Address & Details', backButtonRequired: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ReactiveForm(
              formGroup: state.form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultSpacerHorizontalLarge,
                  DropdownMenu<String>(
                    width: 360.w,
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      addressValue = value.toString();
                      // state.addresstype(value.toString());
                      debugPrint("Address type $value");
                      state.addresstype = value.toString();
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),

                  /*ReactiveTextField(
                    formControlName: 'type',
                    decoration:
                        FpTextFieldDecoration(hintText: 'Address type(office,home,other)').copyWith(
                      suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ),*/
                  defaultSpacer,
                  ReactiveTextField(
                    formControlName: 'address_line_1',
                    decoration:
                        FpTextFieldDecoration(hintText: 'Address Line 1'),
                  ),
                  defaultSpacer,
                  ReactiveTextField(
                    formControlName: 'address_line_2',
                    decoration:
                        FpTextFieldDecoration(hintText: 'Address Line 2'),
                  ),
                  defaultSpacer,
                  ReactiveTextField(
                    formControlName: 'address_line_3',
                    decoration:
                        FpTextFieldDecoration(hintText: 'Address Line 3'),
                  ),
                  defaultSpacer,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'city',
                          decoration: FpTextFieldDecoration(hintText: 'City'),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.04),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'zip_code',
                          decoration: FpTextFieldDecoration(
                              hintText: 'Zip/Postal Code'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  defaultSpacer,
                  ReactiveTextField(
                    formControlName: 'landmark',
                    decoration: FpTextFieldDecoration(hintText: 'Land Mark : '),
                  ),
                  /* defaultSpacer,
                  ReactiveTextField(
                    formControlName: 'mobile_number',
                    decoration: FpTextFieldDecoration(
                      prefixIconData: CountryDial(
                        onChanged: () {},
                      ),
                      hintText: 'Mobile number',
                    ),
                  ),*/

                  defaultSpacer,
                  /*if (state.currentLocation != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lat: ${state.form.control('latitude').value}'),
                            Text('Lng: ${state.form.control('longitude').value}'),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.02),
                      ],
                    ),*/
                  /*FpOutlinedButton(
                    onPressed: () async {
                      Position position = await state.getCurrentPosition();
                      state.form.patchValue({
                        "latitude": position.latitude,
                        "longitude": position.longitude,
                      });
                      state.notifyListeners();
                    },
                    buttonTitle: state.gettingLocation
                        ? 'Fetching location...'
                        : 'Use Current Location',
                    icon: Assets.settings.svg.locationFinderIcon,
                  )*/
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: FpElevatedButton(
          onPressed: () async {
            Position position = await state.getCurrentPosition();
            state.form.patchValue({
              "latitude": position.latitude,
              "longitude": position.longitude,
            });
            state.notifyListeners();

            if (state.currentLocation == null) {
              SnackbarHelper.error("Please select your location");
            }
            try {
              await state.save();
              Get.back(result: true);
            } on DioException catch (e) {
              SnackbarHelper.error(e.response?.data['message']);
            }
          },
          buttonTitle: state.loading ? 'Please Wait...' : 'Save',
        ),
      ),
    );
  }
}
