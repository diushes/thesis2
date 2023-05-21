import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/todos/';
  static const String categoriesEndpoint = '$apiUrl/categories';

  static Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}
