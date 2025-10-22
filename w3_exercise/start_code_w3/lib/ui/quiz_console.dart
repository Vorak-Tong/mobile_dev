import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while(true){
      stdout.write('Your name: ');
      String? playerName = stdin.readLineSync();

      if(playerName == null || playerName.isEmpty){
        print('No name entered. Ending the quiz...');
        break;
      }

      quiz.resetAnswers();

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          quiz.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      
      int score = quiz.getScoreInPercentage();
      int point = quiz.getTotalPoint();
      quiz.savePlayerScore(playerName);

      print('${playerName}, your score in percentage: $score%');
      print('${playerName}, your score in percentage: $point');

      quiz.getAllPlayerScores().forEach((name, player){
        print('Player: ${player.name}         Score: ${player.scoreInPoints}');
      });
    }
  }
}
