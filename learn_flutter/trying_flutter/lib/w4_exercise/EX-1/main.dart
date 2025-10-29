import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 172, 200),
        body: Center(
          child: Text(
            'Hello My name is Vorak',
            style: TextStyle(
              fontSize: 50,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}