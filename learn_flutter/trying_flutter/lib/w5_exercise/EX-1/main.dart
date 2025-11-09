import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icon(Icons.travel_explore, color: Colors.white, size: 30),
                color: Color.fromARGB(255, 102, 187, 106),
              ),

              SizedBox(height: 10),

              HobbyCard(
                title: "Skating",
                icon: Icon(Icons.skateboarding, color: Colors.white, size: 30),
                color: Color.fromARGB(255, 83, 115, 160),
              ),

              SizedBox(height: 10),

              HobbyCard(
                title: "Music",
                icon: Icon(Icons.music_note, color: Colors.white, size: 30),
                color: Color.fromARGB(255, 111, 11, 63),
              ),
            ],
          ),
        ),
      ),
    )
  );
}

class HobbyCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color color;

  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(20), child: icon),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}