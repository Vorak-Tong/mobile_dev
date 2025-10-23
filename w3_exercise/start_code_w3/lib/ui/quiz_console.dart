import "dart:io";
import "../domain/quiz.dart";

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz(){
    print('--- Welcome to the Quiz --- \n');

    while(true){
      stdout.write("Your name: ");
      String? playerName = stdin.readLineSync();

      if(playerName == null || playerName.isEmpty){
        print('No name entered. Ending the quiz...');
        break;
      }

      Player player = quiz.getPlayer(playerName); // get or create player and if any previous answers, clear
      player.answers.clear(); 

      for(var question in quiz.questions){
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(questionId: question.id, answerChoice: userInput);
          player.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }
        print('');
      }

      quiz.addSubmission(player);
      
      var scores = quiz.calculateScore(playerName);
      print('$playerName, your score: ${scores["score"]} points');
      print('$playerName, your percentage: ${scores["percentage"]}%');
      print('');
    }
  }
}