import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/management/chat_controller.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String path = '/chat-list';
  static const String name = 'chat-list';
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Chats'),
          titleTextStyle: TextStyles.header20pts.apply(color: Colors.black),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              15,
              (index) => ListTile(
                onTap: () => Navigator.pushNamed(context, '/chat-detail',
                    arguments: index.toString()),
                title: Text('Chat Channel $index'),
              ),
            ),
          ).toList(),
        ),
      ),
      tablet: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              title: const Text('Chats'),
              titleTextStyle: TextStyles.header20pts.apply(color: Colors.black),
              backgroundColor: Colors.transparent,
              actions: [
                CloseButton(
                  onPressed: () {
                    // context.read<ChatController>().changeState(value: false);
                  },
                  color: Colors.black,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                    15,
                    (index) => ListTile(
                      onTap: () => Navigator.pushNamed(context, '/chat-detail',
                          arguments: index.toString()),
                      title: Text('Chat Channel $index'),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
