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
  Map<int?, String?> nonEmptyCategories = {}; // Updated type
  Map<String?, List<dynamic>> categoryTests = {}; // Updated type

  getTests() async {
    final response = APIService.fetchTests();
    listOfTestModels = await response;
    getNonEmptyCategories();
    await getCategoryTests();
    notifyListeners();
    return listOfTestModels;
  }

  getNonEmptyCategories() {
    listOfTestModels.forEach((test) {
      nonEmptyCategories[test.category] = test.category_title;
    });
  }

  Future<void> getCategoryTests() async {
    for (final entry in nonEmptyCategories.entries) {
      final categoryId = entry.key;
      final categoryTitle = entry.value;
      final response = await APIService.fetchTestsByCategory(categoryId!);
      final categoryTestList = await response;
      categoryTests[categoryTitle] = categoryTestList;
    }
    notifyListeners();
  }

  List<Questions> getOurTestById(int testId) {
    var questions = listOfTestModels[testId].questions;
    return questions ?? [];
  }

  getQuestionOption(int testId, int questionId) {
    var options = getOurTestById(testId)[questionId].options;
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
