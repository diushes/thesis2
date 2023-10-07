import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _lightTheme;
  ThemeData _darkTheme;
  bool _isDarkMode = false;

  ThemeProvider()
      : _lightTheme =
            ThemeData.light().copyWith(backgroundColor: mainThemeColor),
        // Use other default properties from the light theme

        _darkTheme = ThemeData.dark().copyWith(
          // Customize the properties in the dark theme as needed
          primaryColor: Colors.blueGrey, // Example customization
          hintColor: mainTextColor, // Example ctextustomization
          // Customize other properties as needed
        );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }
}
