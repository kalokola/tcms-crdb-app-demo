import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:bots/bigtext.dart';
import 'package:bots/pages/otp_confirm.dart';
import 'package:bots/worker/api.dart';

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({Key? key}) : super(key: key);

  @override
  State<CustomerLoginPage> createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController controller = TextEditingController();
  String initialCountry = 'TZ';
  PhoneNumber number = PhoneNumber(isoCode: 'TZ', dialCode: '+255');
  // thsese should be created in the state class
  TextEditingController _cardCT = TextEditingController();
  TextEditingController _pinCT = TextEditingController();

  @override
  void dispose() {
    _cardCT.dispose();
    _pinCT.dispose();
    controller.dispose();

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
              bigText(text: "CLIENT LOGIN", size: 20),
              SizedBox(height: 20),
              TextField(
                  controller: _cardCT,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_balance_wallet),
                    border: OutlineInputBorder(),
                    hintText: 'Card Number',
                    //labelText: 'Password',
                  )),
              SizedBox(height: 20),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  //var simu = number.phoneNumber;
                  //print("aaa ${number.phoneNumber}");
                },
                onInputValidated: (bool value) {
                  //print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: false),
                inputBorder: OutlineInputBorder(),
              ),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                      if (!isLoading) {
                        setState(() => this.isLoading = true);
                      }
                      String cardNo = _cardCT.text;
                      String pinCode = _pinCT.text;
                      String phoneNo =
                          "${number.dialCode}${num.parse(controller.text).toString()}"
                              .replaceAll("+", "");

                      sendOTP(phone: phoneNo);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPConfirmPage(
                                  isStaff: false, contact: phoneNo)));
                    })
              ])
            ],
          )))),
    );
  }


}
