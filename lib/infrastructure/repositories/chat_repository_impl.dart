import 'package:oni_chat_gpt/domain/datasources/chat_message_datasource.dart';
import 'package:oni_chat_gpt/domain/entities/message.dart';
import 'package:oni_chat_gpt/domain/entities/session_thread.dart';
import 'package:oni_chat_gpt/domain/repositories/chat_message_repository.dart';

class ChatRepositiryImpl extends ChatMessageRepository {
  final ChatMessageDatasource chatMessageDatasource;

  ChatRepositiryImpl({
    required this.chatMessageDatasource,
  });

  @override
  Future<Message> getMessage(String question) {
    return chatMessageDatasource.getMessage(question);
  }

  @override
  Future<SessionThread> startSessionChat() {
    return chatMessageDatasource.startSessionChat();
  }
}
