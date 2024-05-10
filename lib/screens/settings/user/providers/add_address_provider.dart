import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/models/address_response/address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';

class AddAddressFormState extends ChangeNotifier {
  final Address? address;
  bool _gettingLocation = false;
  bool _loading = false;

  String _addressType = "home";

  get loading => _loading;
  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  get addresstype => _addressType;

  set addresstype(status) {
    _addressType = status;
    addressType = status;
    notifyListeners();
  }

  AddAddressFormState(this.address);
  get gettingLocation => _gettingLocation;
  set gettingLocation(status) {
    _gettingLocation = status;
    notifyListeners();
  }

  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  Position? currentLocation;
  FormGroup form = FormGroup({
    "zip_code": FormControl<int>(validators: [Validators.required]),
    // "type":FormControl(validators: [Validators.required]),
    "type": FormControl(value: addressType),
    "city": FormControl(validators: [Validators.required]),
    "address_line_1": FormControl(validators: [Validators.required]),
    "address_line_2": FormControl(validators: [Validators.required]),
    "address_line_3": FormControl(validators: [Validators.required]),
    //"address": FormControl(validators: [Validators.required]),
    //"mobile_number": FormControl(validators: [Validators.required]),
    "longitude": FormControl(validators: [Validators.required]),
    "latitude": FormControl(validators: [Validators.required]),
    "landmark": FormControl(validators: [Validators.required])
  });

  save() async {
    if (form.invalid) {
      form.markAllAsTouched();
      throw InvalidFormException();
    }

    form.patchValue({
      'type': addressType,
      'longitude': currentLocation!.longitude.toString(),
      'latitude': currentLocation!.latitude.toString(),
    });

    debugPrint("Address type ${form.value}");

    loading = true;
    if (address != null) {
      //Response<dynamic> response =
      await dioService
          .put('address/user/edit-address/${address!.id}', data: form.value)
          .whenComplete(() => loading = false);
      //Map<String, dynamic> res = response.data;
    } else {
      //Response<dynamic> response =
      await dioService
          .post('address/user/add-address', data: form.value)
          .whenComplete(() => loading = false);
      //Map<String, dynamic> res = response.data;
    }
  }

  getCurrentPosition() async {
    bool serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    final hasPermission = await _handlePermission();

    if (!serviceEnabled) {
      SnackbarHelper.error("Location Permission Denied");
      return;
    }
    if (!hasPermission) {
      SnackbarHelper.error("Location Permission Denied");
      return;
    }
    gettingLocation = true;
    currentLocation = await geolocatorPlatform
        .getCurrentPosition()
        .whenComplete(() => gettingLocation = false);
    return currentLocation;
  }

  Future<bool> _handlePermission() async {
    LocationPermission permission;

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}

final addAddressFormProvider =
    ChangeNotifierProvider.family.autoDispose((r, Address? address) {
  var state = AddAddressFormState(address);
  if (address != null) {
    state.currentLocation = Position(
      longitude: double.parse(address.longitude!),
      latitude: double.parse(address.latitude!),
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
    state.form.patchValue(address.toJson());
  }
  return state;
});
