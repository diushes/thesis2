import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../controllers/question_vm.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.questionId,
    required this.testId,
  }) : super(key: key);

  final int questionId;
  final int testId;

  @override
  Widget build(BuildContext context) {
    final tests = context.watch<TestVM>();
    final options = tests.getQuestionOption(testId, questionId);
    final questionText = tests.getOurTestById(testId)[questionId].questionText;
    return Container(
      margin: const EdgeInsets.only(
          top: defaultPadding,
          bottom: defaultPadding * 3,
          left: defaultPadding,
          right: defaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              questionText ??
                  'Failed to fetch question', // Display question text
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              options.length,
              (index) => Option(
                text: options[index].optionText,
                index: index,
                isAnswered: tests.isQuestionAnswered(questionId),
                isCorrect: options[index].isCorrect,
                press: () {
                  tests.checkAns(options[index].isCorrect, questionId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
