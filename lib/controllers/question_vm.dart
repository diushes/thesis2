import 'package:flutter/material.dart';
import 'package:thesis2/API/theory/api_service.dart';
import 'package:thesis2/models/test_model.dart';

class TestVM with ChangeNotifier {
  final Future<List<TestModel>> listOfTestModels = APIService.fetchTests();

  // Questions getOurQuestionById () async{
  //   return await listOfTestModels;
  // }

  void onClose() {
    // super.onClose();
    // _animationController.dispose();
    // _pageController.dispose();
  }

  void checkAns(Questions question, int selectedIndex) {
    // _isAnswered = true;
    // _correctAns = question.answer;
    // _selectedAns = selectedIndex;

    // if (_correctAns == _selectedAns) _numOfCorrectAns++;
    // _animationController.stop();
    // update();
    // Future.delayed(Duration(seconds: 3), () {
    //   nextQuestion();
    // });
  }
}
