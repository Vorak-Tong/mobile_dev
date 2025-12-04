import 'question.dart';
import 'submission.dart';

class Quiz{
  final String title;
  final List<Question> questions;
  final List<Submission> submissions = [];

  Quiz({
    required this.title,
    required this.questions,
  });

  void addSubmission(Submission submission){
    submissions.add(submission);
  }
}