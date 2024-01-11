import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/presentation/providers/chat_provider.dart';
import 'package:oni_chat_gpt/presentation/widgets/message_bubble.dart';
import 'package:provider/provider.dart';

import '../widgets/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: chatProvider.messageList.isEmpty
                  ? const EmptyChatOni()
                  : const ChatListOni(),
            ),
            const SizedBox(
              height: 40,
            ),
            /// Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

class EmptyChatOni extends StatelessWidget {
  const EmptyChatOni({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: ClipOval(
            child: Image.asset('assets/images/oni.gif'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Hi I\'m ONI!\nHow can I help you today?',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class ChatListOni extends StatelessWidget {
  const ChatListOni({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return ListView.builder(
      itemCount: chatProvider.messageList.length,
      itemBuilder: (_, int index) {
        final message = chatProvider.messageList[index];

        return MessageBubble(
          fromWho: message.fromWho,
          message: message.text,
        );
      },
    );
  }
}

