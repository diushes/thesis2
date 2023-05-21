import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/controllers/question_controller.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text("Score",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: mainTextColor)),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: mainTextColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
