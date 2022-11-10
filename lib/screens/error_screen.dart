import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, this.exception}) : super(key: key);
  final Exception? exception;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('ErrorPage: $exception'),
            verticalSpace,
            ElevatedButton(
              onPressed: () {
                context.go(routeLogin);
              },
              child: const Text('back to login'),
            ),
          ],
        ),
      ),
    );
  }
}
