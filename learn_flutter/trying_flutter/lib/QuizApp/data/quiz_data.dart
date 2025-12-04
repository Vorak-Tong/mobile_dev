import '../models/quiz.dart';
import '../models/question.dart';

final Quiz myQuiz = Quiz(
  title: "Flutter Quiz",
  questions: const [
    Question(
      id: 'q1',
      title: 'Who is the best teacher?',
      choices: ['Ronan', 'Hongly', 'Leangsiv'],
      correctChoice: 'Ronan',
    ),
    Question(
      id: 'q2',
      title: 'What is the best color?',
      choices: ['Blue', 'Red', 'Green'],
      correctChoice: 'Blue',
    ),
    Question(
      id: 'q3',
      title: 'What is the best course?',
      choices: ['Java', 'C++', 'Flutter'],
      correctChoice: 'Flutter',
    ),
  ],
);