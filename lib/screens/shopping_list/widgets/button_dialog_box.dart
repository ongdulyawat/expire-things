import 'package:expire_app/constants/styles.dart';
import 'package:flutter/material.dart';

class ButtonDialogBox extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  ButtonDialogBox({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (text == "Save") {
      return MaterialButton(
        onPressed: onPressed,
        color: Styles.bgStartApp,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}
