import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/chat_app/chat_app.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/chat_app/chat_detail_page.dart';
import 'package:test_things/chat_app/chat_page.dart';
import 'package:test_things/screens/detail_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/error_screen.dart';
import 'package:test_things/screens/history_page.dart';
import 'package:test_things/screens/login_page.dart';
import 'package:test_things/component/app_scaffold.dart';
import 'package:test_things/screens/notification_page.dart';
import 'package:test_things/screens/other_login_page.dart';
import 'package:test_things/screens/policy_privacy_page.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:test_things/screens/shop_device_page.dart';
import 'package:test_things/screens/user_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _chatNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'chat');

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: OtherLoginPage.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: OtherLoginPage.path,
      name: OtherLoginPage.name,
      builder: (context, state) => const OtherLoginPage(),
    ),
    // GoRoute(
    //   path: LoginPage.path,
    //   name: LoginPage.name,
    //   builder: (context, state) => const LoginPage(),
    // ),
    ShellRoute(
      navigatorKey: _homeNavigatorKey,
      builder: (context, state, child) => AppScaffold(
        state: state,
        child: child,
      ),
      routes: [
        GoRoute(
          path: DevicePage.path,
          name: DevicePage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DevicePage()),
        ),
        GoRoute(
          path: HistoryPage.path,
          name: HistoryPage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HistoryPage()),
        ),
        GoRoute(
          path: ChatApp.path,
          name: ChatApp.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatApp()),
        ),
        GoRoute(
          path: UserPage.path,
          name: UserPage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UserPage()),
        ),
        GoRoute(
          path: SettingPage.path,
          name: SettingPage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingPage()),
        ),
        GoRoute(
          path: ShopDevicePage.path,
          name: ShopDevicePage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ShopDevicePage()),
        ),
      ],
    ),
    GoRoute(
      path: DetailPage.path,
      name: DetailPage.name,
      builder: (context, state) => DetailPage(title: state.extra as String),
    ),
    GoRoute(
      path: NotificationPage.path,
      name: NotificationPage.name,
      pageBuilder: (context, state) {
        if (ScreenUtil.isMobile) {
          return const MaterialPage(child: NotificationPage());
        } else {
          return const DrawerPage(child: NotificationPage());
        }
      },
    ),
    GoRoute(
      path: PolicyPrivacyPage.path,
      name: PolicyPrivacyPage.name,
      builder: (context, state) => const PolicyPrivacyPage(),
    ),
    GoRoute(
      path: AboutUsPage.path,
      name: AboutUsPage.name,
      builder: (context, state) => const AboutUsPage(),
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(exception: state.error),
);

GoRouter chatRouter = GoRouter(
  navigatorKey: _chatNavigatorKey,
  initialLocation: ChatPage.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: ChatPage.path,
      name: ChatPage.name,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ChatPage()),
    ),
    GoRoute(
      path: ChatDetailPage.path,
      name: ChatDetailPage.name,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ChatDetailPage(
          title: state.extra as String,
        ),
      ),
    )
  ],
);

class DrawerPage<T> extends Page<T> {
  const DrawerPage({required this.child});
  final Widget child;
  @override
  Route<T> createRoute(BuildContext context) {
    return RawDialogRoute<T>(
      settings: this,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: Drawer(
                    width: 25.w,
                    backgroundColor: Colors.white,
                    elevation: 6,
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
