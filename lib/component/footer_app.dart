import 'package:flutter/material.dart';

class FooterApp extends StatelessWidget {
  const FooterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.black,
      child: const Text(
        'FooterApp',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
