import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis2/config/app_colors.dart';
import 'package:thesis2/config/constants.dart';
import 'package:thesis2/controllers/question_controller.dart';
import '../../elements/quizzes/progressbar.dart';
import '../../elements/quizzes/questioncard.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: _questionController.nextQuestion,
                child: Text("Skip"))
          ],
        ),
        body: Stack(children: [
          SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: progressBar(),
                ),
                SizedBox(height: kDefaultPadding),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(() => Text.rich(TextSpan(
                            text:
                                "Question ${_questionController.questionNumber.value}",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: mainTextColor),
                            children: [
                              TextSpan(
                                  text:
                                      "/${_questionController.questions.length}")
                            ])))),
                Divider(thickness: 1.5),
                SizedBox(height: kDefaultPadding),
                Expanded(
                    child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateTheQnNum,
                        itemCount: _questionController.questions.length,
                        itemBuilder: ((context, index) => QuestionCard(
                            question: _questionController.questions[index]))))
              ]))
        ]));
  }
}
