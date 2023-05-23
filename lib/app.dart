import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis2/routes/routes.dart';
import 'elements/bottombar.dart';
import 'screens/theory/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final myBottomNavBar = MyBottomNavBar(selectedIndex: 0);
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(bottomNavBar: myBottomNavBar),
      routes: routes,
    );
  }
}
