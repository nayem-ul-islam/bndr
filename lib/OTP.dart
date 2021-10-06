//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ActualLogin.dart';
import 'LoginScreen.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

//import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';

class OTP extends StatefulWidget {
  final String password;
  OTP(this.password);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // final TextEditingController _phoneNumberController = TextEditingController();

  // late String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 50),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        language ? 'OTP Verification' : 'ওটিপি যাচাইকরণ',
                        style: TextStyle(fontSize: 23.0),
                      ),
                      SizedBox(
                        height: 55.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text(
                                language
                                    ? 'We have send you a code on your mobile number'
                                    : 'আমরা আপনার নাম্বারে আপনাকে একটি কোড পাঠিয়েছি',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text(
                                language
                                    ? 'Enter the code send to ****03'
                                    : 'কোডটি প্রেরণ করুন ****0৩ এ',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.center,
                          fieldWidth: 55,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 17),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 85, right: 15, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Text(
                            language ? "Didn't received OTP?" : 'ওটিপি পাননি?',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            language ? 'Resend OTP' : 'ওটিপি পুনরায় পাঠান',
                            style: TextStyle(fontSize: 15.0, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          language
                              ? 'Change Phone number'
                              : 'ফোন নম্বর পরিবর্তন',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue[600],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                type: '',
                                userId: '',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: 330.0,
                height: 75.0,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActualLogin(),
                      ),
                    );
                  },
                  child: Padding(
                    child: Text(
                      language ? 'VERIFY & PROCEED' : 'যাচাই & প্রসেস',
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    textStyle: TextStyle(
                      fontSize: 25.0,
                    ),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
