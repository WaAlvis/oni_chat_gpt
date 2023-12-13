import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/presentation/widgets/message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return (index % 2 == 0)?
                   MessageBubble(sender: Sender.user,):
                   MessageBubble(sender: Sender.oni,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
