import 'package:flutter/material.dart';
import 'package:test_things/calls_page.dart';

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
    CallsPage(isHideBottomNavBar: (isHideBottomNavBar) {
      isHideBottomNavBar ? _controller.forward() : _controller.reverse();
    }),
    CallsPage(isHideBottomNavBar: (isHideBottomNavBar) {
      isHideBottomNavBar ? _controller.forward() : _controller.reverse();
    }),
    CallsPage(isHideBottomNavBar: (isHideBottomNavBar) {
      isHideBottomNavBar ? _controller.forward() : _controller.reverse();
    }),
    CallsPage(isHideBottomNavBar: (isHideBottomNavBar) {
      isHideBottomNavBar ? _controller.forward() : _controller.reverse();
    }),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: 1, vsync: this, duration: const Duration(milliseconds: 300));
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Temp',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
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
