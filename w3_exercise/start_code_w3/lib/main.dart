 import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quizRepository.dart';

void main() {
  try{
    QuizRepository repository = QuizRepository('data/quiz_data.json');
    Quiz quiz = repository.readQuiz();

    print('Quiz loaded successful');

    QuizConsole console = QuizConsole(quiz: quiz);
    console.startQuiz();

    repository.writeQuiz(quiz);
    print('Quiz saved successful');
  }
  catch(e){
    print('Error');
    print('Creating default quiz...');

    List<Question> questions = [
      Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        points: 50,
      ),
      Question(
        title: "2 + 2 = ?", 
        choices: ["2", "4", "5"], 
        goodChoice: "4",
        points: 50,
      ),
    ];

    Quiz quiz = Quiz(questions: questions);
    QuizConsole console = QuizConsole(quiz: quiz);
    console.startQuiz();
  }
}
