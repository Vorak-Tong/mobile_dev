import 'answer.dart';
import 'question.dart';

class Submission{
  final List<Answer> answers;
  final DateTime timestamp;

  Submission({
    required this.answers,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  // cal score
  int getScore(List<Question> questions){
    int score = 0;
    for(var answer in answers){
      final question = questions.firstWhere((q) => q.id == answer.questionId);
      if(answer.isCorrect(question.correctChoice)){
        score++;
      }
    }
    return score;
  }
}