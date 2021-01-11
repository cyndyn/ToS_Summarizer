import 'dart:convert';

import 'package:http/http.dart' as http;

const String _API_URL = 'http://localhost:5000';

class APIClient {
  static const headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<http.Response> uploadText(String text, String keyword) {
    final encoded =
        jsonEncode(<String, String>{'text': text, 'keyword': keyword});
    return http.post(
      _API_URL + '/upload',
      headers: headers,
      body: encoded,
    );
  }
}
