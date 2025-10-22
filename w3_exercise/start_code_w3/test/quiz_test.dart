// import 'package:test/test.dart';

// main() {
//   test('My first test', () {
//     // Do something
//     int x = 2 + 2;

//     // Check something
//     expect(x, equals(4));
//   });
// }

import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "Capital of France?", choices: ["Paris", "London", "Rome"], goodChoice: "Paris");

  Question q2 =
      Question(title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4");

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(100));
  });

  test('All answers are quite good (50%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('All answers are quite good (50%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('All answers are quite good (50%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('All answers are quite good (50%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('All answers are bad (0%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('All answers are bad (0%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('All answers are bad (0%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('All answers are bad (0%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  
}