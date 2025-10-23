import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Player{
  final String name;
  List<Answer> answers = [];

  Player(this.name);

  void addAnswer(Answer answer){
    answers.add(answer);
  }

  Map<String, dynamic> toJson(){
    return {
      "name" : name,
      "answers" : answers.map((a) => a.toJson()).toList()
    };
  }
}

class Question{
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.points = 1,
    String? id,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "choices": choices,
      "goodChoice": goodChoice,
      "points": points
    };
  }
}

class Answer{
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    required this.questionId,
    required this.answerChoice,
    String? id,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "questionId": questionId,
      "answerChoice": answerChoice
    };
  }
}

class Submission {
  final String id;
  final Player player;

  Submission(this.player) : id = uuid.v4();

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "player" : player.toJson(),
    };
  }
} 

class Quiz{
  final String id;
  List<Question> questions;
  List<Submission> submissions = [];

  Quiz({required this.questions}) : id = uuid.v4();

  void addSubmission(Player player){
    for(int i = 0; i < submissions.length; i++){
      if(submissions[i].player.name == player.name){
        submissions.removeAt(i);
        break;
      }
    }
    submissions.add(Submission(player));
  }

  Player getPlayer(String name){
    for(var submission in submissions){
      if(submission.player.name == name){
        return submission.player;
      }
    }

    return Player(name);
  }
  Map<String, dynamic> calculateScore(String playerName){
    int totalScore = 0;
    int maxScore = 0;

    // find player submission
    for(var submission in submissions){
      if(submission.player.name == playerName){
        // calculate score for each answer by finding the questions and match with the good choice
        for(var answer in submission.player.answers){
          for(var question in questions){
            if(question.id == answer.questionId){
              maxScore += question.points;
              if(question.goodChoice == answer.answerChoice){
                totalScore += question.points;
              }
              break;
            }
          }
        }
        break;
      }
    }
    int percentage = 0;
    if(maxScore > 0){
      percentage = ((totalScore / maxScore) * 100).round();
    }

    return {
      "score" : totalScore,
      "percentage" : percentage,
    };
  }

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "questions" : questions.map((q) => q.toJson()).toList(),
      "submissions" : submissions.map((s) => s.toJson()).toList(),
    };
  }
}