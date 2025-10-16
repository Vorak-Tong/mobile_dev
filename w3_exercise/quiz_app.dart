class Quiz{
  List<Answer> _answers = [];

  void addAnswer(Answer answer){
    _answers.add(answer);
  }

  int getScore(){
    return _answers.where((answer) => answer.isGoodAnswer()).length;
  }
}

class Question{
  String title;
  List<String> choices;
  String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice
  });
}

class Answer{
  String answerChoice;
  Question question;

  Answer({
    required this.answerChoice,
    required this.question
  });

  bool isGoodAnswer(){
    return answerChoice == question.goodChoice;
  }
}

void main() {
  var question1 = Question(
    title: "What is the capital of France?",
    choices: ["London", "Berlin", "Paris", "Madrid"],
    goodChoice: "Paris",
  );

  var question2 = Question(
    title: "What is 2 + 2?",
    choices: ["3", "4", "5", "6"],
    goodChoice: "4",
  );

  var correctAnswer = Answer(
    answerChoice: "Paris", 
    question: question1
  );
  
  var wrongAnswer = Answer(
    answerChoice: "London", 
    question: question1
  );

  var correctAnswer2 = Answer(
    answerChoice: "4", 
    question: question2
  );

  var quiz = Quiz();
  quiz.addAnswer(correctAnswer);
  quiz.addAnswer(wrongAnswer);
  quiz.addAnswer(correctAnswer2);

  print("Score: ${quiz.getScore()}");
}