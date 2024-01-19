import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/config/router/app_router.dart';
import 'package:oni_chat_gpt/config/theme/app_theme.dart';
import 'package:oni_chat_gpt/infrastructure/datasources/onr_db_datasource.dart';
import 'package:oni_chat_gpt/infrastructure/repositories/chat_repository_impl.dart';
import 'package:oni_chat_gpt/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final chatRepositiryImpl =
        ChatRepositiryImpl(chatMessageDatasource: OnrDbDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => ChatProvider(chatRepositiryImpl: chatRepositiryImpl)..newSessionChat(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ONI chat',
        theme: AppTheme().theme(),
        routerConfig: appRouter,
      ),
    );
  }
}
