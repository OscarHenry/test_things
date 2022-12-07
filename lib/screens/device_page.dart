import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/detail_page.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({Key? key}) : super(key: key);
  static const String path = '/device';
  static const String name = 'device';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Device Page',
          style: TextStyles.header28pts,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: ValueKey(GoRouter.of(context).location),
        onPressed: () {
          context.pushNamed(DetailPage.name, extra: 'device');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
