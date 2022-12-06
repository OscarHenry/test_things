import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/component/avatar/avatar.dart';
import 'package:test_things/component/avatar/avatar_button.dart';
import 'package:test_things/component/footer_app.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/styles/custom_colors.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/chat_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/history_page.dart';
import 'package:test_things/screens/login_page.dart';
import 'package:test_things/screens/notification_page.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:test_things/screens/shop_device_page.dart';
import 'package:test_things/screens/user_page.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _AppScaffoldMobile(child: child),
      tablet: _AppScaffoldTablet(child: child),
    );
  }
}

class _AppScaffoldMobile extends StatelessWidget {
  const _AppScaffoldMobile({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final destinations = <NavigationDestination>[
      NavigationDestination(
        label: 'devices',
        icon: SvgPicture.asset(
          'assets/tab_bar_device_icon.svg',
          width: 36,
          color: Colors.black,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_device_icon.svg',
          width: 36,
          color: Colors.black,
        ),
      ),
      NavigationDestination(
        label: 'history',
        icon: SvgPicture.asset(
          'assets/tab_bar_history_icon.svg',
          width: 36,
          color: Colors.black,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_history_icon.svg',
          width: 36,
          color: Colors.black,
        ),
      ),
      NavigationDestination(
        label: 'chat',
        icon: SvgPicture.asset(
          width: 36,
          'assets/tab_bar_chat_icon.svg',
          color: Colors.black,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_chat_icon.svg',
          width: 36,
          color: Colors.black,
        ),
      ),
      NavigationDestination(
        label: 'users',
        icon: SvgPicture.asset(
          'assets/tab_bar_users_icon.svg',
          width: 36,
          color: Colors.black,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_users_icon.svg',
          width: 36,
          color: Colors.black,
        ),
      ),
      NavigationDestination(
        label: 'settings',
        icon: SvgPicture.asset(
          'assets/tab_bar_settings_icon.svg',
          width: 36,
          color: Colors.black,
        ),
        selectedIcon: SvgPicture.asset(
          'assets/tab_bar_settings_icon.svg',
          width: 36,
          color: Colors.black,
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => context.pop(),
          color: Colors.black,
        ),
        title: const Text('AppBar-Scaffold-Mobile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (GoRouter.of(context).location != NotificationPage.path) {
                context.pushNamed(NotificationPage.name);
              } else {
                context.pop();
              }
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        surfaceTintColor: CustomColorsHelper.primaryBlue,
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: destinations,
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(DevicePage.path)) {
      return 0;
    }
    if (location.startsWith(HistoryPage.path)) {
      return 1;
    }
    if (location.startsWith(ChatPage.path)) {
      return 2;
    }
    if (location.startsWith(UserPage.path)) {
      return 3;
    }
    if (location.startsWith(SettingPage.path)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(DevicePage.name);
        break;
      case 1:
        GoRouter.of(context).goNamed(HistoryPage.name);
        break;
      case 2:
        GoRouter.of(context).goNamed(ChatPage.name);
        break;
      case 3:
        GoRouter.of(context).goNamed(UserPage.name);
        break;
      case 4:
        GoRouter.of(context).goNamed(SettingPage.name);
        break;
    }
  }
}

class _AppScaffoldTablet extends StatelessWidget {
  const _AppScaffoldTablet({Key? key, required this.child}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          onPressed: () => context.pop(),
          color: Colors.white,
        ),
        title: const Text('AppBar-Scaffold-Tablet'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              if (GoRouter.of(context).location != NotificationPage.path) {
                context.pushNamed(NotificationPage.name);
              } else {
                context.pop();
              }
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          AvatarButton(
            text: '',
            imagePath: 'assets/images/about_us_3.jpg',
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
            indicatorColor: CustomColorsHelper.primaryBlue,
            selectedIconTheme:
                const IconThemeData(color: CustomColorsHelper.white),
            selectedLabelTextStyle:
                const TextStyle(color: CustomColorsHelper.white),
            unselectedIconTheme:
                const IconThemeData(color: CustomColorsHelper.white),
            unselectedLabelTextStyle:
                const TextStyle(color: CustomColorsHelper.white),
            destinations: destinations
                .map<NavigationRailDestination>(
                  (e) => NavigationRailDestination(
                    icon: e.icon,
                    label: Text(e.label),
                    selectedIcon: e.selectedIcon,
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
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(DevicePage.path)) {
      return 0;
    }
    if (location.startsWith(HistoryPage.path)) {
      return 1;
    }
    if (location.startsWith(ChatPage.path)) {
      return 2;
    }
    if (location.startsWith(UserPage.path)) {
      return 3;
    }
    if (location.startsWith(SettingPage.path)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(DevicePage.name);
        break;
      case 1:
        GoRouter.of(context).goNamed(HistoryPage.name);
        break;
      case 2:
        GoRouter.of(context).goNamed(ChatPage.name);
        break;
      case 3:
        GoRouter.of(context).goNamed(UserPage.name);
        break;
      case 4:
        GoRouter.of(context).goNamed(SettingPage.name);
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
          onTap: () => context.pushNamed(ShopDevicePage.name),
          child: Text(
            'Shop Devices',
            style: TextStyles.titleRegular12pts,
          ),
        ),
        PopupMenuItem(
          onTap: () => context.goNamed(LoginPage.name),
          child: Text(
            'Sign Out',
            style: TextStyles.titleRegular12pts,
          ),
        ),
      ],
    );
  }
}
