import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ActualLogin.dart';
import 'LoginScreen.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                      child: Container(
                        padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(fontSize: 24),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(fontSize: 24),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(fontSize: 24),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(fontSize: 24),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        language ? 'Change Phone number' : 'ফোন নম্বর পরিবর্তন',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue[600],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
    );
  }
}
