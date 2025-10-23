import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

void main(){
  Question q1 = Question(
    title: "Capital of France?", 
    choices: ["Paris", "London", "Rome"], 
    goodChoice: "Paris",
    points: 50,
  );

  Question q2 = Question(
    title: "2 + 2 = ?", 
    choices: ["2", "4", "5"], 
    goodChoice: "4",
    points: 50,
  );

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers are good (100%)', () {
    Player player = Player('TestPlayer');
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "4"));

    quiz.addSubmission(player);
    var scores = quiz.calculateScore('TestPlayer');

    expect(scores['percentage'], equals(100));
    expect(scores['score'], equals(100));
  });

  
  test('One good answer, One bad answer (50%)', () {
    Player player = Player('TestPlayer2');
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));

    quiz.addSubmission(player);
    var scores = quiz.calculateScore('TestPlayer2');

    expect(scores['percentage'], equals(50));
    expect(scores['score'], equals(50));
  });

  
  test('All answers are bad (0%)', () {
    Player player = Player('TestPlayer3');
    player.addAnswer(Answer(questionId: q1.id, answerChoice: "London"));
    player.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));

    quiz.addSubmission(player);
    var scores = quiz.calculateScore('TestPlayer3');

    expect(scores['percentage'], equals(0));
    expect(scores['score'], equals(0));
  });
}