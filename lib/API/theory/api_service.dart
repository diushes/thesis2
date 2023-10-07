import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thesis2/models/test_model.dart';

class APIService {
  static const String apiUrl = 'https://aiana.pythonanywhere.com';
  static const String categoriesEndpoint = '$apiUrl/categories';
  static const String testsEndpoint = '$apiUrl/tests';

  static Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoriesEndpoint));
    if (response.statusCode == 200) {
      final responseBody =
          utf8.decode(response.bodyBytes); // Decode response body as UTF-8
      return jsonDecode(responseBody);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  static Future<List<TestModel>> fetchTests() async {
    final response = await http.get(Uri.parse(testsEndpoint));
    if (response.statusCode == 200) {
      final responseBody =
          utf8.decode(response.bodyBytes); // Decode response body as UTF-8
      final jsonList = jsonDecode(responseBody);
      final tests = <TestModel>[];

      for (var i in jsonList) {
        tests.add(TestModel.fromJson(i));
      }
      return tests;
    } else {
      throw Exception('Failed to fetch tests');
    }
  }

  static Future<List<dynamic>> fetchTestsByCategory(int category) async {
    final response = await http.get(Uri.parse(
        'https://aiana.pythonanywhere.com/testsbycategory/$category/'));
    if (response.statusCode == 200) {
      final responseBody =
          utf8.decode(response.bodyBytes); // Decode response body as UTF-8
      final jsonData = jsonDecode(responseBody);
      return jsonData as List<dynamic>;
    } else {
      throw Exception('Failed to fetch tests by category');
    }
  }

  static Future<List<dynamic>> fetchTestsAndCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> tests;

    // Check if tests are already cached
    if (prefs.containsKey('cachedTests')) {
      String cachedData = prefs.getString('cachedTests')!;
      tests = jsonDecode(cachedData);
    } else {
      // Fetch tests from the API
      tests = await APIService.fetchTests();

      // Cache the fetched tests
      String jsonData = jsonEncode(tests);
      await prefs.setString('cachedTests', jsonData);
    }

    return tests;
  }
}
