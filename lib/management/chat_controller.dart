import 'package:flutter/cupertino.dart';

class ChatController with ChangeNotifier {
  late bool isOpen = false;

  void changeState({bool? value}) {
    final _value = value ?? !isOpen;
    isOpen = _value;
    notifyListeners();
  }
}
