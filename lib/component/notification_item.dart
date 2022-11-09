import 'package:flutter/material.dart';
import 'package:test_things/model/dto.dart' as dto;

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notification,
    required this.onClose,
  }) : super(key: key);

  final dto.Notification notification;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      margin: const EdgeInsetsDirectional.all(8.0),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[1],
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.subtitle),
        trailing: CloseButton(
          color: Colors.black,
          onPressed: onClose,
        ),
      ),
    );
  }
}
