import 'package:oni_chat_gpt/domain/entities/session_thread.dart';
import 'package:oni_chat_gpt/infrastructure/models/onrDB/session_onr.dart';

class SessionMapper {
  static SessionThread sessionToEntity(SessionOnr session) => SessionThread(
        assitantId: session.assistantId,
        threadId: session.threadId,
      );
}
