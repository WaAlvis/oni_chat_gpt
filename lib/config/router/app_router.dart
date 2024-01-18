import 'package:go_router/go_router.dart';
import 'package:oni_chat_gpt/presentation/chat/chat_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: ChatScreen.name,
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);
