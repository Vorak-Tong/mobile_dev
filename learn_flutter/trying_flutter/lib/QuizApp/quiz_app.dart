import 'package:flutter/material.dart';
import 'data/quiz_data.dart'; 
import 'models/answer.dart';
import 'models/submission.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';
import 'ui/screens/history_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String activeScreen = 'start-screen';
  int currentQuestionIndex = 0;
  List<Answer> currentAnswers = []; 
  List<Submission> submissionHistory = [];

  void startQuiz() {
    setState(() {
      currentAnswers = [];
      currentQuestionIndex = 0;
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String userChoice) {
    final currentQuestion = myQuiz.questions[currentQuestionIndex];
    
    final answer = Answer(
      questionId: currentQuestion.id,
      userChoice: userChoice,
    );
    
    currentAnswers.add(answer);

    if (currentQuestionIndex < myQuiz.questions.length - 1) {
      // Go to next question
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Quiz Finished: Create Submission and Save to History
      final submission = Submission(answers: currentAnswers);
      // myQuiz.addSubmission(submission);

      setState(() {
        submissionHistory.add(submission);
        activeScreen = 'result-screen';
      });
    }
  }

  // 3. Navigation Helpers
  void showHistory() {
    setState(() {
      activeScreen = 'history-screen';
    });
  }

  void backToStart() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(
      onStart: startQuiz, 
      quizTitle: myQuiz.title
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        question: myQuiz.questions[currentQuestionIndex],
        onSelectAnswer: chooseAnswer,
      );
    } 
    
    if (activeScreen == 'result-screen') {
      final lastSubmission = submissionHistory.last;
      screenWidget = ResultScreen(
        score: lastSubmission.getScore(myQuiz.questions),
        total: myQuiz.questions.length,
        onRestart: startQuiz,
        onViewHistory: showHistory,
      );
    }

    if (activeScreen == 'history-screen') {
      screenWidget = HistoryScreen(
        history: submissionHistory,
        totalQuestions: myQuiz.questions.length,
        onBack: backToStart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}