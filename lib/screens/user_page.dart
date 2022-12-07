import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/screens/detail_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  static const String path = '/user';
  static const String name = 'user';
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
          context.pushNamed(DetailPage.name, extra: 'user');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
