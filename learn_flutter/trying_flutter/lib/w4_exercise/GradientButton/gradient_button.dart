import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{
  final String text;
  final Color start;
  final Color end;

  const GradientButton({
    super.key,
    required this.text,
    required this.start,
    required this.end
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [start, end]
        )
      ),
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white
        ),
      ),
    );
  }
}