import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/domain/entities/message.dart';
import 'package:oni_chat_gpt/presentation/providers/chat_provider.dart';
import 'package:oni_chat_gpt/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const name = 'chat-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ChatView(),
      drawer: const SideMenu(),
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (_, int index) {
              final message = chatProvider.messageList[index];
          
              return MessageBubble(
                fromWho: message.fromWho,
                message: message.text,
                indexMsj: index,
              );
            },
          ),
        ),
        if (chatProvider.loadingResponseOni) 
        MessageBubble(
          fromWho: FromWho.oni,
          message: '...',
          indexMsj: chatProvider.messageList.length-1,
        )
      ],
    );
  }
}
