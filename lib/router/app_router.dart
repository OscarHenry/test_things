import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/screens/error_screen.dart';
import 'package:test_things/screens/login.dart';
import 'package:test_things/screens/page_1_screen.dart';
import 'package:test_things/screens/page_2_screen.dart';
import 'package:test_things/screens/page_3_screen.dart';
import 'package:test_things/screens/page_4_screen.dart';
import 'package:test_things/screens/page_base.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(state: state),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => PageBase(state: state, child: child),
      routes: [
        GoRoute(
          path: '/page1',
          builder: (context, state) => Page1Screen(state: state),
          routes: [
            GoRoute(
              path: 'subrouteA',
              builder: (context, state) => Page4Screen(state: state),
            ),
          ],
        ),
        GoRoute(
          path: '/page2',
          builder: (context, state) => Page2Screen(state: state),
          routes: [
            GoRoute(
              path: 'subrouteB',
              builder: (context, state) => Page3Screen(state: state),
            ),
          ],
        ),
        GoRoute(
          path: '/page3',
          builder: (context, state) => Page3Screen(state: state),
          routes: [
            GoRoute(
              path: 'subrouteC',
              builder: (context, state) => Page2Screen(state: state),
            ),
          ],
        ),
        GoRoute(
          path: '/page4',
          builder: (context, state) => Page4Screen(state: state),
          routes: [
            GoRoute(
              path: 'subrouteD',
              builder: (context, state) => Page1Screen(state: state),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(exception: state.error),
);
