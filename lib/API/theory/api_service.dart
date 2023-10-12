import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thesis2/models/test_model.dart';

class APIService {
  static const String apiUrl = 'https://aiana.pythonanywhere.com';
  static const String categoriesEndpoint = '$apiUrl/categories';
  static const String testsEndpoint = '$apiUrl/tests';

  static Future<List<dynamic>> fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cachedCategories = prefs.getString('cachedCategories');

    if (cachedCategories != null) {
      // If cached data exists, return it
      final List<dynamic> categories = jsonDecode(cachedCategories);
      return categories;
    }

    final response = await http.get(Uri.parse(categoriesEndpoint));
    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      final categories = jsonDecode(responseBody);

      // Cache the fetched data
      await prefs.setString('cachedCategories', responseBody);

      return categories;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  static Future<List<TestModel>> fetchTests() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cachedTests = prefs.getString('cachedTests');

    if (cachedTests != null) {
      // If cached data exists, return it
      final List<TestModel> tests = (jsonDecode(cachedTests) as List<dynamic>)
          .map((test) => TestModel.fromJson(test))
          .toList();
      return tests;
    }

    final response = await http.get(Uri.parse(testsEndpoint));
    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      final tests = (jsonDecode(responseBody) as List<dynamic>)
          .map((test) => TestModel.fromJson(test))
          .toList();

      // Cache the fetched data
      await prefs.setString('cachedTests', responseBody);

      return tests;
    } else {
      throw Exception('Failed to fetch tests');
    }
  }

  static Future<List<TestModel>> fetchTestsByCategory(int category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cachedCategoryTests =
        prefs.getString('cachedCategoryTests$category');

    if (cachedCategoryTests != null) {
      // If cached data for the category exists, return it
      final List<TestModel> categoryTests =
          (jsonDecode(cachedCategoryTests) as List<dynamic>)
              .map((test) => TestModel.fromJson(test))
              .toList();
      return categoryTests;
    }

    final response = await http.get(Uri.parse(
        'https://aiana.pythonanywhere.com/testsbycategory/$category/'));
    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      final categoryTests = (jsonDecode(responseBody) as List<dynamic>)
          .map((test) => TestModel.fromJson(test))
          .toList();

      // Cache the fetched data for the category
      await prefs.setString('cachedCategoryTests$category', responseBody);

      return categoryTests;
    } else {
      throw Exception('Failed to fetch tests by category');
    }
  }
}
