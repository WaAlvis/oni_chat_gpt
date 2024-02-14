import 'package:oni_chat_gpt/domain/datasources/chat_message_datasource.dart';
import 'package:oni_chat_gpt/domain/entities/message.dart';
import 'package:oni_chat_gpt/domain/entities/session_thread.dart';
import 'package:oni_chat_gpt/infrastructure/mappers/message_oni.dart';
import 'package:oni_chat_gpt/infrastructure/mappers/session_mapper.dart';
import 'package:oni_chat_gpt/infrastructure/models/onrDB/session_onr.dart';
import 'package:dio/dio.dart';

class OnrDbDatasource extends ChatMessageDatasource {
  final dio = Dio(BaseOptions(
    // baseUrl: 'http://localhost:3000/api/v1', // local
    baseUrl: 'http://aws-oni-back-dev-env.eba-q6pdvkec.us-east-1.elasticbeanstalk.com/api/v1',
  ));
  final String assitantId = 'asst_xsWGv7zVctrFJLoefNxfu82l';
  late SessionOnr session;

  @override
  Future<Message> getMessage(String question) async {
    Map<String, dynamic> cuerpo = {
    "userMessage": question
};

    final response = await dio.post(
      '/assistant/runAssistant/${session.assistantId}/${session.threadId}',
      data: cuerpo,
    );
    return MessageOni.messageToEntity(response.data);
  }

  @override
  Future<SessionThreadGPT> startSessionChat() async {
    final response = await dio.post('/assistant/createSession/$assitantId');

    session = SessionOnr.fromJson(response.data);
    // print('Session: ${session.threadId}');
    return SessionMapper.sessionToEntity(session);
  }
}
