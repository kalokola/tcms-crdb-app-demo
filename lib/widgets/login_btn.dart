import 'package:bots/pages/root_page.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String cardNo;
  final String pinCode;

  LoginButton({Key? key, required this.cardNo, required this.pinCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (cardNo.trim() == cardNo.trim()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            print('User Not logged in ');
            //print('megan ${cardNo.runtimeType}');
          }
        },
        child: Text('Login'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)));
  }
}
