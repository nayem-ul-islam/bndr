import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'OTP.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputTaker(
                      takeIcon: false,
                      title: language ? 'Full Name' : 'পুরো নাম',
                      hints: language ? 'Farook Azam Khan' : 'ফারুক আজম খান',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputTaker(
                      takeIcon: true,
                      title: language ? 'Phone Number' : 'ফোন নম্বর',
                      hints: language ? '01916851203' : '০১৯১৬৮৫১২০৩',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputTaker(
                      takeIcon: false,
                      title: language ? 'BNDR ID' : 'বিএনডিআর আইডি',
                      hints: language
                          ? 'CTH123151220BNDR0000001'
                          : 'CTH১২৩১৫১২২০BNDR০০০০০০১',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputTaker(
                      takeIcon: false,
                      title: language ? 'Guide book No.' : 'গাইড বই নং.',
                      hints: language ? 'Book7124356478' : 'Book৭১২৪৩৫৬৪৭৮',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputTaker(
                      takeIcon: false,
                      title: language ? 'Center ID' : 'কেন্দ্রের আইডি',
                      hints: language ? 'MP00001/17' : 'MP০০০০১/১৭',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputTaker(
                      takeIcon: false,
                      title: language
                          ? 'Registration Center'
                          : 'নিবন্ধকরণ কেন্দ্র',
                      hints: language ? 'BIRDEM-1' : 'বারডেম -১',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                language ? 'Password' : 'পাসওয়ার্ড',
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Container(
              width: 370.0,
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: language ? '6-15 Characters' : '৬-১৫ অক্ষর',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                language ? 'Confirm Password' : 'পাসওয়ার্ড নিশ্চিত করুন',
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Container(
              width: 370.0,
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: language ? '6-15 Characters' : '৬-১৫ অক্ষর',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 137.0,
                  height: 62.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Padding(
                      child: Text(language ? 'Cancel' : 'বাতিল'),
                      padding: EdgeInsets.all(20),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.black38),
                    ),
                  ),
                  margin: EdgeInsets.all(12.0),
                ),
                Container(
                  width: 137.0,
                  height: 62.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTP(),
                        ),
                      );
                    },
                    child: Padding(
                      child: Text(language ? 'Login' : 'প্রবেশ'),
                      padding: EdgeInsets.all(20),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      primary: Colors.blue[900],
                      onPrimary: Colors.white,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.blue.shade900),
                    ),
                  ),
                  margin: EdgeInsets.all(30.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InputTaker extends StatelessWidget {
  final String title;
  final bool takeIcon;
  final String hints;
  InputTaker(
      {required this.title, required this.takeIcon, required this.hints});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
                takeIcon
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(Icons.mode),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            height: 40,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: hints,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
