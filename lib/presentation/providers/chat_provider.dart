import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.user);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      oniReply();
    }

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

  int countMessage = 0;
  Future<void> oniReply() async {
    await Future.delayed(const Duration(milliseconds: 800));

    countMessage == 3 ? countMessage = 0 : countMessage;
    messageList.add(msjRamdomOni[countMessage]);
    countMessage++;

    notifyListeners();
    moveScrollToBottom();
  }

  List<Message> msjRamdomOni = [
    Message(
        text: 'Ipsum proident velit consectetur consectetur veniam eu irure.',
        fromWho: FromWho.oni),
    Message(
        text:
            'Sint nulla ad incididunt culpa ut. Non ad laborum pariatur cillum adipisicing duis velit ut culpa adipisicing deserunt irure culpa. Laboris eiusmod id duis quis laborum nulla consectetur adipisicing non reprehenderit. Cupidatat tempor sit proident consectetur nostrud anim minim ea pariatur. Ipsum proident velit consectetur consectetur veniam eu irure.',
        fromWho: FromWho.oni),
    Message(
        text:
            '''Sint nulla ad incididunt culpa ut. Non ad laborum pariatur cillum adipisicing duis velit ut culpa adipisicing deserunt irure culpa. Laboris eiusmod id duis quis laborum nulla consectetur adipisicing non reprehenderit. Cupidatat tempor sit proident consectetur nostrud anim minim ea pariatur. Ipsum proident velit consectetur consectetur veniam eu irure.

Quis est mollit est ut veniam laboris nulla tempor labore et et ad. Id voluptate mollit sunt incididunt irure. Sint cupidatat ipsum dolore proident commodo occaecat magna voluptate deserunt Lorem dolore veniam. Esse fugiat exercitation deserunt nostrud. Laboris velit ipsum amet veniam labore minim excepteur dolor ut aliquip eu anim minim quis.

Adipisicing et culpa adipisicing labore aliquip proident eiusmod excepteur duis excepteur reprehenderit nostrud ipsum ut. Deserunt dolore exercitation aliqua cillum aliqua occaecat nisi sint voluptate excepteur. Deserunt sunt ex magna adipisicing non velit anim dolore.

Adipisicing dolor elit laborum deserunt in velit nisi. Ut proident commodo aliqua id irure. Occaecat consectetur est est quis non aliquip pariatur ipsum ex proident mollit culpa. Laborum laborum id exercitation id ipsum nostrud sint sunt duis. Mollit amet velit labore proident esse.

Aliquip cillum proident veniam irure sunt minim culpa cupidatat. Sint magna eu consectetur nulla officia cillum esse. Occaecat in commodo dolor nulla labore. Qui do non do est consectetur ipsum officia.''',
        fromWho: FromWho.oni),
  ];
}
