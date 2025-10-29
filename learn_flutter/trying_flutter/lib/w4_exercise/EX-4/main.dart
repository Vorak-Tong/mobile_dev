import 'package:flutter/material.dart';
import 'custom_card.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(60),
          child: Column(
            children: [
              CustomCard(
                text: 'OOP', 
                cardColor: Colors.blue.shade100,
              ),
              CustomCard(
                text: 'DART', 
                cardColor: Colors.blue.shade300,
              ),
              CustomCard(
                text: 'FLUTTER', 
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.blue.shade300,
                    Colors.blue.shade600,
                    Colors.blue.shade900,
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    )
  );
}