import 'package:flutter/material.dart';
import 'package:thesis2/screens/quizzes/quizzespage.dart';
import 'package:thesis2/screens/settings.dart';
import 'package:thesis2/screens/theory/topicdetailpage.dart';
import 'package:thesis2/screens/theory/topicspage.dart';
import '../elements/bottombar.dart';

final Map<String, WidgetBuilder> routes = {
  '/topics': (context) {
    return TopicsPage(
      bottomNavBar: MyBottomNavBar(selectedIndex: 0),
      category: ModalRoute.of(context)!.settings.arguments,
    );
  },
  '/topicDetail': (context) {
    return TopicDetailsPage(
        bottomNavBar: MyBottomNavBar(selectedIndex: 0),
        topic: ModalRoute.of(context)!.settings.arguments);
  },
  '/quizzes': (context) =>
      QuizzesPage(bottomNavBar: const MyBottomNavBar(selectedIndex: 1)),
  "/settings": (context) =>
      SettingsPage(bottomNavBar: const MyBottomNavBar(selectedIndex: 3))
};
