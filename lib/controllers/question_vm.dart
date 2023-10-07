import 'package:flutter/material.dart';
import 'package:thesis2/API/theory/api_service.dart';
import 'package:thesis2/models/test_model.dart';

class TestVM with ChangeNotifier {
  TestVM() {
    getTests();
  }

  List<TestModel> listOfTestModels = [];
  int numOfCorrectAns = 0;
  List<int> answeredQuestions = [];
  Map<int, List<dynamic>> categoryTests = {};
  List<int?> nonEmptyCategories = [];

  getTests() async {
    final response = APIService.fetchTests();
    listOfTestModels = await response;
    getNonEmptyCategories();
    await getCategoryTests();
    notifyListeners();
    print(categoryTests);
    return listOfTestModels;
  }

  getNonEmptyCategories() {
    nonEmptyCategories =
        listOfTestModels.map((test) => test.category).toSet().toList();
  }

  Future<void> getCategoryTests() async {
    for (final categoryId in nonEmptyCategories) {
      final response = await APIService.fetchTestsByCategory(categoryId!);
      final categoryTestList = await response;
      categoryTests[categoryId] = categoryTestList;
    }
    notifyListeners();
  }

  int findTestIndexByTitle(String title) {
    for (int i = 0; i < listOfTestModels.length; i++) {
      if (listOfTestModels[i].title == title) {
        return i;
      }
    }
    return -1; // Indicates test with given title was not found
  }

  List<Questions> getOurQuestionsById(int testId) {
    var questions = listOfTestModels[testId].questions;
    return questions ?? [];
  }

  getQuestionOption(int testId, int questionId) {
    var options = getOurQuestionsById(testId)[questionId].options;
    return options;
  }

  void checkAns(bool isCorrect, int questionId) {
    if (isCorrect) {
      numOfCorrectAns++;
    }
    answeredQuestions.add(questionId);
    notifyListeners();
  }

  bool isQuestionAnswered(int questionId) {
    notifyListeners();
    return answeredQuestions.contains(questionId);
  }

  void onClose() {
    numOfCorrectAns = 0;
    answeredQuestions.clear();
    notifyListeners();
  }
}
