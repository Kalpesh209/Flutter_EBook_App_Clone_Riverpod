import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_pages.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/theme.dart';
import 'package:flutter_ebook_app_clone_riverpod/no_internet.dart';
import 'package:flutter_ebook_app_clone_riverpod/push_notification_service.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/launch_screen/launch_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// initSocket() {
//   socket = IO.io("https://apidev.hinducafe.in", <String, dynamic>{
//     'autoConnect': false,
//     'transports': ['websocket'],
//   });
//   socket!.connect();
//   socket!.onConnect((_) {
//     debugPrint('Connection established12334');
//   });
//   socket!.onDisconnect((_) => print('Connection Disconnection'));
//   socket!.onConnectError((err) => print(err));
//   socket!.onError((err) => print(err));

//   socket!.on("ff", (data) => {print(data)});

//   socket!.onAny((event, data) {
//     print('SCOKET RESPONSE');
//     print(data);
//     print(event);
//   });
// }

Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await Firebase.initializeApp();

  //debugPrint("Handling a background message: ${remoteMessage.messageId}");
  PushNotificationService.initialize();
  //debugPrint("Title = ${remoteMessage.notification?.title}");
  //debugPrint("Body = ${remoteMessage.notification?.body}");
}

Future<void> main() async {
  // final envConfig = await Environment.dev;
  // mainCommon(envConfig);
  //connectAndListen();
  //connectAndListen();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Mob Add
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  //End

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
      name: 'Freshpage',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  FirebaseMessaging.instance.getToken().then((token) {
    // debugPrint('fcmToken $token');
    fcmToken = token ?? '';
  });

  var initializationSettingsAndroid = const AndroidInitializationSettings(
      'mipmap/ic_launcher'); // <- default icon name is @mipmap/ic_launcher
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await GetStorage.init();
  setUpSinglestonServices();
  // Stripe.publishableKey =
  //     'pk_test_51NTjcGSCWt1zb75M2TKbFFcaidsIES7zhRxRYLJO2hrBykY2rIAz8CgUqeEJi9BPrsZsIFuJSVR6fVSn7sxYF1l000PVTitUDf';
  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  //initSocket();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScreenUtilInit(
      designSize: const Size(412, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderScope(
          child: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timerForInter;

  @override
  void initState() {
    // loadAdEvery10mins();

    prefreshClean();
    super.initState();
  }

  /*loadAdEvery10mins() {
    // print('Timer started');
    _timerForInter = Timer.periodic(const Duration(minutes: 10), (result) {
      Interstitialad ad = Interstitialad();
      ad.loadAd();
      Future.delayed(const Duration(seconds: 5), () {
        ad.showAd();
      });
    });
  }*/

  @override
  void dispose() {
    _timerForInter!.cancel();
    super.dispose();
  }

  final Connectivity _connectivity = Connectivity();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StyledToast(
      locale: const Locale('en', 'US'),
      child: ReactiveFormConfig(
        validationMessages: {
          ValidationMessage.required: (error) => 'Field must not be empty',
          ValidationMessage.email: (error) => 'Must enter a valid email',
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Freshpage',
          // initialRoute: home,
          themeMode: ThemeMode.system,
          theme: appTheme,
          builder: EasyLoading.init(
            builder: (context, widget) {
              final MediaQueryData data = MediaQuery.of(context);
              return StreamBuilder<ConnectivityResult>(
                  stream: _connectivity.onConnectivityChanged,
                  builder: (context, snapshot) {
                    final connectivityResult = snapshot.data;
                    if (connectivityResult == ConnectivityResult.none ||
                        connectivityResult == null) {
                      return const NoInternetScreen();
                    }
                    return MediaQuery(
                      data: data.copyWith(
                        size: size,
                        textScaleFactor: size.width * 0.0025,
                      ),
                      child: widget ?? const Text('failed'),
                    );
                  });
            },
          ),
          home: const LaunchScreen(),
          getPages: listOfPages,
          // transitionDuration:const Duration(milliseconds: 500)
        ),
      ),
    );
  }

  Future<void> prefreshClean() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      print('Performing cleanup tasks...');
      await storageService.delete(key: 'user');
      await prefs.setBool('isFirstLaunch', false);
    }
  }
}
