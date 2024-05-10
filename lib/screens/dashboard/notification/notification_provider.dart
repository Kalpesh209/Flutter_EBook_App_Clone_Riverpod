import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';

import '../../../common/helpers/snakbar_helper.dart';
import '../../../gen/assets.gen.dart';

class NotificationState extends ChangeNotifier {
  bool _loading = true;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<NotificationData> listOfNotification = [];
  List<NotificationData> selectedBooks = [];

  Future<void> loadNotification() async {
    try {
      debugPrint('getHomePageDetails');
      loading = true;
      Response<dynamic> response =
          await dioService.get('notification/user/notification?page_number=1',
              // queryParameters: {'language': "en"},
              options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      NotificationResponse notificationResponse =
          NotificationResponse.fromJson(res);
      listOfNotification = notificationResponse.data ?? [];
      // listOfNotification =_india;
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  Future<void> onTapNotification(NotificationData notificationData) async {
    debugPrint('onTapNotification');
    try {
      Response<dynamic> response = await dioService.put(
          'notification/user/read/${notificationData.id}',
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      listOfNotification.asMap().forEach((key, value) {
        if (notificationData.id == value.id) {
          value.isRead = true;
        }
      });
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  Future<void> ondeleteNotification(NotificationData notificationData) async {
    debugPrint('onTapNotification');
    try {
      Response<dynamic> response = await dioService.put(
          'notification/user/delete/${notificationData.id}',
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      listOfNotification.asMap().forEach((key, value) {
        if (notificationData.id == value.id) {
          // value.isRead = true;
          listOfNotification.remove(notificationData);
        }
      });
      // notifyListeners();
      // loadNotification();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  addRemoveFromSelect(String? id) {
    for (var book in listOfNotification) {
      if (book.id == id) {
        book.isRead = !(book.isRead ?? false);
      }

      if (book.isRead == true && !selectedBooks.contains(book)) {
        selectedBooks.add(book);
      }
    }
    notifyListeners();
  }

/*  notificationRead(String? id,String type) async {
    loading = true;
    //dio.Response<dynamic> response =


    Response<dynamic> response = await dioService.delete(
      'address/user/delete-address/${id.toString()}',
      data: {'book_id': id},
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success(res["success"]);
    } else {
      SnackbarHelper.error("Try Again");
    }
    loadNotification();
  }*/

  List<Map<String, dynamic>> screenItems = [
    {
      'index': 0,
      'image': Assets.icons.maths.path,
      'heading': 'Maths',
    },
    {
      'index': 1,
      'image': Assets.icons.business.path,
      'heading': 'Business',
    },
    {
      'index': 2,
      'image': Assets.icons.regional.path,
      'heading': 'Regional',
    },
    {
      'index': 3,
      'image': Assets.icons.iconyoga.path,
      'heading': 'Yoga',
    },
    {
      'index': 4,
      'image': Assets.icons.history.path,
      'heading': 'History',
    },
    {
      'index': 5,
      'image': Assets.icons.science.path,
      'heading': 'Science',
    },
    {
      'index': 6,
      'image': Assets.icons.architecture.path,
      'heading': 'Architecture',
    },
    {
      'index': 7,
      'image': Assets.icons.music.path,
      'heading': 'Music',
    },
    {
      'index': 8,
      'image': Assets.icons.podcasts.path,
      'heading': 'Podcasts',
    },
    {
      'index': 9,
      'image': Assets.icons.maths.path,
      'heading': 'Maths',
    },
    {
      'index': 10,
      'image': Assets.icons.business.path,
      'heading': 'Business',
    },
    {
      'index': 11,
      'image': Assets.icons.regional.path,
      'heading': 'Regional',
    },
    {
      'index': 12,
      'image': Assets.icons.iconyoga.path,
      'heading': 'Yoga',
    },
    {
      'index': 13,
      'image': Assets.icons.history.path,
      'heading': 'History',
    },
    {
      'index': 14,
      'image': Assets.icons.science.path,
      'heading': 'Science',
    },
    {
      'index': 15,
      'image': Assets.icons.architecture.path,
      'heading': 'Architecture',
    },
    {
      'index': 16,
      'image': Assets.icons.music.path,
      'heading': 'Music',
    },
    {
      'index': 17,
      'image': Assets.icons.podcasts.path,
      'heading': 'Podcasts',
    },
  ];
}

final notificationProvider = ChangeNotifierProvider((r) {
  return NotificationState();
});
