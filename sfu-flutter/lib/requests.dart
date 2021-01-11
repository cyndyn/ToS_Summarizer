import 'api_client.dart';

class Requests {
  static upload(String text, String keyword) async {
    final response = await APIClient.uploadText(text, keyword);
    if (response.statusCode == 200) {
      final parsed = response.body;
      return parsed;
    } else {
      print(response.statusCode);
    }
  }
}
