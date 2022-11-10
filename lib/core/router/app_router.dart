import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/screens/chat_page.dart';
import 'package:test_things/screens/detail_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/error_screen.dart';
import 'package:test_things/screens/history_page.dart';
import 'package:test_things/screens/login_page.dart';
import 'package:test_things/component/app_scaffold.dart';
import 'package:test_things/screens/policy_privacy_page.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:test_things/screens/shop_device_page.dart';
import 'package:test_things/screens/user_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const routeLogin = '/login';
const routeDevice = '/device';
const routeHistory = '/history';
const routeChat = '/chat';
const routeUser = '/user';
const routeSetting = '/setting';
const routeShopDevice = '/shop-device';
const routeDetail = 'detail';
const routePolicyPrivacy = 'policy-privacy';
const routeAboutUs = 'about-us';

/// subroutes
const routeLoginPolicyPrivacy = '$routeLogin/$routePolicyPrivacy';
const routeLoginAboutUs = '$routeLogin/$routeAboutUs';
const routeSettingPolicyPrivacy = '$routeSetting/$routePolicyPrivacy';
const routeSettingAboutUs = '$routeSetting/$routeAboutUs';

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: routeLogin,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: routeLogin,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: routePolicyPrivacy,
          builder: (context, state) => const PolicyPrivacyPage(),
        ),
        GoRoute(
          path: routeAboutUs,
          builder: (context, state) => const AboutUsPage(),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: routeDevice,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DevicePage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) => const DetailPage(title: 'Device'),
            ),
          ],
        ),
        GoRoute(
          path: routeHistory,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HistoryPage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) => const DetailPage(title: 'History'),
            ),
          ],
        ),
        GoRoute(
          path: routeChat,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatPage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) => const DetailPage(title: 'Chat'),
            ),
          ],
        ),
        GoRoute(
          path: routeUser,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UserPage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) => const DetailPage(title: 'User'),
            ),
          ],
        ),
        GoRoute(
          path: routeSetting,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingPage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) => const DetailPage(title: 'Setting'),
            ),
            GoRoute(
              path: routePolicyPrivacy,
              builder: (context, state) => const PolicyPrivacyPage(),
            ),
            GoRoute(
              path: routeAboutUs,
              builder: (context, state) => const AboutUsPage(),
            ),
          ],
        ),
        GoRoute(
          path: routeShopDevice,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ShopDevicePage()),
          routes: [
            GoRoute(
              path: routeDetail,
              builder: (context, state) =>
                  const DetailPage(title: 'ShopDevice'),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(exception: state.error),
);
