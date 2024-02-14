import 'package:oni_chat_gpt/domain/entities/message.dart';
import 'package:oni_chat_gpt/domain/entities/session_thread.dart';

abstract class ChatMessageDatasource {
  Future<Message> getMessage(String question);
  Future<SessionThreadGPT> startSessionChat();
}