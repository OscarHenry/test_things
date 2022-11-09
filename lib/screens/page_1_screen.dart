import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key, required this.state}) : super(key: key);
  final GoRouterState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page${index + 1}');
              },
              child: Text('ir a page ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
