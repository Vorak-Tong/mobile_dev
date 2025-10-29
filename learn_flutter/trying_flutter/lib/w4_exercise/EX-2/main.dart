import 'package:flutter/material.dart';

void main() { 
  runApp( 
    MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(40),
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Center(
              child: Text(
                'CADT STUDENT',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          ),
        ),
      )
    ),
  );
}