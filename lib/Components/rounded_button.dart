import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function()? onPressed;

  const RoundedButton(
      {required this.color, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.lightBlueAccent,
        child: MaterialButton(
          minWidth: 200.0,
          height: 45.0,
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
