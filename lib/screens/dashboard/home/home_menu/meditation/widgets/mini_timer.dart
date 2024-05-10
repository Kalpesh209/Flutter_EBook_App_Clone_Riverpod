import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/timer_set_screen.dart';
import 'package:get/get.dart';

class MiniTimerState extends ChangeNotifier {
  late Timer t;

  MiniTimerState() {
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }
}

final miniTimerProvider = ChangeNotifierProvider((r) {
  return MiniTimerState();
});

class MiniTimer extends ConsumerWidget {
  const MiniTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(miniTimerProvider);
    var timerState = ref.watch(timerSetScreenProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.icons.stpwatch),
          SizedBox(width: Get.width * 0.02),
          Text(
            timerState.selectedDuration == null
                ? 'Timer'
                : formatDurationInHhMmSs(
                    Duration(seconds: timerState.pendingSecond),
                  ),
            style: const TextStyle(fontSize: 14, color: themeColor),
          ),
        ],
      ),
    );
  }
}
