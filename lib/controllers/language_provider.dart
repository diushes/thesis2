import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  void setCurrentLanguage(String language) {
    _currentLanguage = language;
    notifyListeners();
  }
}
