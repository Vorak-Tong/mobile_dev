import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;
  QuizRepository(this.filePath);

  Quiz readQuiz(){
    final file = File(filePath);
    final String content = file.readAsStringSync();
    final Map<String, dynamic> data = jsonDecode(content);

    // create question from json
    List<Question> questions = [];
    for(var q in data['questions']){
      questions.add(Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: q['points'],
      ));
    }

    Quiz quiz = Quiz(questions: questions); // create the quiz with question
    if(data['submissions'] != null){
      for(var s in data['submissions']){
        Player player = Player(s['player']['name']);
        for(var a in s['player']['answers']){
          player.answers.add(Answer(
            id: a['id'],
            questionId: a['questionId'],
            answerChoice: a['answerChoice'],
          ));
        }
        quiz.submissions.add(Submission(player));
      }
    }
    return quiz;
  }

  void writeQuiz(Quiz quiz){
    final Map<String, dynamic> data = quiz.toJson();

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String jsonString = encoder.convert(data);

    final file = File(filePath);
    file.writeAsString(jsonString);
  }
}