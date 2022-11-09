import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_things/c_timer.dart';

const timerDuration = 5;

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late CTimer timer = CTimer(5, callBackTimer: listener);

  listener(int counter) {
    setState(() {});
  }

  @override
  void initState() {
    log('initialized timer');
    timer.start();
    super.initState();
  }

  @override
  void dispose() {
    log('disposed timer');
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${timer.counter}')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              if (!timer.isActive) {
                timer.start();
              }
            },
            child: const Icon(Icons.play_arrow),
          ),
          const SizedBox(
            height: 8.0,
          ),
          FloatingActionButton.small(
            onPressed: () {
              if (timer.isActive) {
                timer.cancel();
              }
            },
            child: const Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}
