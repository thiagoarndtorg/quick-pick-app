import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  const ButtonApp({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        textScaleFactor: 1.1,
        style:
            TextStyle(fontWeight: FontWeight.bold, color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9), // <-- Radius
        ),
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      onPressed: onPressed,
    );
  }
}
