import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
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
            GoRouter.of(context).location,
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
      tablet: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(
            15,
            (index) => ListTile(
              title: Text('Chat Channel $index'),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
