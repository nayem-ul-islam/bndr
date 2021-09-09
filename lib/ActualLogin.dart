import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Report.dart';
import 'LoginScreen.dart';

class ActualLogin extends StatefulWidget {
  const ActualLogin({Key? key}) : super(key: key);

  @override
  _ActualLoginState createState() => _ActualLoginState();
}

class _ActualLoginState extends State<ActualLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/download.png',
              height: 150.0,
              width: 150.0,
            ),
            Container(
              child: Text(
                language ? 'Login' : 'প্রবেশ করুন',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[900],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: TextField(
                  style: TextStyle(
                    fontSize: 18.39,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    hintText: language
                        ? "Enter your Patient's Id/BNDR Id/Patient's Center Id/Mobile Number"
                        : "আপনার রোগীর আইডি লিখুন/বিএনডিআর আইডি/রোগীর কেন্দ্রের আইডি/মোবাইল নম্বর",
                  ),
                ),
              ),
              margin: EdgeInsets.fromLTRB(42.0, 10.1428, 42.0, 10.1428),
            ),
            Container(
              child: Center(
                child: TextField(
                  style: TextStyle(
                    fontSize: 18.39,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    hintText: language
                        ? 'Enter your password here'
                        : 'এখানে আপনার পাসওয়ার্ড লিখুন',
                  ),
                ),
              ),
              margin: EdgeInsets.fromLTRB(42.0, 10.1428, 42.0, 10.1428),
            ),
            SizedBox(
              height: 26,
            ),
            Container(
              width: 330.0,
              height: 75.0,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Report(),
                    ),
                  );
                },
                child: Padding(
                  child: Text(language ? 'Login' : 'প্রবেশ'),
                  padding: EdgeInsets.all(20),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  textStyle: TextStyle(
                    fontSize: 30.0,
                  ),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(),
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
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
                            ? 'Forget password?'
                            : 'পাসওয়ার্ড ভুলে গেছেন?',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue[900],
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
            Container(
              padding: EdgeInsets.only(left: 110, right: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(
                          language ? 'Language' : 'ভাষা',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'বাংলা',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'English',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
          ],
        ),
      ),
    );
  }
}
