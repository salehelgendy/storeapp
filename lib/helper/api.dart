import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
  }) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'There is a problem with status code ${response.statusCode} with body ${response.body}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    http.Response response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'There is a problem with status code ${response.statusCode} with body ${response.body}',
      );
    }
  }
}
