class Answer{
  final String questionId;
  final String userChoice;

  const Answer({
    required this.questionId,
    required this.userChoice
  });

  bool isCorrect(String correctChoice){
    return userChoice == correctChoice;
  }
}