import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'ActualLogin.dart';
//import 'LoginScreen.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

//import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class OTP extends StatefulWidget {
  final String phn;
  OTP(this.phn);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _smsController = TextEditingController();
  // String _verificationId = '';
  // final SmsAutoFill _autoFill = SmsAutoFill();
  @override
  void initState() {
    phoneNumberVerification();
    super.initState();
  }

  late String strVerificationId;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> phoneNumberVerification() async {
    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {};

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) async {
      strVerificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      strVerificationId = verificationId;
    };

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+88${widget.phn}',
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {}
  }

  TextEditingController pincontroller = TextEditingController();
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
                                    ? 'Enter the code send to ${widget.phn}'
                                    : 'কোডটি প্রেরণ করুন ${widget.phn} এ',
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
                            pincontroller.text = pin;
                          },
                          onCompleted: (pin) {
                            pincontroller.text = pin;
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
                          GestureDetector(
                            onTap: phoneNumberVerification,
                            child: Text(
                              language ? 'Resend OTP' : 'ওটিপি পুনরায় পাঠান',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              //   width: MediaQuery.of(context).size.width,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: <Widget>[
              //         GestureDetector(
              //           child: Text(
              //             language
              //                 ? 'Change Phone number'
              //                 : 'ফোন নম্বর পরিবর্তন',
              //             style: TextStyle(
              //               fontSize: 15.0,
              //               color: Colors.blue[600],
              //             ),
              //           ),
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => LoginScreen(
              //                   type: '',
              //                   userId: '',
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: 330.0,
                height: 75.0,
                child: OutlinedButton(
                  onPressed: () async {
                    try {
                      final AuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: strVerificationId,
                        smsCode: pincontroller.text,
                      );

                      final User? user =
                          (await firebaseAuth.signInWithCredential(credential))
                              .user;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('authenticate', true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActualLogin(),
                        ),
                      );
                    } catch (e) {
                      Get.snackbar('Failed ', e.toString());
                    }
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
