import 'package:flutter/material.dart';
import 'gradient_button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradientButton(text: 'Hello 1', start: Colors.blue, end: Colors.red),
              GradientButton(text: 'Hello 2', start: Colors.blue, end: Colors.red),
              GradientButton(text: 'Hello 3', start: Colors.blue, end: Colors.red),
            ],
          ),
        )
      ),
    ),
  );
}