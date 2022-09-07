import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Creds {
  static String bearerTOKEN = "EAAHxS8kBFHYBAFJnCGfbKHNY2xezXl35ZCv7SIoclfjgArkcHM4DibzZBoFTXm8fbUUvwynFYM2acX9HsuEOU0ZBwtthv54Jzxbu8sSw8zXEUkCACZCZCZCnIOQ4D6wqydviW6wJHLITZAXvVjgZAXB1334fCDqMsIhgvjyR77nyBKCiP3UvXGZBV";
  static String botID = "101669789344947";
}

Future sendOTP({required String phone}) async {
  int otpToken = Random().nextInt(199999);
  //Map configs = jsonDecode(await File('assets/configs.json').readAsString());
  Map data = {
    "messaging_product": "whatsapp",
    "recipient_type": "individual",
    "to": phone,
    "type": "text",
    "text": {
      "preview_url": false,
      "body": "Your WhatsApp OTP token is $otpToken"
    }
  };
  String rootUrl =
      "https://graph.facebook.com/v13.0/${Creds.botID}/messages";
  return await http.post(Uri.parse(rootUrl), body: jsonEncode(data), headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${Creds.bearerTOKEN}"
  });
}
