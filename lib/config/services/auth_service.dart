import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/login/models/login_response/data.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/login/models/login_response/login_response.dart';

class AuthService {
  Data? user;

  save(LoginResponse res) async {
    user = res.data;

    await storageService.write(key: 'user', value: jsonEncode(res.data));
    globals.token = user?.token;
  }

  logout() async {
    await storageService.delete(key: 'user');
  }

  loadUser() async {
    var userString = await storageService.read(key: 'user');
    debugPrint('userString $userString');
    if (userString == null || userString == '') return;
    try {
      user = Data.fromJson(jsonDecode(userString));
    } catch (e) {
      debugPrint('e $e');
    }
  }

  Future<String> getToken() async {
    var userString = await storageService.read(key: 'user');
    if (userString == null) return '';
    try {
      user = Data.fromJson(jsonDecode(userString));
      return user?.token ?? '';
    } catch (e) {
      debugPrint('e $e');
      return '';
    }
  }
}
