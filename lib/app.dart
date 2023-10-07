import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/controllers/question_vm.dart';
import 'package:thesis2/routes/routes.dart';
import 'controllers/language_provider.dart';
import 'controllers/theme_provider.dart';
import 'elements/bottombar.dart';
import 'screens/theory/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBottomNavBar = MyBottomNavBar(selectedIndex: 0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestVM()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.getCurrentTheme(),
            home: MyHomePage(
              bottomNavBar: myBottomNavBar,
            ),
            routes: routes,
          );
        },
      ),
    );
  }
}
