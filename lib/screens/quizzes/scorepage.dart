import 'package:flutter/material.dart';
import 'package:thesis2/elements/appbar.dart';

import '../../config/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final int numOfCorrectAnswers;

  const ResultScreen({Key? key, required this.numOfCorrectAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor, // Set the desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of Correct Answers:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              numOfCorrectAnswers.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/quizzes");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryThemeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                "Finish",
                style: TextStyle(color: mainTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
