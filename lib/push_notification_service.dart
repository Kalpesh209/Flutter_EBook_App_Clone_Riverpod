import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:get/get.dart';

class PushNotificationService {
  static const CHANNEL_ID = "FreshPage";
  static const CHANNEL_NAME = "FreshPage App channel";
  static const CHANNEL_DESCRIPTION = "FreshPage App description";

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    CHANNEL_ID, // id
    CHANNEL_NAME, // title
    description: CHANNEL_DESCRIPTION, // description
    importance: Importance.max,
    playSound: true,
  );

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    //  buildContext=context;

    /// This code is executed for IOs platform
    if (Platform.isIOS) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: true,
        sound: true,
      );

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/app_icon"),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: (details) {
        debugPrint('onDidReceiveBackgroundNotificationResponse');
        print(details);
      },
      onDidReceiveNotificationResponse: (details) {
        debugPrint('onDidReceiveNotificationResponse');
        debugPrint(json.encode(details.payload));

        redirectToScreens(details.payload ?? '');
      },
    );

    notificationListeners();
  }

  static Future selectNotification(String payload) async {
    if (payload != '') {
      debugPrint("notification payload: $payload");
      //redirectToScreens(payload);
    }
  }

  static void displayNotification(RemoteMessage remoteMessage) {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.high),
      );

      flutterLocalNotificationsPlugin.show(
          id,
          remoteMessage.notification?.title,
          remoteMessage.notification?.body,
          notificationDetails,
          payload: json.encode(remoteMessage.data));
    } catch (e) {
      debugPrint('e $e');
    }
  }

  static notificationListeners() {
    /// For refresh FCM token
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      debugPrint("FCM_TOKEN==$fcmToken");
    });

    /// For getting FCM token
    FirebaseMessaging.instance.getToken().then((fcmToken) {
      debugPrint("FCM_TOKEN==$fcmToken");
    });

    /// Gives you the message on which user tabs on notification
    /// and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) {
      if (remoteMessage != null) {
        // var route=remoteMessage.data["routes"];
        //  redirectToScreens(json.encode(remoteMessage.data));
      }
    });

    /// This method is called when application is in foreground.
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      debugPrint("TitleF==${remoteMessage.notification?.title}");
      debugPrint("BodyF==${remoteMessage.notification?.body}");
      if (Platform.isAndroid) {
        PushNotificationService.displayNotification(remoteMessage);
      }
    });

    /// This method called when app is in background but opened or in memory and
    /// user tab on notification
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      debugPrint("TitleB==${remoteMessage.notification?.title}");
      debugPrint("BodyB==${remoteMessage.notification?.body}");
      redirectToScreens(json.encode(remoteMessage.data));
    });
  }

  static void redirectToScreens(String payload) {
    debugPrint('redirection payload $payload');
    Map valueMap = jsonDecode(payload);
    debugPrint('payload $valueMap');

    Get.toNamed(notificationScreen);
    // print(valueMap.keys);
    // print(valueMap.values);
  }
}
