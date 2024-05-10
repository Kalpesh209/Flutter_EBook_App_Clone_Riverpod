import 'package:event_bus_plus/res/app_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/timer_duration.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

GlobalKey<ScrollSnapListState> hourKey = GlobalKey();
GlobalKey<ScrollSnapListState> minuteKey = GlobalKey();
GlobalKey<ScrollSnapListState> secondKey = GlobalKey();

class TimerEnd extends AppEvent {
  @override
  List<Object?> get props => ['timer:end'];
}

class TimerPickerState extends ChangeNotifier {
  Duration? startedTimer;
  TimerDuration time;

  updateTime(TimerDuration t) {
    time = t;
    notifyListeners();
  }

  TimerPickerState(this.time) {
    hourKey.currentState?.focusToItem(int.parse(time.hour ?? '0'));
    minuteKey.currentState?.focusToItem(int.parse(time.minutes ?? '0'));
    secondKey.currentState?.focusToItem(int.parse(time.seconds ?? '0'));
    WakelockPlus.enable();
    WakelockPlus.toggle(enable: true);
  }
}

final timerPickerProvider =
    ChangeNotifierProvider.family.autoDispose((r, TimerDuration time) {
  return TimerPickerState(time);
});

class TimerPicker extends ConsumerWidget {
  final Function onChanged;
  final TimerDuration time;

  const TimerPicker(
    this.time, {
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(timerPickerProvider(time));
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.17,
                child: ScrollSnapList(
                  key: hourKey,
                  updateOnScroll: true,
                  dynamicItemOpacity: 0.6,
                  curve: Curves.easeOutCubic,
                  selectedItemAnchor: SelectedItemAnchor.MIDDLE,
                  onItemFocus: (i) {
                    state.updateTime(state.time.copyWith(hour: i.toString()));
                    onChanged(state.time);
                  },
                  itemSize: 70,
                  itemBuilder: (b, index) => Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 70,
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: const TextStyle(
                          fontSize: 30,
                          color: themeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  itemCount: 24,
                  scrollDirection: Axis.vertical,
                  focusOnItemTap: false,
                ),
              ),
              const Text('Hours',
                  style: TextStyle(color: themeColor, fontSize: 14)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.17,
                child: ScrollSnapList(
                  key: minuteKey,
                  updateOnScroll: true,
                  onItemFocus: (i) {
                    state
                        .updateTime(state.time.copyWith(minutes: i.toString()));
                    onChanged(state.time);
                  },
                  itemSize: 70,
                  dynamicItemOpacity: 0.6,
                  itemBuilder: (b, index) => Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 70,
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: const TextStyle(
                          fontSize: 30,
                          color: themeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  itemCount: 60,
                  dynamicSizeEquation: (d) => d,
                  scrollDirection: Axis.vertical,
                ),
              ),
              const Text('min',
                  style: TextStyle(color: themeColor, fontSize: 14)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.17,
                child: ScrollSnapList(
                  key: secondKey,
                  onItemFocus: (i) {
                    state
                        .updateTime(state.time.copyWith(seconds: i.toString()));
                    onChanged(state.time);
                  },
                  updateOnScroll: true,
                  itemSize: 70,
                  dynamicItemOpacity: 0.6,
                  itemBuilder: (b, index) => Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 70,
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: const TextStyle(
                          fontSize: 30,
                          color: themeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  itemCount: 60,
                  dynamicSizeEquation: (d) => d,
                  scrollDirection: Axis.vertical,
                ),
              ),
              const Text('sec',
                  style: TextStyle(color: themeColor, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
