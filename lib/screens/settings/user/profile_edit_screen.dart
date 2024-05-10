import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/size/size.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/providers/edit_profile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/components.dart';

import '../../../common/widgets/country_dial_picker.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/colors/colors.dart';
import '../../../config/fonts/fonts.dart';
import '../../../config/route/route_names.dart';
import '../../../config/themes/textfield_decorations.dart';
import '../../../gen/assets.gen.dart';
import '../../../update_dialog.dart';
import '../../dashboard/home/home_menu/library/checkout/widgets/address_card.dart';
import 'package:get/get.dart' as getx;
import 'dart:math' as math;

const List<String> list = <String>['home', 'office', 'other'];

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  XFile? _image;
  XFile? imageFile;
  File? imageFilee;
  bool ispicked = false;

  String addressType = "home";

  @override
  void didChangeDependencies() {
    var state = ref.watch(edituserstate);
    WidgetsBinding.instance.addPostFrameCallback((t) {
      state.getContactDetail();
      state.load(addressType);
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance
        .logEvent(name: 'open_edit_screen')
        .then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(edituserstate);
    var state2 = ref.watch(menuState);

    bool backButtonRequired = true;
    var actionBtnWidth = Get.width * 0.06;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* appBar: */ /*FpProfileAppBar(title: '', backButtonRequired: true),*/
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile',
          style: FPfonts.dmSans20Bold.copyWith(
            color: FPcolors.fpPrimary,
          ),
        ),
        leading: backButtonRequired == true
            ? IconButton(
                icon: SvgPicture.asset(
                  Assets.settings.svg.appbarBackbutton,
                  height: 30,
                  width: 30,
                ),
                onPressed: () => {
                  Get.offAndToNamed(dashboard)
                } /*Navigator.of(context).pop()*/,
              )
            : const SizedBox(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Stack(
          children: [
            state.loading ? loadingCenter() : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          !ispicked
                              ? SizedBox(
                                  child: state.profileimage == null ||
                                          state.profileimage == "empty"
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: FPcolors.colorC9C9C9,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          height: 235,
                                          width: 200,
                                          child: const Icon(
                                            Icons.person,
                                            size: 45,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: FPcolors.colorC9C9C9,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.network(
                                              state.profileimage!,
                                              height: 235,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)),
                                  height: 235,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.file(
                                      imageFilee!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 20.h,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: FPcolors.lightOrange,
                              side: BorderSide(
                                color: FPcolors.lightOrange,
                                style: BorderStyle.solid,
                              ),
                            ),
                            onPressed: () async {
                              //_openGallery();
                              _showImageSourceDialog();
                            },
                            child: Text('Change',
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.bold,
                                    color: FPcolors.fpPrimary,
                                    fontSize: 16)),
                          )
                          /*  FpElevatedButtonLight(
                                  onPressed: () {
                                    _openGallery();
                                  },
                                  buttonTitle: 'Change'),*/
                        ],
                      ),
                      defaultSpacer,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 170.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: state.firstname,
                                    // initialValue: state2.firstname,
                                    decoration: FpTextFieldDecoration(
                                      hintText: 'First Name',
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                              width: 170.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFormField(
                                      controller: state.lastname,
                                      // initialValue: state2.lastname,
                                      decoration: FpTextFieldDecoration(
                                        hintText: 'Last Name',
                                      )),
                                ],
                              )),
                        ],
                      ),
                      defaultSpacer,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                readOnly: false,
                                controller: state.email,
                                // initialValue: state2.email,
                                decoration: FpTextFieldDecoration(
                                  hintText: 'Email',
                                )),
                          ),
                        ],
                      ),
                      defaultSpacer,
                      Stack(
                        children: [
                          SizedBox(
                            width: 360.w,
                            child: TextFormField(
                              style: TextStyle(color: FPcolors.colorD9D9D9),
                              readOnly: true,
                              controller: state.phoneNumber,
                              // initialValue: state2.mobileNumber,
                              decoration:
                                  AppStyles.inputDecorationforEmail.copyWith(
                                hintText: 'Mobile Number',
                                contentPadding: const EdgeInsets.only(
                                  left: 100,
                                  top: 16,
                                  bottom: 16,
                                  right: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60.h,
                            child: IgnorePointer(
                              ignoring: true,
                              child: CountryCodePicker(
                                enabled: false,
                                initialSelection: "in",
                                onChanged: (d) => {
                                  debugPrint("get number ${d.dialCode}"),
                                  // state.countyCode = d.dialCode
                                },
                                builder: (p0) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 16),
                                    Image.asset(
                                      p0?.flagUri?.toString() ?? '',
                                      package: 'country_code_picker',
                                      width: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      p0?.dialCode?.toString() ?? '',
                                      style: TextStyle(
                                          color: FPcolors.colorD9D9D9),
                                    ),
                                    const SizedBox(width: 2),
                                    Transform.rotate(
                                      angle: 90 * math.pi / 180,
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: FPcolors.colorD9D9D9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      defaultSpacer,
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownMenu<String>(
                              width: 360.w,
                              menuHeight: 200,
                              initialSelection: list.first,
                              onSelected: (String? value) {
                                setState(() {
                                  addressType = value.toString();
                                  state.load(value);
                                });
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      defaultSpacer,
                      Column(
                        children: state.addresses
                            .map((e) => AddressCard(
                                  "address",
                                  e,
                                  selected: state.selectedAddress?.id == e.id,
                                  addressUpdated: () => state.load(addressType),
                                  addressDelete: () => state.removeFromAddress(
                                      e.id, addressType),
                                  addressChanged: (address) {
                                    state.selectedAddress = address;
                                    //   onAddressSelected(address);
                                    state.rebuild();
                                  },
                                ).marginOnly(bottom: getx.Get.height * 0.01))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: FpElevatedButton(
                buttonTitle: 'Save Changes',
                onPressed: () async {
                  await state.postEditUserData(state2);
                  // state2.getContactDetail();
                  // Navigator.pop(context);
                },
              ),
            ),
            /*   SizedBox(
              width: double.maxFinite,
              child: FpElevatedButton(
                buttonTitle: 'Delete Account',
                onPressed: () {
                  state.deleteUser();
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    var state = ref.watch(edituserstate);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeletDialog(
            applink: '',
            originalStoreVersion: '',
            deactiviteUser: () => state.deactiviteUser(),
            addressChanged: () => state.deleteUser());
      },
    );
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    var state = ref.watch(edituserstate);
    imageFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (imageFile != null) {
        _image = imageFile;
      } else {
        debugPrint('No image selected.');
      }
    });

    state.image = _image;

    imageFilee = File(_image!.path);
    setState(() {
      ispicked = true;
    });
  }

  _openGallery() async {
    var state = ref.watch(edituserstate);
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imageFile;
    });
    state.image = _image;

    imageFilee = File(_image!.path);
    setState(() {
      ispicked = true;
    });
  }
}
