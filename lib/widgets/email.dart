import 'package:flutter/material.dart';

Widget emailField() {
  return Padding(padding: const EdgeInsets.only(left:30, right:30,bottom:30),
  child: TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Email Address'),
  )
  );
}
