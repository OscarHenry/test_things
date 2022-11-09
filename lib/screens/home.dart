import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_things/screens/calls_page.dart';
import 'package:test_things/screens/form_page.dart';
import 'package:test_things/core/res.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:test_things/screens/timer_page.dart';
import 'package:test_things/screens/toogle_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _selectedIndex = 0;

  late final List<Widget> pages = [
    CallsPage(isHideBottomNavBar: (isHideBottomNavBar) {
      isHideBottomNavBar ? _controller.forward() : _controller.reverse();
    }),
    const TimerPage(),
    const TooglePage(),
    const FormPage(),
    const SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: 1, vsync: this, duration: const Duration(microseconds: 100));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizeTransition(
        sizeFactor: _controller,
        axisAlignment: -1.0,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          unselectedItemColor: Colors.blueGrey,
          fixedColor: Theme.of(context).primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.tab_bar_device_icon),
              label: 'Device',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.tab_bar_history_icon),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.tab_bar_chat_icon),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.tab_bar_users_icon),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.tab_bar_settings_icon),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
