import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class PageBase extends HookWidget {
  const PageBase({Key? key, required this.state, required this.child})
      : super(key: key);
  final GoRouterState state;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Path: ${state.fullpath}'),
      ),
      body: Row(
        children: [
          NavigationRail(
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.inbox),
                label: Text('Page1'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.article),
                label: Text('Page2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chat),
                label: Text('Page3'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.video_call),
                label: Text('Page4'),
              )
            ],
            selectedIndex: selectedIndex.value,
            onDestinationSelected: (value) {
              selectedIndex.value = value;
              context.push('/page${value + 1}');
            },
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
