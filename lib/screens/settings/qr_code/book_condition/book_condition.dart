import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/book_complaint/book_complaint.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/qr_code_scanned_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/thank_you_book_received.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/widgets/statud_btn.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/services/setup_singleton_services.dart';

class BookConditionState extends ChangeNotifier {
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
    //dio.Response<dynamic> response =
    await dioService.put('bookorder/user/book-condition/$bookId', data: {
      'book_condition': isGood ? 'good' : 'bad',
      'image_url': imageurl,
    });
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
}

final bookConditionProvider = ChangeNotifierProvider.autoDispose((r) {
  return BookConditionState();
});

class BookCondition extends ConsumerWidget {
  final QRCodeScannedData? scannedData;
  const BookCondition(this.scannedData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(bookConditionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Condition'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: () async {
                try {
                  await state.submit(scannedData?.bookId);
                  if (state.isGood) {
                    Get.offAll(() => ThanksBookReceived(scannedData));
                  } else {
                    Get.to(() => BookComplaint(scannedData));
                  }
                } on DioException catch (e) {
                  SnackbarHelper.error(e.response?.data['message']);
                }
              },
              child: Text(state.isGood ? 'Submit' : 'Register Complaint')),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
              children: [
                // Stack(
                //   alignment: Alignment.topRight,
                //   children: [
                //     state.ispicked == true
                //         ? ClipRRect(
                //             borderRadius:
                //                 BorderRadius.circular(Get.width * 0.08),
                //             child: Image.file(
                //               state.imageFilee!,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         : InkWell(
                //             onTap: () => state.openGallery(),
                //             child: Container(
                //               padding: EdgeInsets.all(Get.width * 0.08),
                //               decoration: BoxDecoration(
                //                 color: FPcolors.fpPrimaryLight1,
                //                 borderRadius:
                //                     BorderRadius.circular(Get.width * 0.04),
                //               ),
                //               width: double.infinity,
                //               height: Get.height * 0.3,
                //               child: const Icon(Icons.add_a_photo),
                //             ),
                //           ),
                //     if (state.ispicked)
                //       TextButton(
                //         onPressed: () {
                //           state.ispicked = false;
                //           state.notifyListeners();
                //         },
                //         child: Container(
                //           padding: EdgeInsets.all(Get.width * 0.01),
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(100),
                //           ),
                //           child: const Icon(Icons.close),
                //         ),
                //       )
                //   ],
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.08),
                  child: Image.network(
                    scannedData?.bookImage ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: StatuSbutton(
                        label: 'Good',
                        icon: Assets.auth.images.icon11,
                        selected: state.isGood,
                        onSelected: () => state.isGood = true,
                      ),
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Expanded(
                      child: StatuSbutton(
                        label: 'Bad',
                        icon: Assets.auth.images.sadFaceIcon,
                        selected: !state.isGood,
                        onSelected: () => state.isGood = false,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
