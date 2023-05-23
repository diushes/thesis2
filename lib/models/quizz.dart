class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];

class Quiz {
  final String title;
  final String category;

  Quiz({required this.title, required this.category});
}

List<Quiz> generateQuizzes() {
  List<Quiz> quizzes = [];

  quizzes.add(Quiz(title: "Quiz 1", category: "Category A"));
  quizzes.add(Quiz(title: "Quiz 2", category: "Category B"));
  quizzes.add(Quiz(title: "Quiz 3", category: "Category A"));
  quizzes.add(Quiz(title: "Quiz 4", category: "Category C"));
  quizzes.add(Quiz(title: "Quiz 5", category: "Category B"));

  return quizzes;
}
