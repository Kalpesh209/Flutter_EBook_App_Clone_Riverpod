import 'package:dio/dio.dart';
import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/dio_interceptors/auth_token_interceptor.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final GetIt getIt = GetIt.instance;

setUpSinglestonServices() {
  // String baseUrl = 'https://api.freshpage.in/api/v1/';
  String baseUrl = 'http://64.227.137.175:3004/api/v1/';
  // String baseUrl = 'http://192.168.1.7:3002/api/v1/';// jay static ip
  //String baseUrl = 'https://apidev.freshpage.in/api/v1/';
  String path = '';
  BaseOptions dioOptions = BaseOptions(
    baseUrl: "$baseUrl$path",
    connectTimeout: const Duration(seconds: 30),
    headers: {
      'content': 'application/json',
      'accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    },
  );

  Dio dio = Dio(dioOptions);
  // dio.interceptors.add(PrettyDioLogger());
  dio.interceptors.add(AuthTokenInterceptor());

  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: ["F9F5C5E8F4ED44E5DA0256F30F3234DE"]);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  getIt.registerSingleton(
      const FlutterSecureStorage()); // secure storage service
  getIt.registerSingleton<Dio>(dio); //  dio
  getIt.registerSingleton<AuthService>(AuthService()); //  dio
  getIt.registerSingleton<MobileAds>(MobileAds.instance); //  dio //
}

// define global services
Dio dioService = getIt.get<Dio>();
FlutterSecureStorage storageService = getIt.get<FlutterSecureStorage>();
AuthService authService = getIt.get<AuthService>();
IEventBus eventBus = EventBus();
