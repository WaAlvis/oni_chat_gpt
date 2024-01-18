import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('New Chat with ONI'),
              onTap: () {
                chatProvider.newChatOni();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
