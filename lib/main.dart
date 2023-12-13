import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/config/theme/app_theme.dart';

import 'presentation/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONI chat',
      theme: AppTheme().theme(),
      home: const ChatScreen(),
    );
  }
}