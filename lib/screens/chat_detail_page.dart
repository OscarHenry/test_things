import 'package:flutter/material.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/util/responsive.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({Key? key, required this.title}) : super(key: key);
  static const String path = '/chat-detail';
  static const String name = 'chat-detail';
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Chat $title Detail in Mobile mode'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            5,
            (index) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Some description of message' *
                        (index == 0 ? 1 : index)),
                    verticalSpace,
                    Text('other description of message tooo muuuuch long' *
                        (index == 0 ? 1 : index)),
                  ],
                ),
              ),
            ),
          )..shuffle(),
        ),
      ),
    );
  }
}
