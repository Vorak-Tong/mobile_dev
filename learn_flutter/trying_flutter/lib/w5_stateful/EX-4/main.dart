import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: const Text('My Score'),
          backgroundColor: Colors.green[400],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ScoreCard(title: 'My Score in Dart'),
              SizedBox(height: 20),
              ScoreCard(title: 'My Score in Flutter'),
              SizedBox(height: 20),
              ScoreCard(title: 'My Score in React'),
            ],
          ),
        ),
      ),
    )
  );
}

class ScoreCard extends StatefulWidget {
  final String title;
  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {

  int _score = 1;

  void _addScore(){
    setState(() {
      if(_score < 10){
        _score++;
      }
    });
  }

  void _removeScore(){
    setState(() {
      if(_score > 0){
        _score--;
      }
    });
  }

  Color _getProgressColor(){
    if(_score >= 8){
      return Colors.green;
    }
    if(_score >= 5){
      return Colors.yellow;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3)
          ),
        ],
      ),
      child: Column(
        children: [
          // title of subject
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // remove score button
              IconButton(
                onPressed: _removeScore, 
                iconSize: 30,
                icon: const Icon(Icons.remove)
              ),
              const SizedBox(width: 20),

              // display score
              Text(
                '$_score',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),

              // add score button
              IconButton(
                onPressed: _addScore, 
                iconSize: 30,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 15),

          Stack(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                ),
              ),

              // ask AI about FractionallSizedBox for set width based on score
              FractionallySizedBox(
                widthFactor: _score /10,
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: _getProgressColor(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}