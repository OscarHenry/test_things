import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/component/avatar/avatar.dart';
import 'package:test_things/component/avatar/avatar_button.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final destinations = <NavigationDestination>[
      NavigationDestination(
        label: 'devices',
        icon: SvgPicture.asset(
          'assets/tab_bar_device_icon.svg',
          width: 36,
          color: Colors.white,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_device_icon.svg',
          width: 36,
          color: Colors.white,
        ),
      ),
      NavigationDestination(
        label: 'history',
        icon: SvgPicture.asset(
          'assets/tab_bar_history_icon.svg',
          width: 36,
          color: Colors.white,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_history_icon.svg',
          width: 36,
          color: Colors.white,
        ),
      ),
      NavigationDestination(
        label: 'chat',
        icon: SvgPicture.asset(
          width: 36,
          'assets/tab_bar_chat_icon.svg',
          color: Colors.white,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_chat_icon.svg',
          width: 36,
          color: Colors.white,
        ),
      ),
      NavigationDestination(
        label: 'users',
        icon: SvgPicture.asset(
          'assets/tab_bar_users_icon.svg',
          width: 36,
          color: Colors.white,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_users_icon.svg',
          width: 36,
          color: Colors.white,
        ),
      ),
      NavigationDestination(
        label: 'settings',
        icon: SvgPicture.asset(
          'assets/tab_bar_settings_icon.svg',
          width: 36,
          color: Colors.white,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_settings_icon.svg',
          width: 36,
          color: Colors.white,
        ),
      ),
    ];

    return Responsive(
      mobile: Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          selectedIndex: _calculateSelectedIndex(context),
          onDestinationSelected: (index) => _onItemTapped(index, context),
          destinations: destinations
              .map<Widget>(
                (e) => NavigationDestination(icon: e.icon, label: e.label),
              )
              .toList(),
        ),
      ),
      tablet: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('AppBar-Scaffold'),
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.white),
          actions: [
            AvatarButton(
              text: '',
              imagePath: 'https://picsum.photos/id/237/200/300',
              onTap: () async {
                _showMenuOptions(context);
              },
            ),
          ],
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationRail(
              backgroundColor: Colors.black,
              minWidth: 80,
              useIndicator: true,
              labelType: NavigationRailLabelType.all,
              destinations: destinations
                  .map<NavigationRailDestination>(
                    (e) => NavigationRailDestination(
                      icon: e.icon,
                      label: Text(e.label),
                    ),
                  )
                  .toList(),
              selectedIndex: _calculateSelectedIndex(context),
              onDestinationSelected: (index) => _onItemTapped(index, context),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: child),
                  const FooterApp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(routeDevice)) {
      return 0;
    }
    if (location.startsWith(routeHistory)) {
      return 1;
    }
    if (location.startsWith(routeChat)) {
      return 2;
    }
    if (location.startsWith(routeUser)) {
      return 3;
    }
    if (location.startsWith(routeSetting)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(routeDevice);
        break;
      case 1:
        GoRouter.of(context).go(routeHistory);
        break;
      case 2:
        GoRouter.of(context).go(routeChat);
        break;
      case 3:
        GoRouter.of(context).go(routeUser);
        break;
      case 4:
        GoRouter.of(context).go(routeSetting);
        break;
    }
  }

  Future<void> _showMenuOptions(BuildContext context) async {
    const _position =
        RelativeRect.fromLTRB(double.maxFinite, 90, double.maxFinite, 0);
    await showMenu<void>(
      context: context,
      position: _position,
      shape: RoundedRectangleBorder(borderRadius: defRadiusCircular),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              const Avatar(
                borderColor: Colors.grey,
                text: '',
                imagePath: 'https://picsum.photos/id/237/200/300',
              ),
              horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Oscar H. Torres',
                    style: TextStyles.titleBold12pts,
                  ),
                  Text(
                    'Shop Admin',
                    style: TextStyles.titleRegular12pts,
                  ),
                ],
              ),
            ],
          ),
        ),
        const PopupMenuDivider(height: 20),
        PopupMenuItem(
          child: Text(
            'Profile',
            style: TextStyles.titleRegular12pts,
          ),
        ),
        PopupMenuItem(
          onTap: () => context.go(routeShopDevice),
          child: Text(
            'Shop Devices',
            style: TextStyles.titleRegular12pts,
          ),
        ),
        PopupMenuItem(
          onTap: () => context.go(routeLogin),
          child: Text(
            'Sign Out',
            style: TextStyles.titleRegular12pts,
          ),
        ),
      ],
    );
  }
}

class FooterApp extends StatelessWidget {
  const FooterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.black,
      child: const Text(
        'FooterApp',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
