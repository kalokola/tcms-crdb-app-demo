import 'package:bots/bigtext.dart';
import 'package:bots/pages/otp_confirm.dart';
import 'package:flutter/material.dart';

class StaffLoginPage extends StatefulWidget {
  const StaffLoginPage({Key? key}) : super(key: key);

  @override
  State<StaffLoginPage> createState() => _StaffLoginPageState();
}

class _StaffLoginPageState extends State<StaffLoginPage> {

  TextEditingController _cardCT = TextEditingController();
  TextEditingController _pinCT = TextEditingController();

  @override
  void dispose() {
    _cardCT.dispose();
    _pinCT.dispose();

    super.dispose();
  }

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
            bigText(text: "STAFF LOGIN", size: 20),
            SizedBox(height: 20),
            TextField(
                controller: _cardCT,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(),
                  hintText: 'Staff ID',
                  //labelText: 'Email Address',
                )),
            SizedBox(height: 20),
            TextField(
                controller: _pinCT,
                obscureText: true,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Pin Code',
                  //labelText: 'Password',
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                    String cardNo = _cardCT.text;
                    String pinCode = _pinCT.text;
                   
                      Navigator.push(context,
                MaterialPageRoute(builder: (context) => OTPConfirmPage(isStaff: true)));
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
