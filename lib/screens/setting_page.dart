import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              GoRouter.of(context).location,
              style: TextStyles.header28pts,
            ),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                onTap: () => context.go(routeSettingPolicyPrivacy),
                leading: const Icon(Icons.settings),
                title: const Text('Privacy Policy'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                onTap: () => context.go(routeSettingAboutUs),
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
          context.go('${GoRouter.of(context).location}/$routeDetail');
        },
        tooltip: 'Details',
        child: const Text('Details'),
      ),
    );
  }
}
