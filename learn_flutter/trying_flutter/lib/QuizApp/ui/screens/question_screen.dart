import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onSelectAnswer;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 30),
            ...question.choices.map((choice){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppButton(
                  label: choice, 
                  onTap: () => onSelectAnswer(choice), 
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}