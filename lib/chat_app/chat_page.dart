import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_things/chat_app/chat_detail_page.dart';
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
        body: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          itemCount: 15,
          itemBuilder: (context, index) => ListTile(
            onTap: () =>
                context.pushNamed(ChatDetailPage.name, extra: index.toString()),
            title: Text('Chat Channel $index'),
          ),
        ),
      ),
      tablet: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Chats-Tablet'),
          titleTextStyle: TextStyles.header20pts.apply(color: Colors.black),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Flexible(
              child: CloseButton(
                onPressed: () {
                  context.read<ChatController>().changeState(value: false);
                },
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              15,
              (index) => ListTile(
                onTap: () => context.pushNamed(ChatDetailPage.name,
                    extra: index.toString()),
                title: Text('Chat Channel $index'),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
