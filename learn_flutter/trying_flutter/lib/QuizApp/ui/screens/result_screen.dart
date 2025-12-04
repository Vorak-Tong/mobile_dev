import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $score on $total!",
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          AppButton(label: "Restart Quiz", onTap: onRestart),
          const SizedBox(height: 20),
          TextButton.icon(
             onPressed: onViewHistory,
             icon: const Icon(Icons.history, color: Colors.white),
             label: const Text("View History", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}