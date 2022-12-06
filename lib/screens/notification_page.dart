import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/model/models.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const String path = '/notification';
  static const String name = 'notification';
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return ListTile(
              leading: const FlutterLogo(),
              title: Text(notification.title),
              subtitle: Text(notification.subtitle),
            );
          },
        ),
      ),
      tablet: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Notifications'),
            centerTitle: false,
            actions: [
              CloseButton(
                  onPressed: () {
                    context.pop();
                    GoRouter.of(context).refresh();
                  },
                  color: Colors.black),
            ],
          ),
          Expanded(
            child: ListView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  leading: const FlutterLogo(),
                  title: Text(notification.title),
                  subtitle: Text(notification.subtitle),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
