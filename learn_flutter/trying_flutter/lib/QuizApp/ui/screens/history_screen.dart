import 'package:flutter/material.dart';
import '../../models/submission.dart';
import '../widgets/app_button.dart';

class HistoryScreen extends StatelessWidget {
  final List<Submission> history;
  final int totalQuestions;
  final VoidCallback onBack;

  const HistoryScreen({
    super.key,
    required this.history,
    required this.totalQuestions,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text("Score History", style: TextStyle(color: Colors.white, fontSize: 24)),
        Expanded(
          child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (ctx, index) {
              final sub = history[index];
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.white),
                title: Text("Attempt ${index + 1}", style: const TextStyle(color: Colors.white)),
                subtitle: Text(sub.timestamp.toString().substring(0, 16), style: const TextStyle(color: Colors.white70)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              );
            },
          ),
        ),
        AppButton(label: "Back to Home", onTap: onBack),
        const SizedBox(height: 20),
      ],
    );
  }
}