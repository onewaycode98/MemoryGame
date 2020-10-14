import 'dart:async';

Stream<int> stopWatchStream() {
  StreamController<int> streamController;
  Timer timer;
  Duration timerInterval = Duration(seconds: 1);
  int counter = 0;

  void tick(_) {
    counter++;
    streamController.add(counter);
  }

  void startTimer() {
    timer = Timer.periodic(timerInterval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
      counter = 0;
      streamController.close();
    }
  }

  streamController =
      StreamController<int>(onListen: startTimer, onCancel: stopTimer);

  return streamController.stream;
}

// String minutesStr = '00';
// String secondsStr = '00';
// Stream<int> timerStream;
// StreamSubscription<int> timerSubscription;

// void startTime() {
//   if (timerStream == null) {
//     timerStream = stopWatchStream();
//     timerSubscription = timerStream.listen((int newTicks) {
//       setState(() {
//         minutesStr =
//             ((newTicks / 60) % 60).floor().toString().padLeft(2, '0');
//         secondsStr = (newTicks % 60).floor().toString().padLeft(2, '0');
//       });
//     });
//   } else {
//     timerStream == null;
//   }
// }
