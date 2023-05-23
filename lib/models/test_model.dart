class TestModel {
  int? id;
  List<Questions>? questions;
  String? title;
  int? category;

  TestModel({this.id, this.questions, this.title, this.category});

  TestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    title = json['title'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['category'] = category;
    return data;
  }
}

class Questions {
  int? id;
  List<Options>? options;
  String? questionText;
  int? test;

  Questions({this.id, this.options, this.questionText, this.test});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    questionText = json['question_text'];
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['question_text'] = questionText;
    data['test'] = test;
    return data;
  }
}

class Options {
  int? id;
  String? optionText;
  bool? isCorrect;
  int? question;

  Options({this.id, this.optionText, this.isCorrect, this.question});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionText = json['option_text'] ?? 'Invalid';
    isCorrect = json['is_correct'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['option_text'] = optionText;
    data['is_correct'] = isCorrect;
    data['question'] = question;
    return data;
  }
}
