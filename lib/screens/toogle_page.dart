import 'package:flutter/material.dart';
import 'package:test_things/component/radio_toggle.dart';
import 'dart:developer';

class TooglePage extends StatefulWidget {
  const TooglePage({Key? key}) : super(key: key);

  @override
  State<TooglePage> createState() => _TooglePageState();
}

class _TooglePageState extends State<TooglePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item$index');
    return Scaffold(
      body: SingleChildScrollView(
        child: RadioToggle(
          titles: items,
          onToggle: (index) {
            log('onToggle: Item$index');
            setState(() {});
          },
        ),
      ),
    );
  }
}
