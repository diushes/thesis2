import 'package:flutter/material.dart';
import 'package:thesis2/screens/quizzes/quizzespage.dart';
import 'package:thesis2/screens/theory/topicdetailpage.dart';
import 'package:thesis2/screens/theory/topicspage.dart';

import '../screens/quizzes/scorepage.dart';

final Map<String, WidgetBuilder> routes = {
  '/topics': (context) => TopicsPage(),
  '/topicDetail': (context) => TopicDetailsPage(),
  '/quizzes': (context) => QuizzesPage(),
};
