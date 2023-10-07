import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/config/constants.dart';
import 'package:thesis2/controllers/question_vm.dart';
import 'package:thesis2/elements/appbar.dart';
import 'package:thesis2/screens/quizzes/scorepage.dart';
import '../../elements/quizzes/questioncard.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    Key? key,
    required this.testId,
  }) : super(key: key);

  final int testId;

  @override
  Widget build(BuildContext context) {
    final tests = context.watch<TestVM>();
    final questions = tests.getOurTestById(testId);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(context: context, hasBackButton: true),
      body: Container(
        color: mainThemeColor, // Set the desired background color
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    testId: testId,
                    questionId: index,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: kDefaultPadding * 2, right: kDefaultPadding),
                alignment: Alignment.bottomRight,
                child: Button1(tests: tests),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  const Button1({
    Key? key,
    required this.tests,
  }) : super(key: key);

  final TestVM tests;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                numOfCorrectAnswers: tests.numOfCorrectAns,
              ),
            ),
          ).then((_) {
            // Perform cleanup or closing operations here
            tests.onClose();
          });
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0), // Adjust the border radius as desired
        ),
      ),
      child: const Text(
        'Submit',
        style: TextStyle(color: mainTextColor),
      ),
    );
  }
}
