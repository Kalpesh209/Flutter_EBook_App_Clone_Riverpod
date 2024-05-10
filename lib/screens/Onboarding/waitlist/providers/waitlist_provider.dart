import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitListState extends ChangeNotifier {}

final waitListProvider = ChangeNotifierProvider((r) {
  return WaitListState();
});
