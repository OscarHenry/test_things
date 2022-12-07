import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/management/chat_controller.dart';
import 'package:test_things/screens/chat_detail_page.dart';
import 'package:test_things/screens/detail_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String path = '/chat';
  static const String name = 'chat';
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        body: Center(
          child: Text(
            'Chat Page',
            style: TextStyles.header28pts,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: ValueKey(GoRouter.of(context).location),
          onPressed: () {
            context.pushNamed(DetailPage.name, extra: 'chat');
          },
          tooltip: 'Details',
          child: const Text('Details'),
        ),
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
            title: const Text('Chats'),
            actions: [
              CloseButton(
                onPressed: () {
                  if (GoRouter.of(context).location == ChatDetailPage.path) {
                    GoRouter.of(context)
                      ..pop()
                      ..refresh();
                  }
                  context.read<ChatController>().changeState(value: false);
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
                    onTap: () => context.pushNamed(ChatDetailPage.name,
                        extra: index.toString()),
                    title: Text('Chat Channel $index'),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
