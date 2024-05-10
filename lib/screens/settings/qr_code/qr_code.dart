import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/book_condition/book_condition.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/qr_code_scanned_response.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// STEP1:  Stream setup
class StreamSocket {
  final _socketResponse = StreamController<String>.broadcast();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();

class QrCodeState extends ChangeNotifier {}

final qrCodeProvider = ChangeNotifierProvider((r) {
  return QrCodeState();
});
IO.Socket? socket;

void connectAndListen() {
  socket = IO.io("https://api.hinducafe.in", {
    'autoConnect': true,
    'transports': ['websocket'],
  });

  socket!.onConnect((_) {
    debugPrint('socket connect');
  });

  socket!.onDisconnect((_) {
    debugPrint('disconnect');
  });
}

class QrCode extends ConsumerStatefulWidget {
  const QrCode({super.key});

  @override
  ConsumerState<QrCode> createState() => _QrCodeConsumerState();
}

class _QrCodeConsumerState extends ConsumerState<QrCode> {
  Timer? timer;

  @override
  void initState() {
    // authService.loadUser();
    //   print(AuthService().user!.verificationCode);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    connectAndListen();
    startTimer(authService.user?.verificationCode);
    //  print();
    super.didChangeDependencies();
  }

  void startTimer(String? verificationCode) {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      debugPrint('verificationCode $verificationCode');
      //myFunction(verificationCode);
      checkQrScanned(verificationCode);
    });
  }

  String id = '';

  void myFunction(String? verifi) {
    // Your function code goes here
    socket!.on(verifi ?? "", (data) {
      print(data);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (a) => BookCondition(bookId: data['book_id'])));
      // id = data["book_id"];
      return streamSocket.addResponse;
    });
  }

  @override
  void dispose() {
    debugPrint('dispose');
    streamSocket.dispose();
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var state2 = ref.watch(menustate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive'),
        centerTitle: true,
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(Get.width * 0.04),
      //   child: FilledButton(
      //     onPressed: () => Get.to(CodeScanner()),
      //     style: FilledButton.styleFrom(
      //       backgroundColor: Color(0xffFFE3DC),
      //       foregroundColor: themeColor,
      //     ),
      //     child: const Text('Open Code Scanner'),
      //   ),
      // ),
      body: StreamBuilder(
        stream: streamSocket.getResponse,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          debugPrint(snapshot.data);
          if (snapshot.hasData) {
            //return BookCondition(bookId: id);
          }

          return Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    authService.user?.firstName ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      // socket!.emit("1", "1");
                    },
                    child: QrImageView(
                      data: authService.user?.verificationCode ?? '',
                      // embeddedImage:
                      //     const AssetImage('assets/icons/Logo.png'),
                      version: QrVersions.auto,
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.circle,
                        color: Colors.black,
                      ),
                      size: Get.width * 0.6,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.black,
                      ),
                      gapless: false,
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(50, 50),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    'Your Profile Code to complete Transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: FPcolors.color2F2F2F),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> checkQrScanned(String? verificationCode) async {
    debugPrint('checkQrScanned');
    try {
      dio.Response<dynamic> response = await dioService.put(
          'bookorder/user/get-confirm-order-status',
          data: {'qr_code': verificationCode},
          options: dio.Options(headers: {"Authorization": token}));
      QRCodeScannedResponse qrCodeScannedResponse =
          QRCodeScannedResponse.fromJson(response.data);
      if (qrCodeScannedResponse.data?.bookId != null &&
          qrCodeScannedResponse.data?.bookId != '') {
        Get.to(() => BookCondition(qrCodeScannedResponse.data));
      }
    } catch (e) {
      debugPrint('e $e');
    }
  }
}
