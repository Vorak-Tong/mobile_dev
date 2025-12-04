class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String correctChoice;

  const Question({
    required this.id,
    required this.title,
    required this.choices,
    required this.correctChoice,
  });
}
