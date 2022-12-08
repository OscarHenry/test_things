import 'package:flutter/material.dart';
import 'package:test_things/chat_app/chat_detail_page.dart';
import 'package:test_things/chat_app/chat_page.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/error_screen.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  static const String path = '/chat';
  static const String name = 'chat';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      color: Colors.white,
      title: 'ChatApp',
      debugShowCheckedModeBanner: false,
      routerConfig: chatRouter,
    );
  }
}
