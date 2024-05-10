import 'dart:typed_data';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/dashboard.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/out-of-box/out_of_box_response/book_order.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/tabs/out_of_box_tab.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/dialog.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CodeScannerState extends ChangeNotifier {
  String? _code;

  get code => _code;

  set code(status) {
    _code = status;
    notifyListeners();
  }

  String? transid;

  assign(code, orderId) async {
    dio.Response<dynamic> response =
        await dioService.put('bookorder/user/qrcode-to-assign', data: {
      "qr_code": code,
      "order_id": orderId,
    });
    Map<String, dynamic> res = response.data;
    if (res["success"]) {
      SnackbarHelper.success(res["message"]);
      return true;
    } else {
      SnackbarHelper.error(res["message"]);
      return false;
    }
  }
}

final codeScannerProvider = ChangeNotifierProvider.autoDispose((r) {
  return CodeScannerState();
});

class CodeScanner extends ConsumerStatefulWidget {
  const CodeScanner(this.order, {Key? key}) : super(key: key);
  final BookOrder order;

  @override
  ConsumerState<CodeScanner> createState() => _CodeScannerConsumerState();
}

class _CodeScannerConsumerState extends ConsumerState<CodeScanner> {
  @override
  void dispose() {
    var state = ref.watch(codeScannerProvider);

    state.code = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state2 = ref.watch(outOfBoxTabProvider);

    var state = ref.watch(codeScannerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
      ),
      bottomNavigationBar: FpElevatedButton(
        buttonTitle: 'Submit',
        onPressed: () async {
          try {
            bool success = await state.assign(state.code, widget.order.orderId);
            if (success) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashBoard(
                            initial: 2,
                          )),
                  (Route<dynamic> route) => false);
              Get.dialog(
                Dialog(
                  child: TransactionDialog(
                    id: widget.order.orderNumber!,
                  ),
                ),
              ).then((value) {
                if (value == true) {
                  Get.to(() => Get.back());
                } else {
                  Get.back();
                }
              });
              state2.load();
            }
          } on dio.DioException catch (e) {
            SnackbarHelper.error(e.response?.data['message']);
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.width * 0.06),
              SizedBox(
                width: Get.width,
                height: Get.width,
                child: MobileScanner(
                  controller: MobileScannerController(
                    detectionTimeoutMs: 4000,
                    detectionSpeed: DetectionSpeed.normal,
                    facing: CameraFacing.back,
                    torchEnabled: false,
                  ),
                  fit: BoxFit.cover,
                  onDetect: (capture) async {
                    final List<Barcode> barcodes = capture.barcodes;
                    final Uint8List? image = capture.image;
                    for (final barcode in barcodes) {
                      state.code = barcode.rawValue;
                    }
                  },
                ),
              ),
              if (state.code != null)
                Center(
                  child: Text(
                    'QR Code : ${state.code} \n\nScanned Successfully',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ).paddingAll(Get.width * 0.04),
                ),
              // if (state.code != null) Text('Oder id: ${order.orderId}').paddingAll(Get.width * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
