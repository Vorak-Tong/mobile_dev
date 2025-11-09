import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Button')),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomButton(text: 'Submit', icon: Icons.check),
              CustomButton.secondary(
                text: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
              ),
              CustomButton.disabled(
                text: 'Account', 
                icon: Icons.person,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    )
  );
}

enum Type{
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color buttonColor;
  const Type(this.buttonColor);
}

enum IconPosition{
  left,
  right
}

class CustomButton extends StatelessWidget{
  final String text;
  final IconData icon;
  final Type type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    this.type = Type.primary,
    this.iconPosition = IconPosition.left,
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.primary;

  const CustomButton.secondary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.secondary;

  const CustomButton.disabled({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.disabled;

  @override
  Widget build(BuildContext context) {
    final contentColor = type == Type.disabled
        ? const Color.fromARGB(255, 72, 72, 72)
        : Colors.white;

    const SizedBox spacing = SizedBox(width: 8);
    final iconWidget = Icon(icon, color: contentColor, size: 20);
    final textWidget = Text(
      text,
      style: TextStyle(
        color: contentColor,
        fontSize: 16,
      ),
    );

    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: type.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [iconWidget, spacing, textWidget]
              : [textWidget, spacing, iconWidget],
        ),
      ),
    );
  }
}