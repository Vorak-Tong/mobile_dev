import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget{
  final String text;
  final Color cardColor;
  final LinearGradient? gradient;

  const CustomCard({
    super.key,
    required this.text,
    this.cardColor = Colors.blue,
    this.gradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: gradient == null ? cardColor : null,
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}