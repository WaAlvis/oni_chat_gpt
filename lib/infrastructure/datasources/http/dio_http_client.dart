import 'package:dio/dio.dart';
import 'package:oni_chat_gpt/domain/services/i_http_client.dart';

class DioHttpClient implements IHttpClient {
  final Dio _dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    final response = await _dio.get(url);
    return response.data;
  }

  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await _dio.post(url, data: body);
    return response.data;
  }
}
