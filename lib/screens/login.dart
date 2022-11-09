import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/screens/notification_page.dart';
import 'package:test_things/core/util/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.state}) : super(key: key);
  final GoRouterState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path: ${state.fullpath}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/page1');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}

class _LoginMobile extends StatelessWidget {
  const _LoginMobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive.builder(
      builder: (context, _, __) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mobile Login Screen',
                style: TextStyle(fontSize: 18.sp),
              ),
              verticalSpace,
              Text(
                'Constraints ${ScreenUtil.boxConstraints}',
                style: TextStyle(fontSize: 12.sp),
              ),
              verticalSpace,
              Text(
                'Orientation ${ScreenUtil.orientation}',
                style: TextStyle(fontSize: 12.sp),
              ),
              verticalSpace,
              Text(
                'DeviceType ${ScreenUtil.deviceType}',
                style: TextStyle(fontSize: 12.sp),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
                child: const Text('NotificationPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTablet extends StatelessWidget {
  const _LoginTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.builder(
      builder: (context, _, __) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tablet Login Screen',
                style: TextStyle(fontSize: 18.sp),
              ),
              verticalSpace,
              Text(
                'Constraints ${ScreenUtil.boxConstraints}',
                style: TextStyle(fontSize: 12.sp),
              ),
              verticalSpace,
              Text(
                'Orientation ${ScreenUtil.orientation}',
                style: TextStyle(fontSize: 12.sp),
              ),
              verticalSpace,
              Text(
                'DeviceType ${ScreenUtil.deviceType}',
                style: TextStyle(fontSize: 12.sp),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
                child: const Text('NotificationPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginDesktop extends HookWidget {
  const _LoginDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Responsive.builder(
      builder: (context, _, __) => Scaffold(
        appBar: AppBar(
          title: const Text('Desktop'),
        ),
        body: Row(
          children: [
            NavigationRail(
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                    icon: Icon(Icons.inbox), label: Text('Inbox')),
                NavigationRailDestination(
                    icon: Icon(Icons.article), label: Text('Articles')),
                NavigationRailDestination(
                    icon: Icon(Icons.chat), label: Text('Chat')),
                NavigationRailDestination(
                    icon: Icon(Icons.video_call), label: Text('Video'))
              ],
              selectedIndex: selectedIndex.value,
              onDestinationSelected: (value) => selectedIndex.value = value,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.builder(
      builder: (context, constrains, orientation) => Stack(
        alignment: Alignment.center,
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Text(
                constrains.toString(),
                style: TextStyle(fontSize: 4.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
