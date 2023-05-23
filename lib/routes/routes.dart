import 'package:flutter/material.dart';
import 'package:thesis2/screens/quizzes/quizzespage.dart';
import 'package:thesis2/screens/quizzes/quizzpage.dart';
import 'package:thesis2/screens/theory/topicdetailpage.dart';
import 'package:thesis2/screens/theory/topicspage.dart';
import '../elements/bottombar.dart';

final Map<String, WidgetBuilder> routes = {
  '/topics': (context) =>
      const TopicsPage(bottomNavBar: MyBottomNavBar(selectedIndex: 0)),
  '/topicDetail': (context) =>
      const TopicDetailsPage(bottomNavBar: MyBottomNavBar(selectedIndex: 0)),
  '/quizzes': (context) =>
      QuizzesPage(bottomNavBar: const MyBottomNavBar(selectedIndex: 1)),
  "/quiz": (context) => const QuizPage()
};
