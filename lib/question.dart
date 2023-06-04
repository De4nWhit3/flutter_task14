class Question {
  final String question;
  final String answer;
  final String category;
  final String imageUrl;
  final List<String> hints;

  Question({
    required this.answer,
    required this.question,
    required this.category,
    required this.imageUrl,
    required this.hints,
  });

  (String, String, String, List<String>) getInfo() {
    return (question, answer, category, hints);
  }
}
