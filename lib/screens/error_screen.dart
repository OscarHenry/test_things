import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, this.exception}) : super(key: key);
  final Exception? exception;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('ErrorPage: $exception'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('back'),
          ),
        ],
      ),
    );
  }
}
