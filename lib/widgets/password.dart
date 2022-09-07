import 'package:flutter/material.dart';

Widget passwordField() {
  return Padding(padding: const EdgeInsets.only(left:30, right:30,bottom:10),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Password'),
  )
  );
}
