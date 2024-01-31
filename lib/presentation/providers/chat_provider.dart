import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/infrastructure/repositories/chat_repository_impl.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepositiryImpl chatRepositiryImpl;
  bool isLoading = false;

  ChatProvider({
    required this.chatRepositiryImpl,
  });

  final chatScrollController = ScrollController();

  List<Message> messageList = [];

  Future<void> newSessionChat() async {
    // get ids Sessions (assitant and thread)
    await chatRepositiryImpl.startSessionChat();
  }

  void newChatOni() async {
    isLoading = false;
    messageList.clear();
    newSessionChat();
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.user);
    messageList.add(newMessage);

    oniReply(text);

    notifyListeners();
    // moveScrollToBottom();
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
    isLoading = true;

    final loadingMsgOni = Message(text: '...', fromWho: FromWho.oni);
    messageList.add(loadingMsgOni);

    moveScrollToBottom();
    notifyListeners();

    final Message newMessageOni = await chatRepositiryImpl.getMessage(question);
    print('*** Se obtuvo respuesta de ONI ***');

    // Validacion para el primer mensaje despues del reinicio del Chat
    if (messageList.length >= 2) {
      messageList.removeLast(); // Remove the loading ONI
      messageList.add(newMessageOni);
      moveScrollToBottom();
    }

    isLoading = false;

    notifyListeners();
  }
}

//sugerencia chat GPT
// Future<void> oniReply(String question) async {
//   isLoading = true;

//   final loadingMsgOni = Message(text: '...', fromWho: FromWho.oni);

//   if (!chatReset) {
//     messageList.add(loadingMsgOni);
//     moveScrollToBottom();
//     notifyListeners();
//   }

//   final Message newMessageOni = await chatRepositiryImpl.getMessage(question);

//   if (!chatReset) {
//     messageList.removeLast(); // Remove the loading message
//     messageList.add(newMessageOni);
//     moveScrollToBottom();
//   }

//   isLoading = false;
//   chatReset = false; // Reset the chat reset flag

//   notifyListeners();
// }
