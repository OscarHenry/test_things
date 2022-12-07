import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/screens/detail_page.dart';
import 'package:test_things/screens/policy_privacy_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const String path = '/setting';
  static const String name = 'setting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Page',
          style: TextStyles.header28pts,
        ),
      ),
      body: Column(
        children: [
          ...ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                onTap: () => context.pushNamed(PolicyPrivacyPage.name),
                leading: const Icon(Icons.settings),
                title: const Text('Privacy Policy'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                onTap: () => context.pushNamed(AboutUsPage.name),
                title: const Text('About Us'),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: ValueKey(GoRouter.of(context).location),
        onPressed: () {
          context.pushNamed(DetailPage.name, extra: 'setting');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
