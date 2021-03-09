import 'package:flutter/material.dart';

const Color colorRojo = Color(0xffFE0000);

class TextMenuLateral extends StatelessWidget {
  final String text;
  TextMenuLateral({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }
}
