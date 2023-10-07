import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/languages.dart';
import '../controllers/language_provider.dart';
import '../controllers/theme_provider.dart';
import '../elements/appbar.dart';
import '../elements/bottombar.dart';

class SettingsPage extends StatelessWidget {
  final MyBottomNavBar bottomNavBar;

  const SettingsPage({Key? key, required this.bottomNavBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: MyAppBar(
        context: context,
        hasBackButton: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Theme'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.setDarkMode(value);
              },
            ),
          ),
          Divider(), // Divider for separating sections
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton<String>(
              value: languageProvider.currentLanguage,
              onChanged: (String? languageCode) {
                languageProvider.setCurrentLanguage(languageCode!);
              },
              items: languageOptions.map((language) {
                return DropdownMenuItem<String>(
                  value: language['code'],
                  child: Text(language['name']!),
                );
              }).toList(),
            ),
          ),
          Divider(), // Divider for separating sections
          ListTile(
            title: Text('Contacts'),
            // Add your contacts section here
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
