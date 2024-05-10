import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/timer_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/timer_picker.dart';
import 'package:get/get.dart';

import 'models/timer_box.dart';

class TimerSetScreenState extends ChangeNotifier {
  int _selected = 0;
  get selected => _selected;
  set selected(status) {
    _selected = status;
    notifyListeners();
  }

  Timer? timer;
  List<TimerBox> boxes = [];
  Duration? selectedDuration;
  int pendingSecond = 0;
  bool timerPaused = false;
  cancelState(t) {
    t.cancel();
    eventBus.fire(TimerEnd());
    selectedDuration = null;
    pendingSecond = 0;
    timer?.cancel();
  }

  startTimer() {
    var box = boxes[selected];
    var t = box.duration?.split(':');
    selectedDuration = Duration(
      hours: int.parse(t![0]),
      minutes: int.parse(t[1]),
      seconds: int.parse(t[2]),
    );
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (t.tick != 1 && pendingSecond == 0) {
        cancelState(t);
      } else {
        if (timerPaused == false) {
          pendingSecond = (selectedDuration!.inSeconds - t.tick).toInt();
        }
      }
    });
    repeat = true;
    notifyListeners();
    Get.back();
  }
}

final timerSetScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  var state = TimerSetScreenState();
  storageService.read(key: 'timer_boxes').then((value) {
    if (value != null) {
      List<dynamic> items = jsonDecode(value);
      state.boxes = [...items.map((e) => TimerBox.fromJson(e))];
    } else {
      state.boxes = [
        TimerBox(id: 0, name: 'Warm Up', duration: '00:00:00'),
        TimerBox(id: 1, name: 'Meditation', duration: '00:00:00'),
      ];
    }
    state.notifyListeners();
  });

  return state;
});

class TimerSetScreen extends ConsumerWidget {
  const TimerSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(timerSetScreenProvider);
    var t = state.boxes[state.selected].duration?.split(':');
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: FpElevatedButton(
        buttonTitle: 'Start',
        onPressed: () => state.startTimer(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 210,
              child: TimerPicker(
                key: Key(state.selected.toString()),
                t != null
                    ? TimerDuration(hour: t[0], minutes: t[1], seconds: t[2])
                    : TimerDuration(hour: '0', minutes: '0', seconds: '0'),
                onChanged: (TimerDuration t) async {
                  TimerBox box = state.boxes[state.selected].copyWith(
                      duration:
                          "${t.hour?.padLeft(2, '0')}:${t.minutes?.padLeft(2, '0')}:${t.seconds?.padLeft(2, '0')}");
                  state.boxes[state.selected] = box;
                  await storageService.write(
                      key: 'timer_boxes', value: jsonEncode(state.boxes));
                  state.notifyListeners();
                },
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.04),
                child: GridView.count(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.04,
                  children: [
                    ...state.boxes.map(
                      (e) {
                        return Material(
                          key: UniqueKey(),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            side: BorderSide(
                              color: (state.selected == e.id)
                                  ? themeColor
                                  : FPcolors.fpPrimaryLight1,
                              width: (state.selected == e.id) ? 1 : 0,
                            ),
                          ),
                          borderOnForeground: true,
                          color: FPcolors.fpPrimaryLight1,
                          child: InkWell(
                            onTap: () {
                              state.selected = e.id;
                            },
                            child: Container(
                              padding: EdgeInsets.all(Get.width * 0.08),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.name ?? '',
                                      style:
                                          const TextStyle(color: themeColor)),
                                  Text(
                                    e.duration ?? 'xx',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
