import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/screens/detail_page.dart';

class ShopDevicePage extends StatelessWidget {
  const ShopDevicePage({Key? key}) : super(key: key);
  static const String path = '/shop-device';
  static const String name = 'shop-device';
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
          context.pushNamed(DetailPage.name, extra: 'shop-device');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
