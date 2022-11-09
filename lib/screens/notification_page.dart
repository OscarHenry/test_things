import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final notifications = List.generate(15, (index) => 'index$index');

  AnimatedListState? get list => _listKey.currentState;

  @override
  void initState() {
    notifications.mapIndexed((index, element) {
      list!.insertItem(index);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void removeAll() {
    for (int index = 0; index < (notifications.length); index++) {
      list!.removeItem(
        index,
        (context, animation) => slideIt(
          context,
          index,
          animation,
          hasReverse: true,
        ),
      );
      notifications.removeAt(index);
    }
  }

  void remove({int? position}) {
    final index = position ?? notifications.length;
    notifications.removeAt(index);
    list!.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        return slideIt(context, index, animation, hasReverse: true);
      },
    );
  }

  void insert({required String value, int? position}) {
    final index = position ?? 0;
    notifications.insert(index, value);
    list!.insertItem(index);
  }

  Widget slideIt(BuildContext context, int index, animation,
      {bool hasReverse = false}) {
    final notification = notifications.elementAt(index);
    return SlideTransition(
      position: Tween<Offset>(
        begin: hasReverse ? Offset.zero : const Offset(-1, 0),
        end: hasReverse ? const Offset(1, 0) : Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut,
        ),
      ),
      child: ListTile(
        title: Text(notification),
        trailing: IconButton(
          onPressed: () => remove(position: index),
          icon: const Icon(CupertinoIcons.delete),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text('Notifications'),
        titleTextStyle: const TextStyle(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () => removeAll(),
            icon: const Icon(
              Icons.clear_all_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: notifications.length,
        itemBuilder: (context, index, animation) {
          return slideIt(context, index, animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => insert(value: Random().nextDouble().toString()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
