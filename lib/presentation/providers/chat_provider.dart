import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/domain/datasources/chat_message_datasource.dart';
import 'package:oni_chat_gpt/domain/repositories/chat_message_repository.dart';
import 'package:oni_chat_gpt/infrastructure/repositories/chat_repository_impl.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepositiryImpl chatRepositiryImpl;

  ChatProvider({
    required this.chatRepositiryImpl,
  });

  final chatScrollController = ScrollController();

  List<Message> messageList = [];

  Future<void> newSessionChat() async {
    // get ids Sessions (assitant and thread)
    await chatRepositiryImpl.startSessionChat();
  }

  Future<void> newChatOni() async {
    messageList.clear();
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.user);
    messageList.add(newMessage);

    oniReply(text);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<void> oniReply(String question) async {
    final Message newMessageOni = await chatRepositiryImpl.getMessage(question);

    messageList.add(newMessageOni);

    notifyListeners();
    moveScrollToBottom();
  }
}
