import 'dart:async';

typedef CallBackTimer = void Function(int counter);

class CTimer {
  CTimer(this.duration, {this.callBackTimer});
  late Timer? timer;
  final int duration;
  CallBackTimer? callBackTimer;

  bool get isActive => timer?.isActive ?? false;

  late int _counter = 0;

  int get counter => _counter;

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter += 1;
      callBackTimer?.call(_counter);
      if (duration == _counter) {
        cancel();
      }
    });
  }

  void cancel() {
    timer?.cancel();
    reset();
    callBackTimer?.call(_counter);
  }

  void reset() {
    timer = null;
    _counter = 0;
  }
}
