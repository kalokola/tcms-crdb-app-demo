import 'package:bots/bigtext.dart';
import 'package:bots/pages/customer_login.dart';
import 'package:bots/pages/staff_login.dart';
import 'package:flutter/material.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            LoginImage(),
            bigText(text: "Electronic Cheque System", size: 15),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text(
                          'Client',
                          style: TextStyle(fontSize: 17),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(150, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerLoginPage()));
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text('Staff',style: TextStyle(fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(150, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StaffLoginPage()));
                  },
                ),
              ],
            )
          ],
        ))),
      ),
    );
  }
}
