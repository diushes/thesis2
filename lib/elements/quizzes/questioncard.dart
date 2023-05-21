import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis2/controllers/question_controller.dart';
import '../../config/constants.dart';
import '../../models/quizz.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question.options.length,
              (index) => Option(
                  text: question.options[index],
                  index: index,
                  press: () => _controller.checkAns(question, index)))
        ],
      ),
    );
  }
}
