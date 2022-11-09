import 'package:flutter/material.dart';

import 'dto.dart';
import 'notification_item.dart';

final GlobalKey<AnimatedListState> notificationListKey =
    GlobalKey<AnimatedListState>();

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3));
      },
      child: AnimatedList(
        key: notificationListKey,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        initialItemCount: notifications.length,
        itemBuilder: notificationItemBuilder,
      ),
    );
  }

  Widget notificationItemBuilder(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final notification = notifications[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(animation),
      transformHitTests: false,
      child: NotificationItem(
          notification: notification,
          onClose: () {
            notificationListKey.currentState?.removeItem(
              index,
              (context, animation) => const SizedBox.shrink(),
            );
            setState(() {
              notifications.removeAt(index);
            });
          }),
    );
  }
}
