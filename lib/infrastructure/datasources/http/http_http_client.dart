import 'package:http/http.dart' as http;
import 'package:oni_chat_gpt/domain/services/i_http_client.dart';
import 'dart:convert';

class HttpHttpClient implements IHttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await http.post(Uri.parse(url), body: jsonEncode(body));
    return jsonDecode(response.body);
  }
}
