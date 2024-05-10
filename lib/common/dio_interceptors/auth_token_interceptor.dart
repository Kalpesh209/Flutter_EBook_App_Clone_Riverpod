import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';

class AuthTokenInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // storageService.delete(key: 'user');
    // return handler.next(options); //continue
    // authService.getToken().then((value) {
    //   if (authService.user != null) {
    //     options = options.copyWith(headers: {
    //       'Authorization': value,
    //       'X-Requested-With': 'XMLHttpRequest',
    //     });
    //   } else {
    //     options = options.copyWith(headers: {
    //       'X-Requested-With': 'XMLHttpRequest',
    //     });
    //   }
    // });

    authService.loadUser();
    if (authService.user != null) {
      options = options.copyWith(headers: {
        'Authorization': '${authService.user?.token}',
        'X-Requested-With': 'XMLHttpRequest',
      });
    } else {
      options = options.copyWith(headers: {
        'X-Requested-With': 'XMLHttpRequest',
      });
    }

    debugPrint(
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint("--> END ${options.method.toUpperCase()}");

    return handler.next(options); //continue
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        "<-- Start error ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    debugPrint(
        "${err.response != null ? err.response?.data : 'Unknown Error'}");
    debugPrint("End error -->");
    return handler.next(err);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}");
    // print("Headers:");
    // response.headers?.forEach((k, v) => print('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("END HTTP -->");
    return handler.next(response);
  }
}
