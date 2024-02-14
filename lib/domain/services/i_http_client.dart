abstract class IHttpClient {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, {Map<String, dynamic>? body});
  // Otros métodos como delete, put, etc.
}