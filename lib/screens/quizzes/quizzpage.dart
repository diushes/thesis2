import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/config/constants.dart';
import 'package:thesis2/controllers/question_controller.dart';
import 'package:thesis2/controllers/question_vm.dart';
import '../../elements/quizzes/progressbar.dart';
import '../../elements/quizzes/questioncard.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {}, // _questionController.nextQuestion,
                child: const Text("Skip"))
          ],
        ),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //   child: progressBar(),
          // ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text.rich(
              TextSpan(
                text:
                    "Question 1", //${_questionController.questionNumber.value}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: mainTextColor),
                children: [
                  TextSpan(
                    text: "4",
                  ) // "/${_questionController.questions.length}")
                ],
              ),
            ),
          ),

          const Divider(thickness: 1.5),
          const SizedBox(height: kDefaultPadding),
          Expanded(
              child: ChangeNotifierProvider(
                create: (context) => TestVM(),
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // controller: _questionController.pageController,
                    // onPageChanged: _questionController.updateTheQnNum,
                    itemCount: 4, // _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(question: )
                       ),
              )) //_questionController.questions[index]))))
        ])));
  }
}
