import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/checkout.dart';

import '../widgets/library_book_card.dart';

class LibraryState extends ChangeNotifier {
  StreamSubscription? listener;
}

final libraryProvider = ChangeNotifierProvider((r) {
  var state = LibraryState();
  state.listener = eventBus
      .on<CartUpdatedEvent>()
      .listen((event) => r.read(checkOutProvider).loadCart());
  r.onDispose(() => state.listener?.cancel());
  return state;
});
