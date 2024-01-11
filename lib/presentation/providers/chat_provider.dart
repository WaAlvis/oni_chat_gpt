import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola como vas?', fromWho: FromWho.user),
    // Message(text: 'Que hora es en Canada?', fromWho: FromWho.user),
    Message(text: 'Que hora es en Canada?', fromWho: FromWho.oni)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.user);
    messageList.add(newMessage);

    notifyListeners();
  }
}
