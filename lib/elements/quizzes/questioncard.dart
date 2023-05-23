import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/controllers/question_vm.dart';
import 'package:thesis2/models/test_model.dart';
import '../../config/constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.questionId,
  }) : super(key: key);

  final int questionId;

  @override
  Widget build(BuildContext context) {
    final tests = context.read<TestVM>().listOfTestModels;
    // QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            tests[0].questions.where((id) => questionId,// question.questionText ?? 'Failed fetch', //Сам вопрос
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options!.length,
            (index) => Option(
              text: question.options?[index].optionText ?? '',
              index: index,
              press: () {},
            ),
          ), //_controller.checkAns(question, index)))
        ],
      ),
    );
  }
}
