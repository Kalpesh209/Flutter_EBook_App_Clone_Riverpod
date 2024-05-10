import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:event_bus_plus/res/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/components.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/timer_set_screen.dart';
import 'package:get/get.dart';

class TimerPaused extends AppEvent {
  @override
  List<Object?> get props => ['timer:paused'];
}

class TimerResumed extends AppEvent {
  @override
  List<Object?> get props => ['timer:resumed'];
}

class CountDownScreenState extends ChangeNotifier {
  final CountDownController _controller = CountDownController();

  toggleState() {
    _controller.isPaused ? _controller.resume() : _controller.pause();
    if (_controller.isPaused) eventBus.fire(TimerPaused());
    if (!_controller.isPaused) eventBus.fire(TimerResumed());
    notifyListeners();
  }
}

final countDownScreenProvider = ChangeNotifierProvider((r) {
  return CountDownScreenState();
});

class CountDownScreen extends ConsumerWidget {
  const CountDownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(countDownScreenProvider);
    var timerState = ref.watch(timerSetScreenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(timerState.boxes[timerState.selected].name ?? ''),
        centerTitle: true,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: FpElevatedButton(
                  onPressed: () {
                    timerState.timerPaused = !state._controller.isPaused;
                    state.toggleState();
                  },
                  buttonTitle: state._controller.isPaused ? 'Resume' : 'Pause',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: FpElevatedButton(
                  onPressed: () {
                    repeat = false;
                    timerState.cancelState(timerState.timer!);
                    Get.back();
                  },
                  buttonTitle: 'Cancel',
                  color: Colors.grey.shade900,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Assets.icons.ctBg.image(fit: BoxFit.cover),
            Center(
              child: CircularCountDownTimer(
                duration: timerState.pendingSecond,
                controller: state._controller,
                initialDuration: 0,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 1.5,
                ringColor: FPcolors.fpPrimaryLight1,
                ringGradient: null,
                fillColor: themeColor,
                fillGradient: null,
                backgroundColor: Colors.white,
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.square,
                textStyle: const TextStyle(
                  fontSize: 33.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  // Here, do whatever you want
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  // Here, do whatever you want
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  // Here, do whatever you want
                  debugPrint('Countdown Changed $timeStamp');
                },

                /* 
            * Function to format the text.
            * Allows you to format the current duration to any String.
            * It also provides the default function in case you want to format specific moments
              as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
              the default behavior.
          */
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 0) {
                    // only format for '0'
                    return "Start";
                  } else {
                    return formatDurationInHhMmSs(
                        Duration(seconds: timerState.pendingSecond));
                    // other durations by it's default format
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
