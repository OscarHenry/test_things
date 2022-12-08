import 'package:flutter/material.dart';
import 'package:test_things/chat_app/chat_detail_page.dart';
import 'package:test_things/chat_app/chat_page.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/error_screen.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  static const String path = '/chat';
  static const String name = 'chat';

  Route<dynamic>? generateRoutes(RouteSettings settings) {
    Route? page;
    switch (settings.name) {
      case ChatPage.path:
        page = PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          return const ChatPage();
        }, transitionsBuilder: (_, Animation<double> animation,
            Animation<double> second, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(second),
              child: child,
            ),
          );
        });
        break;
      case ChatDetailPage.path:
        page = PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          return ChatDetailPage(title: settings.arguments as String);
        }, transitionsBuilder: (_, Animation<double> animation,
            Animation<double> second, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(second),
              child: child,
            ),
          );
        });
        break;
    }
    return page;
  }

  Route<dynamic>? unKnownRoute(RouteSettings settings) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      return const ErrorScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'ChatApp',
      onGenerateRoute: generateRoutes,
      onUnknownRoute: unKnownRoute,
      initialRoute: ChatPage.path,
      useInheritedMediaQuery: true,
      builder: (context, child) => SizedBox(
        width: 25.w,
        child: child,
      ),
    );
  }
}
