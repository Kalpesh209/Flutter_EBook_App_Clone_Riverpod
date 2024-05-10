import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/exceptions/invalid_form.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/qr_code_scanned_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/thank_you_book_received.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/services/setup_singleton_services.dart';

class BookComplaintState extends ChangeNotifier {
  bool _isGood = true;

  get isGood => _isGood;

  set isGood(status) {
    _isGood = status;
    notifyListeners();
  }

  XFile? _image;
  XFile? imageFile;
  File? imageFilee;
  bool ispicked = false;
  String? imageurl;

  openGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    imageFilee = File(imageFile!.path);
    ispicked = true;
    postImageUrl();
    notifyListeners();
  }

  submit(bookId) async {
    complaintForm.patchValue({'image': imageurl});
    if (complaintForm.invalid) {
      complaintForm.markAllAsTouched();
      throw InvalidFormException();
    }
    //dio.Response<dynamic> response =
    await dioService.put('bookorder/user/complaint/$bookId',
        data: complaintForm.value);
  }

  postImageUrl() async {
    EasyLoading.show(status: 'Uploading Image');
    // populate devide info
    final file = await dio.MultipartFile.fromFile(
      imageFile!.path,
      filename: imageFile!.name,
    );

    final body = dio.FormData.fromMap({"file": file});
    dio.Response<dynamic> response = await dioService
        .post(
          '/general/auth/file-and-image-upload',
          data: body,
        )
        .whenComplete(() => EasyLoading.dismiss());
    Map<String, dynamic> res = response.data;
    imageurl = res["display_url"];
    notifyListeners();
  }

  FormGroup complaintForm = FormGroup({
    'remark': FormControl(validators: [Validators.required]),
    'image': FormControl(validators: [Validators.required]),
  });
}

final bookComplaintProvider = ChangeNotifierProvider.autoDispose((r) {
  return BookComplaintState();
});

class BookComplaint extends ConsumerWidget {
  final QRCodeScannedData? scannedData;

  const BookComplaint(this.scannedData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(bookComplaintProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Complaint'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: () async {
                try {
                  await state.submit('BOOK ID FORM SOCKET');
                  Get.offAll(() => ThanksBookReceived(scannedData));
                } on dio.DioException catch (e) {
                  SnackbarHelper.error(e.response?.data['message']);
                } on InvalidFormException catch (e) {
                  SnackbarHelper.error(e.message);
                }
              },
              child: const Text('SUBMIT')),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    state.ispicked == true
                        ? ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.08),
                            child: Image.file(
                              state.imageFilee!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : InkWell(
                            onTap: () => state.openGallery(),
                            child: Container(
                              padding: EdgeInsets.all(Get.width * 0.08),
                              decoration: BoxDecoration(
                                color: FPcolors.fpPrimaryLight1,
                                borderRadius:
                                    BorderRadius.circular(Get.width * 0.04),
                              ),
                              width: double.infinity,
                              height: Get.height * 0.3,
                              child: const Icon(Icons.add_a_photo),
                            ),
                          ),
                    if (state.ispicked)
                      TextButton(
                        onPressed: () {
                          state.ispicked = false;
                          state.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.all(Get.width * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(Icons.close),
                        ),
                      )
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
                ReactiveForm(
                  formGroup: state.complaintForm,
                  child: Column(
                    children: [
                      ReactiveTextField(
                        formControlName: 'remark',
                        minLines: 5,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: 'Complaint',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
