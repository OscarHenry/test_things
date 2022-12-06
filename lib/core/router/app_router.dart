import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/screens/chat_page.dart';
import 'package:test_things/screens/detail_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/error_screen.dart';
import 'package:test_things/screens/history_page.dart';
import 'package:test_things/screens/login_page.dart';
import 'package:test_things/component/app_scaffold.dart';
import 'package:test_things/screens/notification_page.dart';
import 'package:test_things/screens/policy_privacy_page.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:test_things/screens/shop_device_page.dart';
import 'package:test_things/screens/user_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');

// const routeLogin = '/login';
// const routeDevice = '/device';
// const routeHistory = '/history';
// const routeChat = '/chat';
// const routeUser = '/user';
// const routeSetting = '/setting';
// const routeNotification = '/notification';
// const routeShopDevice = '/shop-device';
// const routeDetail = '/detail';
// const routePolicyPrivacy = 'policy-privacy';
// const routeAboutUs = 'about-us';
//
// /// subroutes
// const routeLoginPolicyPrivacy = '$routeLogin/$routePolicyPrivacy';
// const routeLoginAboutUs = '$routeLogin/$routeAboutUs';
// const routeSettingPolicyPrivacy = '$routeSetting/$routePolicyPrivacy';
// const routeSettingAboutUs = '$routeSetting/$routeAboutUs';

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: LoginPage.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.name,
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
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
          path: ChatPage.path,
          name: ChatPage.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatPage()),
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
