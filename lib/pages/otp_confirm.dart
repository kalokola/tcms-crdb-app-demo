import 'dart:async';
import 'package:bots/bigtext.dart';
import 'package:bots/pages/customer_home.dart';
import 'package:bots/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:bots/worker/api.dart';

class OTPConfirmPage extends StatefulWidget {
  // these are attributes received by the class from an external screen

  final bool isStaff;
  final String? contact;
  final bool? start;
  const OTPConfirmPage(
      {Key? key, this.start, this.contact, required this.isStaff})
      : super(key: key);

  @override
  State<OTPConfirmPage> createState() => _OTPConfirmPageState();
}

class _OTPConfirmPageState extends State<OTPConfirmPage> {
  // originate from this class and can be modified as the state changes  
  // go to their defaults when you navigate to it
  TextEditingController _otpToken = TextEditingController();
  List<String> message = ["sent", "re-sent"];
  int index = 0;

  @override
  void dispose() {
    _otpToken.dispose();
    super.dispose();
  }

  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);
  bool isTimedOut = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    setState(() => myDuration = Duration(minutes: 1));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        isTimedOut = true;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = myDuration.inMinutes;
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            bigText(
              text: "Verification",
              size: 20,
            ),
            SizedBox(height: 20),
            Center(
                child: Text(isTimedOut
                    ? "Request a new OTP Token"
                    : 'WhatsApp OTP ${message[index]} to ${widget.contact ?? 'you.'}')),
            SizedBox(height: 10),
            TextFormField(
                validator: (value) {
                  if (value==null) {
                    return '* Please enter Contact No.';
                  }else if (value.length>10||value.length<10){
                    return '* Phone number must be 10 digit';
                  }
                  return null;
                },
                controller: _otpToken,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  helperText: isTimedOut
                      ? "OTP arrived at ${widget.contact}"
                      : 'Will arrive within $minutes:$seconds',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Enter OTP',
                  //labelText: 'Email Address',
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('CONFIRM'),
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
                    String otpToken = _otpToken.text;

                    if (widget.isStaff) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CustomerHomePage()));
                    }
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () => {
                    setState(() => this.index = 1),
                    resetTimer(),
                    //startTimer(),
                    if (widget.isStaff)
                      {}
                    else
                      {sendOTP(phone: widget.contact.toString())}
                  },
                  icon: Icon(Icons.refresh),
                  iconSize: 40,
                  tooltip: 'Resend OTP',
                  color: Color.fromARGB(255, 13, 63, 150),
                  hoverColor: Colors.deepOrangeAccent,
                )
              ],
            )
          ],
        ))),
      ),
    );
  }
}
