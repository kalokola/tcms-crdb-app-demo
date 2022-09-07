import 'package:flutter/material.dart';

Widget LoginImage() {
  return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
      child: Image.asset('assets/images/logo.png'));
}

class bigText extends StatefulWidget {
  final String text;
  final double size;
  const bigText({Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  State<bigText> createState() => _bigTextState();
}

class _bigTextState extends State<bigText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          color: const Color(0xFFff332d2b),
          fontSize: widget.size,
          fontWeight: FontWeight.bold,
        ));
  }
}
