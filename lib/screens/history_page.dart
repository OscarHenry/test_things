import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/screens/detail_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static const String path = '/history';
  static const String name = 'history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          GoRouter.of(context).location,
          style: TextStyles.header28pts,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: ValueKey(GoRouter.of(context).location),
        onPressed: () {
          context.pushNamed(DetailPage.name, extra: 'history');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
