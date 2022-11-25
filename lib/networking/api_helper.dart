import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future getRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body;
    }
    return null;
  }
}
