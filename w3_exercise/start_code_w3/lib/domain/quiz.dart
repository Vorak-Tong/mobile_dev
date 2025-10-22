class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  int points;
  Question({required this.title, required this.choices, required this.goodChoice, this.points = 1});
}

class Answer{
  final Question question;
  final String answerChoice;
  

  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  List<Question> questions;
  List <Answer> answers =[];
  Map<String, Player> players = {};

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

  int getScoreInPercentage(){
    int totalSCore =0;
    for(Answer answer in answers){
      totalSCore += answer.question.points;
    }
    return ((getTotalPoint() / totalSCore)*100).toInt();
  }

  int getTotalPoint(){
    int scores = 0;
    for(Answer answer in answers){
      if(answer.isGood()){
        scores += answer.question.points;
      }
    }
    return scores;
  }

  void savePlayerScore(String playerName){
    int points = getTotalPoint();
    int percentages = getScoreInPercentage();

    players[playerName] = Player(
      name: playerName,
      scoreInPoints: points,
      scoreInPercentage: percentages
    );
  }

  Map<String, Player> getAllPlayerScores(){
    return players;
  }

  void resetAnswers(){
    answers.clear();
  }
}

class Player{
  final String name;
  int scoreInPoints;
  int scoreInPercentage;

  Player({required this.name, this.scoreInPoints = 0, this.scoreInPercentage = 0});
}