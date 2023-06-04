class Question {
  final String question;
  final String answer;
  final String category;
  final List<String> hints;

  Question({
    required this.answer,
    required this.hints,
    required this.question,
    required this.category,
  });

  (String, String, String, List<String>) getInfo() {
    return (question, answer, category, hints);
  }
}
